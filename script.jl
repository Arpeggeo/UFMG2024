using GeoStats
using PairPlots
using DrillHoles
using CSV

import GLMakie as Mke

## Load drill hole files

collar = Collar(CSV.File("data/collar.csv"), holeid="HoleID")
survey = Survey(CSV.File("data/survey.csv"), holeid="HoleID", at="Depth_m")
interv = Interval(CSV.File("data/samples.csv"), holeid="HoleID", from="From_m", to="To_m")
interp = Interval(CSV.File("data/domains.csv"))

## Perform desurveying

holes = desurvey(collar, survey, [interv, interp])

holes |> viewer

## Select and clean variables

clean = holes |> Select(
                   2 => "Ag [ppm]",
                   10 => "Pb [percent]",
                   11 => "Zn [percent]",
                   3 => "ρ [Mg/m^3]",
                   6 => "Domain",
                   8 => "Recovery") |>
                 DropMissing() |>
                 Unitify() |>
                 Map("Recovery" => (r -> ifelse(r == "N", "High", "Low")) => "Recovery")

## Zoom in Jason zone

jason = clean |> Filter(x -> occursin("Jason", x.Domain))

jason |> viewer

## Multivariate analysis

chemi = jason |> Select(1:3)
densi = jason |> Select(4)
categ = jason |> Select(5:6)

chemi |> values |> pairplot

## Compositional analysis

ratio = chemi |> CLR()

ratio |> values |> pairplot

## Geomet recovery

table = ratio |> values

color = levelcode.(categorical(categ.Domain))
color = ifelse.(categ.Recovery .== "High", "teal", "red")

pairplot(
  table => (
    PairPlots.Scatter(color=color),
    PairPlots.MarginDensity(),
  )
)

## Dataset for geostatistical learning

tableGL = [ratio categ]

## Dataset for geostatistical interpolation

tableGI = [chemi densi]

## Definition of grid

bbox = boundingbox(tableGI.geometry)

grid = CartesianGrid(minimum(bbox), maximum(bbox), (50u"m", 50u"m", 20u"m"))

viz(tableGI.geometry)
viz!(grid, showsegments = true, alpha = 0.2)
Mke.current_figure()

## Geostatistical interpolation

gbm = tableGI |> InterpolateNeighbors(grid, IDW())

gbm |> viewer

## Geostatistical learning

model = RandomForestClassifier()

rec = gbm |> Select(1:3) |> CLR() |> Learn(tableGL, model, [1, 2, 3] => "Recovery")

gmbm = [gbm rec]

gmbm |> viewer