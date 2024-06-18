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

highlow(r) = r == "N" ? "High" : "Low"

clean = holes |> Select(
                   2 => "Ag [ppm]",
                   10 => "Pb [percent]",
                   11 => "Zn [percent]",
                   3 => "ρ [Mg/m^3]",
                   6 => "DOMAIN",
                   8 => "RECOVERY") |>
                 DropMissing() |>
                 Unitify() |>
                 Map("RECOVERY" => highlow => "RECOVERY")

## Zoom in Jason zone

jason = clean |> Filter(s -> occursin("Jason", s.DOMAIN))

jason |> viewer

## Grid definition

bbox = boundingbox(jason.geometry)

grid = CartesianGrid(minimum(bbox), maximum(bbox), (50u"m", 50u"m", 20u"m"))

viz(jason.geometry)
viz!(grid, showsegments = true, alpha = 0.2)
Mke.current_figure()

## Geostatistical block model

gbm = jason |> Select(1:4) |> InterpolateNeighbors(grid, IDW())

gbm |> viewer

## Multivariate analysis

chemi = jason |> Select(1:3)

recov = jason |> Select(6)

chemi |> values |> pairplot

## Compositional analysis

ratio = chemi |> CLR()

ratio |> values |> pairplot

## Learneability of recovery

table = ratio |> values

color = ifelse.(jason.RECOVERY .== "High", "teal", "red")

pairplot(
  table => (
  PairPlots.Scatter(color=color, markersize=2),
  PairPlots.MarginDensity(),
  )
)

## Learning model

train = [ratio recov]

model = RandomForestClassifier()

## Prediction of recovery

clr = gbm |> Select(1:3) |> CLR()

rec = clr |> Learn(train, model, [1, 2, 3] => "RECOVERY")

## Geometallurgical model

gmbm = [gbm rec]

gmbm |> viewer
