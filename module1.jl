### A Pluto.jl notebook ###
# v0.19.42

using Markdown
using InteractiveUtils

# ╔═╡ 7ce007b8-2cb6-11ef-01b0-89444a2ca3d0
begin
	using PlutoTeachingTools
	import PlutoUI

	# add table of contents to the side
	PlutoUI.TableOfContents(title="Contents")
end

# ╔═╡ 4d2788f9-5549-42a2-80af-eb867d9a0dc7
using CSV

# ╔═╡ 9942d85f-28a6-4728-a61c-0e2d3a927fbf
using DataFrames

# ╔═╡ c51995b2-f7e8-416a-9720-e4b62fe362cb
html"""
<div style="
position: absolute;
width: calc(100% - 30px);
border: 50vw solid #444444;
border-top: 500px solid #048282;
border-bottom: none;
box-sizing: content-box;
left: calc(-50vw + 15px);
top: -500px;
height: 500px;
pointer-events: none;
"></div>
<div style="
height: 500px;
width: 100%;
background: #444444;
color: #fff;
padding-top: 68px;
">
<span style="
font-family: Rubik, serif;
font-weight: 700;
font-feature-settings: 'lnum', 'pnum';
"> <p style="
font-size: 1.5rem;
opacity: .8;
"><em>Minicurso:</em></p>
<p style="text-align: center; font-size: 2rem;">
<em>Geociência de dados na mineração</em>
</p>
<p style="
font-size: 1.5rem;
text-align: center;
opacity: .8;
"><em>preparado por Arpeggeo® Technologies</em></p>
<center>
<a href="https://arpeggeo.tech"><img src="https://i.imgur.com/xgq72Z7.png" height=200></a>
</center>
<style>
body {
overflow-x: hidden;
}
</style>"""

# ╔═╡ 5e637f85-cae6-43b1-9f7f-886ac2aa5e55
md"""
# Módulo I

**Instrutor:** [Júlio Hoffimann](https://juliohm.github.io)
**E-mail:** [juliohm@arpeggeo.tech](mailto:juliohm@arpeggeo.tech)
"""

# ╔═╡ b10a6217-c867-48fb-bd37-93d878cbe8ef
html"""
<head>
    <style>
    {
        box-sizing: border-box;
    }
    /* Set additional styling options for the columns*/
    .column {
    float: left;
    width: 50%;
    }

    .row:after {
    content: "";
    display: table;
    clear: both;
    }
    </style>
</head>
<body>
<div class="row">
        <div class="column";">
            <h4>Objetivos</h4>
            <ol>
  				<li>Introduzir o básico da linguagem Julia</li>
  				<li>Aprender a utilizar notebooks Pluto</li>
  				<li>Aprender a manipular dados tabulares</li>
				<li>Preparar participantes para o Módulo II</li>
			</ol>
        </div>
        <div class="column";">
            <img src="https://i.imgur.com/0Y2bG17.jpg" width=120>
        </div>
</div>
</body>
"""

# ╔═╡ 5d9e326e-0f4d-43b9-bfd2-33ce23f5d65f
md"""
## Primeiros passos em Julia 👣

### Variáveis e funções
"""

# ╔═╡ 04841b1c-c213-402e-ac0f-941dc3644ce0
md"""
No [Pluto](https://github.com/fonsp/Pluto.jl) cada cécula se refere a uma única expressão, e.g. definição de variável:
"""

# ╔═╡ 57cdd282-26e9-41b7-9865-1b0da23b3286
name = "Vanessa"

# ╔═╡ 78c9e043-aa08-441f-8510-d776123c43b2
country = "🇧🇷"

# ╔═╡ a8dcc676-27d6-478f-ba50-e1c33f9eaff3
age = 25

# ╔═╡ a6738c73-a07c-4a62-b15d-20d2d83b2d76
md"""
Essas variáveis podem ser utilizadas em qualquer outra célula para customizar o notebook:
"""

# ╔═╡ 32ee9391-4ad7-4f65-a689-3c28815e406b
"Bem-vinda $name $(country)! Me disseram que você tem $age anos!"

# ╔═╡ e166f30e-e300-4907-8815-e0b3dc0f387e
md"""
Para definir múltiplas variáveis em uma única célula, podemos fazer uso de `begin`/`end` ou `let`/`end`:
"""

# ╔═╡ 9489c7ee-b462-4fc4-b507-16ba22822621
let
	👍🏻 = +1

	👎🏻 = -1

	👍🏻 + 👎🏻
end

# ╔═╡ b6d49f79-fdee-4057-98f1-5891930c63b7
md"""
Podemos utilizar símbolos matemáticos para as nossas variáveis:
"""

# ╔═╡ 0860cb24-6a97-4dc6-89ce-d651bff8372e
α, β, τ = 1.5, 2.6, 0.5

# ╔═╡ 587eba9e-eaa4-4dca-a2e5-55acd3c1f9b4
md"""
E definir funções de forma bastante conveniente:
"""

# ╔═╡ 733d4d39-49b4-435d-b40f-b5c87f8c906b
f(α, β) = 2α + β

# ╔═╡ 7bf89559-1778-4dd5-8f90-2d7c0223a6f6
function g(τ)
	return τ^2
end

# ╔═╡ 6f460103-637d-454a-9326-c391f9cb0109
h = α -> √α

# ╔═╡ 8d8084d6-98ca-4a38-aad5-37a80bb0386c
f(1, 2) + g(3) + h(4)

# ╔═╡ 6afc92dd-f57e-4d76-8dac-8a50ba0d7d08
md"""
##### Exercício

Escreva uma função `volume` que retorna o volume da esfera de raio `r`:
"""

# ╔═╡ 9e080505-d23f-4cfd-b824-c35ad4608b97
volume(r) = missing

# ╔═╡ cf5e6564-e64a-4a71-9165-89d0515c23ea
begin
	scored1 = false
	_vol = volume(3)
	if ismissing(_vol)
		still_missing()
	elseif _vol ≈ (4/3)*π*3^3
		scored1 = true
		correct()
	elseif _vol isa Number
		almost(md"A fórmula não está certa...")
	else
		keep_working()
	end
end

# ╔═╡ be6bc51c-e510-401e-884a-b568a637c2a9
hint(md"A fórmula é $\frac{4}{3}\pi r^3$...")

# ╔═╡ 5a32aabd-d722-4adf-8df1-1b0e0e0fddfc
md"""
### Tipos de coleções

Vários tipos de coleções estão disponíveis para armazenar um conjunto de valores: tuplas, vetores, matrizes, tensores, dicionários, etc.
"""

# ╔═╡ 0e8b7993-5ccb-4688-aa6b-f73a8d9580ad
tuple = (1, 2, 3)

# ╔═╡ 7a2c3621-bc2f-4ab2-83ee-fd5a250fed2e
vector = [1, 2, 3]

# ╔═╡ e553d94f-4579-48ce-988e-c08533f7b94f
matrix = [
	1 2
	3 4
]

# ╔═╡ 418586d6-3a7d-429d-b21d-eb1c5fde7a01
tensor = ones(3, 3, 2)

# ╔═╡ 2ca4625d-bb8d-4e4c-9a72-c19f3d5265e8
dict = Dict(:a => 1, :b => 2)

# ╔═╡ 7b5b0385-dfe3-423b-99f4-b02430751c96
namedtuple = (a = 1, b = 2)

# ╔═╡ 2e7437ba-bee2-4ad9-83f1-fe9d313c4589
md"""
As coleções mais utilizadas em aplicações científicas são os vetores, matrizes, tensores, ou mais geralmente o que chamamos de `Array` em Julia. Arrays podem ser construídos com notação de lista, o que também é bastante conveniente:
"""

# ╔═╡ 1593fa9c-3b9f-47b2-b2fb-c72e86834d72
[i for i in 1:5]

# ╔═╡ fa3e08c5-9a07-4ba3-b697-bdd6972a9de7
[i for i in 1:5 if isodd(i)]

# ╔═╡ 4e35959b-9e5b-4971-88b1-9521a8ae4952
[i+j for i in 1:3, j in 1:4]

# ╔═╡ 73ab94da-7a17-46f5-94fe-c676e935aede
[i+j for i in 1:3 for j in 1:4]

# ╔═╡ f4ba16a3-4f61-4223-b4d8-1dc0e3f71f06
md"""
###### Exercício

Dado um ângulo `θ` em radianos, escreva uma função `rotation` que retorna a matriz de rotação 2D dada por $R(θ) = \begin{bmatrix}cos(θ) & -sin(θ)\\ sin(θ) & cos(θ)\end{bmatrix}$.
"""

# ╔═╡ d17ea441-64db-4b7e-aec3-89a6bf41eabb
function rotation(θ)
	missing
end

# ╔═╡ 8b443c65-f28d-4b2e-b9e6-26d271087980
begin
	scored2 = false
	_rot = rotation(π)
	if ismissing(_rot)
		still_missing()
	elseif _rot ≈ [cos(π) -sin(π); sin(π) cos(π)]
		scored2 = true
		correct()
	elseif _rot isa Matrix
		almost(md"Trocou `sin` e `cos` talvez?")
	else
		keep_working()
	end
end

# ╔═╡ fd837824-8e51-4211-aa64-e51bb4d87963
hint(md"Escreva \theta e pressione TAB para escrever o símbolo θ")

# ╔═╡ dc1b297d-d471-40a0-b141-4222df2cea1c
md"""
Escreva a função `square` que retorna todos os elementos da coleção `xs` ao quadrado:
"""

# ╔═╡ 6c2cdf6a-3584-4dae-8c52-c14d8bef3807
square(xs) = missing

# ╔═╡ af4fd3a3-345c-4577-ba97-2eb877778a88
begin
	scored3 = false
	_sqr = square([1 2; 3 4])
	if ismissing(_sqr)
		still_missing()
	elseif _sqr == [1 4; 9 16]
		scored3 = true
		correct()
	elseif _sqr == [1, 9, 4, 16]
		almost(md"Tente usar a dica")
	else
		keep_working()
	end
end

# ╔═╡ 21cc242a-624c-46ad-ab39-aea721fcb84e
hint(md"A notação de lista `[f(x) for x in xs]` pode ser bem útil!")

# ╔═╡ 2868ee1d-df68-4cb6-8164-2bb7468bebc5
md"""
### Controle de fluxo

A linguagem oferece os controles de fluxo tradicionais:

```julia
if a > 0 # caso 1
  b = 2b
elseif a < 0 # caso 2
  b = b + 1
else # outros casos
  b = rand()
end
```

e diferentes formas de iteração:

```julia
for x in xs
  # do something with x
end

for i in 1:length(xs)
  # do something with x[i]
end

while condition
  # modify condition
end
```
"""

# ╔═╡ fe42ce0a-052a-45bc-a1fc-32dc673092bc
md"""
##### Exercício

Escreva uma função `emoji` que recebe o nome de um emoji e retorna o símbolo do emoji:

- "diamond" --> 💎
- "tool" --> ⛏️
- "tractor" --> 🚜

Você pode copiar e colar o símbolo de um emoji dentro de uma string `"🚜"` usando `Ctrl+C` e `Ctrl+V` dentro da sua função.
"""

# ╔═╡ 2636fc67-515a-4588-b969-6b76853a7b25
function emoji(name)
	missing
end

# ╔═╡ d24b2d21-5d02-41d3-97f9-917fd9504937
begin
	scored4 = false
	_emj = emoji.(["diamond","tool","tractor"])
	if all(ismissing.(_emj))
		still_missing()
	elseif all(_emj .== ["💎","⛏️","🚜"])
		scored4 = true
		correct()
	elseif _emj ⊆ ["💎","⛏️","🚜"]
		almost(md"Cheque os emojis novamente...")
	else
		keep_working()
	end
end

# ╔═╡ a9d0f756-583d-466c-a979-d8d718ae844a
hint(md"Basta escrever uma sequência de `if name == \"diamond\" return \"💎\" end`")

# ╔═╡ f4c6cb09-5aa1-486f-b2b7-070ea2f541fb
md"""
## Dados tabulares 📑

Investigaremos o conjunto de dados [GeoMet](https://zenodo.org/record/7051975) curado em parceria com a Vale.

Neste notebook faremos apenas o download do arquivo `drillholes.csv`:
"""

# ╔═╡ 0116cc0e-9796-4cc5-b411-680d68bb4cf5
fname = download("https://zenodo.org/record/7051975/files/drillholes.csv?download=1")

# ╔═╡ f90cfcac-5449-4fcc-8d55-732bdf87b853
md"""
Utilizaremos o pacote [CSV.jl](https://csv.juliadata.org/stable) para carregar os dados no notebook, e o pacote [DataFrames.jl](https://dataframes.juliadata.org/stable) para manipular esses dados de forma mais eficiente:
"""

# ╔═╡ 6fe43fcd-3b81-4a0c-bb00-638105841370
md"""
Passamos o nome do arquivo para o `CSV.File`, depois enviamos os dados para o `DataFrame` usando o operador `|>` em Julia, conhecido como operador "pipe":
"""

# ╔═╡ cc6dd382-b0ae-4d6e-8d52-32350f333655
df = CSV.File(fname) |> DataFrame

# ╔═╡ 7a016e79-8059-4de2-97d3-215314d82cfe
md"""
Podemos obter estatísticas básicas de cada coluna da tabela com a função `describe`:
"""

# ╔═╡ c2b05b34-6786-4a2b-9b66-9e141ba9cc56
describe(df)

# ╔═╡ f8733def-513c-4fe7-ba1e-a0499683feef
md"""
Notamos que cada coluna tem um tipo de elemento `eltype` ("element type"). Como o conjunto de dados foi curado, não existem valores faltantes `nmissing` ("number of missing").
"""

# ╔═╡ e3aa7c16-87d6-409c-aa2f-049494a4c755
md"""
### Linhas e colunas

Um `DataFrame` tem linhas e colunas que podem ser acessadas de diferentes maneiras. Antes de acessar esses dados, vejamos como podemos acessar o número de linhas e colunas:
"""

# ╔═╡ 56ed1b16-c63b-4113-910d-87a3e5e5e76e
nrow(df), ncol(df)

# ╔═╡ d9a8d700-b283-4a17-844e-cd435c3a5448
md"""
Podemos acessar o nome das colunas como uma lista de `String`:
"""

# ╔═╡ 72f505bb-6493-49ae-9063-9fb49a9e1b8f
names(df)

# ╔═╡ 9457aa06-2ff3-4142-9871-28f17c41e06d
md"""
ou como uma lista de `Symbol`:
"""

# ╔═╡ 9a0c5906-6424-444b-81e3-dc13c08cf224
propertynames(df)

# ╔═╡ 64d0a448-70c4-4873-bbdd-a3a802eee832
md"""
A linguagem Julia diferencia esses dois tipos, e é bom ter isso em mente. Agora que sabemos como obter o número de linhas e colunas e os nomes das colunas, podemos acessar os dados:
"""

# ╔═╡ e98974d0-8f9a-42a1-9706-bc648af36def
df[1, "Au ppm"]

# ╔═╡ b496aebc-a424-47c9-b31d-e5e767201e1f
df[1:3, "Au ppm"]

# ╔═╡ 769e07db-6708-4ca7-a92a-4d2d62cfbd11
df[1:3, ["Au ppm", "Cu ppm"]]

# ╔═╡ f7c99c3b-d4e5-4354-b5d1-72861ef3861d
df."Au ppm"

# ╔═╡ 42865852-366f-411d-846b-81ba90115117
df.HOLEID

# ╔═╡ af303884-5efa-414c-b1c4-19a7a709069d
md"""
O símbolo `:` pode ser utilizado para manter todas as linhas ou todas as colunas:
"""

# ╔═╡ bc51aa46-4d52-45e6-9a5f-5af6b4aea279
df[:, "Au ppm"]

# ╔═╡ be8792f1-1ea0-4543-a783-fec94192a20a
df[1, :]

# ╔═╡ d554a84d-cb78-49eb-ba47-67158874316a
md"""
Podemos comparar uma coleção de valores com um único valor usando o operador `.` na frente de qualquer operação ou função. Por exemplo, podemos encontrar todas as linhas com teor de `Au ppm` acima de `0.5`:
"""

# ╔═╡ 4b8533f0-fe63-4194-95ca-f528616bbe56
df."Au ppm" .> 0.5

# ╔═╡ 4a3552a7-d10b-4699-8aeb-6b7c15ecd7f4
md"""
ou todas as linhas com `HOLEID` igual a `1`:
"""

# ╔═╡ e4051116-2e1a-4017-9ab6-96b0a598f7e3
df.HOLEID .== 1

# ╔═╡ 5eab850c-a362-45a4-bc95-9e4e443b19be
md"""
### Filtragem de dados

Para responder qualquer pergunta com dados tabulares, nós precisamos saber filtrar as linhas da tabela que são relevantes para o cálculo da resposta. Por exemplo, podemos filtrar todas as amostras para as quais `Au ppm > 0.5`:
"""

# ╔═╡ 0862d0bf-0985-4e12-82eb-6f0d38827914
df[df."Au ppm" .> 0.5, :]

# ╔═╡ bd8ba32b-6097-44f6-bb8b-e1a695ba436d
md"""
##### Exercício

Encontre todas as amostras onde a soma dos teores de `Au` e `Cu` é superior a `0.5`.

Salve o resultado na variável `res`:
"""

# ╔═╡ 438bdf51-ccfb-496e-b30e-24dcef0f969b
res = missing

# ╔═╡ 453ac429-36fa-4f2d-9b73-63bfc7d8a2f7
begin
	scored5 = false
	if ismissing(res)
		still_missing()
	elseif res == df[df."Au ppm" .+ df."Cu ppm" .> 0.5, :]
		scored5 = true
		correct()
	else
		keep_working()
	end
end

# ╔═╡ ef497706-a238-45da-852d-f4b81f47938d
hint(md"Use o último exemplo como ponto de partida.")

# ╔═╡ 2ae585f4-31e7-4c3b-acc8-fb94a3a3e5fc
md"""
### Agrupamento de dados

Para responder perguntas mais avançadas com os dados, precisamos saber agrupar informações que estão dispersas na tabela, mas que fazem parte de um mesmo grupo (e.g. litologia).

As funções `groupby` e `combine` podem ser utilizadas para agrupar as linhas de um mesmo grupo e para combinar as linhas de cada grupo, respectivamente:
"""

# ╔═╡ 5e98f59c-c64d-4946-8b9a-db1ea36f9053
groups = groupby(df, :HOLEID)

# ╔═╡ bbf40228-1acc-4204-aeeb-4ce6c9ae455d
combine(groups, "Au ppm" => sum)

# ╔═╡ 344f12f4-a4c3-49be-b8e5-ef31ace5d1ec
md"""
Podemos renomear o resultado da seguinte forma:
"""

# ╔═╡ 9216e61e-72ad-4ed4-a457-00ed59604fb5
combine(groups, "Au ppm" => sum => "Total")

# ╔═╡ 78368d2b-3c06-48f0-bce8-e4a460cd728f
md"""
## Perguntas? 🔍

No próximo módulo do minicurso construiremos um modelo geometalúrgico 3D com os conceitos básicos cobertos neste primeiro módulo. Se algo não ficou claro, não hesite em perguntar!

![questions](https://media2.giphy.com/media/wH4rY2nPnEnp6/giphy.gif)
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CSV = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
CSV = "~0.10.14"
DataFrames = "~1.6.1"
PlutoTeachingTools = "~0.2.15"
PlutoUI = "~0.7.59"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.4"
manifest_format = "2.0"
project_hash = "bff71bd616da91a5e2a69c9eaec3cc82e3179025"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CSV]]
deps = ["CodecZlib", "Dates", "FilePathsBase", "InlineStrings", "Mmap", "Parsers", "PooledArrays", "PrecompileTools", "SentinelArrays", "Tables", "Unicode", "WeakRefStrings", "WorkerUtilities"]
git-tree-sha1 = "6c834533dc1fabd820c1db03c839bf97e45a3fab"
uuid = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
version = "0.10.14"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "c0216e792f518b39b22212127d4a84dc31e4e386"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.3.5"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "59939d8a997469ee05c4b4944560a820f9ba0d73"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.4"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[deps.Compat]]
deps = ["TOML", "UUIDs"]
git-tree-sha1 = "b1c55339b7c6c350ee89f2c1604299660525b248"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.15.0"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "abe83f3a2f1b857aac70ef8b269080af17764bbe"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.16.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "DataStructures", "Future", "InlineStrings", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrecompileTools", "PrettyTables", "Printf", "REPL", "Random", "Reexport", "SentinelArrays", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "04c738083f29f86e62c8afc341f0967d8717bdb8"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.6.1"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "1d0a14036acb104d9e89698bd408f63ab58cdc82"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.20"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FilePathsBase]]
deps = ["Compat", "Dates", "Mmap", "Printf", "Test", "UUIDs"]
git-tree-sha1 = "9f00e42f8d99fdde64d40c8ea5d14269a2e2c1aa"
uuid = "48062228-2e41-5def-b9a4-89aafe57970f"
version = "0.9.21"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Format]]
git-tree-sha1 = "9c68794ef81b08086aeb32eeaf33531668d5f5fc"
uuid = "1fa38f19-a742-5d3f-a2b9-30dd87b9d5f8"
version = "1.3.7"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "b6d6bfdd7ce25b0f9b2f6b3dd56b2673a66c8770"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.5"

[[deps.InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "9cc2baf75c6d09f9da536ddf58eb2f29dedaf461"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.4.0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InvertedIndices]]
git-tree-sha1 = "0dc7b50b8d436461be01300fd8cd45aa0274b038"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.3.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "a6adc2dcfe4187c40dc7c2c9d2128e326360e90a"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.32"

[[deps.LaTeXStrings]]
git-tree-sha1 = "50901ebc375ed41dbf8058da26f9de442febbbec"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.1"

[[deps.Latexify]]
deps = ["Format", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Requires"]
git-tree-sha1 = "e0b5cd21dc1b44ec6e64f351976f961e6f31d6c4"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.3"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    SymEngineExt = "SymEngine"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.4.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.6.4+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "c6a36b22d2cca0e1a903f00f600991f97bf5f426"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "2.4.6"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "2fa9ee3e63fd3a4f7a9a4f4744a52f4856de82df"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.13"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+1"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "ec4f7fbeab05d7747bdf98eb74d130a2a2ed298d"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.2.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.1.10"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.23+4"

[[deps.OrderedCollections]]
git-tree-sha1 = "dfdf5519f235516220579f949664f1bf44e741c5"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.3"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.10.0"

[[deps.PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[deps.PlutoLinks]]
deps = ["FileWatching", "InteractiveUtils", "Markdown", "PlutoHooks", "Revise", "UUIDs"]
git-tree-sha1 = "8f5fa7056e6dcfb23ac5211de38e6c03f6367794"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0420"
version = "0.1.6"

[[deps.PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "LaTeXStrings", "Latexify", "Markdown", "PlutoLinks", "PlutoUI", "Random"]
git-tree-sha1 = "5d9ab1a4faf25a62bb9d07ef0003396ac258ef1c"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.2.15"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "ab55ee1510ad2af0ff674dbcced5e94921f867a9"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.59"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "36d8b4b899628fb92c2749eb488d884a926614d3"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.3"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[deps.PrettyTables]]
deps = ["Crayons", "LaTeXStrings", "Markdown", "PrecompileTools", "Printf", "Reexport", "StringManipulation", "Tables"]
git-tree-sha1 = "66b20dd35966a748321d3b2537c4584cf40387c7"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "2.3.2"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Revise]]
deps = ["CodeTracking", "Distributed", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "Pkg", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "12aa2d7593df490c407a3bbd8b86b8b515017f3e"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.5.14"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "90b4f68892337554d31cdcdbe19e48989f26c7e6"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.4.3"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "66e0a8e672a0bdfca2c3f5937efb8538b9ddc085"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.2.1"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.10.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.10.0"

[[deps.StringManipulation]]
deps = ["PrecompileTools"]
git-tree-sha1 = "a04cabe79c5f01f4d723cc6704070ada0b9d46d5"
uuid = "892a3eda-7b42-436c-8928-eab12a02cf0e"
version = "0.3.4"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.2.1+1"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits"]
git-tree-sha1 = "cb76cf677714c095e535e3501ac7954732aeea2d"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.11.1"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TranscodingStreams]]
git-tree-sha1 = "a947ea21087caba0a798c5e494d0bb78e3a1a3a0"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.10.9"
weakdeps = ["Random", "Test"]

    [deps.TranscodingStreams.extensions]
    TestExt = ["Test", "Random"]

[[deps.Tricks]]
git-tree-sha1 = "eae1bb484cd63b36999ee58be2de6c178105112f"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.8"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.WeakRefStrings]]
deps = ["DataAPI", "InlineStrings", "Parsers"]
git-tree-sha1 = "b1be2855ed9ed8eac54e5caff2afcdb442d52c23"
uuid = "ea10d353-3f73-51f8-a26c-33c1cb351aa5"
version = "1.4.2"

[[deps.WorkerUtilities]]
git-tree-sha1 = "cd1659ba0d57b71a464a29e64dbc67cfe83d54e7"
uuid = "76eceee3-57b5-4d4a-8e66-0e911cebbf60"
version = "1.6.1"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.52.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
"""

# ╔═╡ Cell order:
# ╟─7ce007b8-2cb6-11ef-01b0-89444a2ca3d0
# ╟─c51995b2-f7e8-416a-9720-e4b62fe362cb
# ╟─5e637f85-cae6-43b1-9f7f-886ac2aa5e55
# ╟─b10a6217-c867-48fb-bd37-93d878cbe8ef
# ╟─5d9e326e-0f4d-43b9-bfd2-33ce23f5d65f
# ╟─04841b1c-c213-402e-ac0f-941dc3644ce0
# ╠═57cdd282-26e9-41b7-9865-1b0da23b3286
# ╠═78c9e043-aa08-441f-8510-d776123c43b2
# ╠═a8dcc676-27d6-478f-ba50-e1c33f9eaff3
# ╟─a6738c73-a07c-4a62-b15d-20d2d83b2d76
# ╠═32ee9391-4ad7-4f65-a689-3c28815e406b
# ╟─e166f30e-e300-4907-8815-e0b3dc0f387e
# ╠═9489c7ee-b462-4fc4-b507-16ba22822621
# ╟─b6d49f79-fdee-4057-98f1-5891930c63b7
# ╠═0860cb24-6a97-4dc6-89ce-d651bff8372e
# ╟─587eba9e-eaa4-4dca-a2e5-55acd3c1f9b4
# ╠═733d4d39-49b4-435d-b40f-b5c87f8c906b
# ╠═7bf89559-1778-4dd5-8f90-2d7c0223a6f6
# ╠═6f460103-637d-454a-9326-c391f9cb0109
# ╠═8d8084d6-98ca-4a38-aad5-37a80bb0386c
# ╟─6afc92dd-f57e-4d76-8dac-8a50ba0d7d08
# ╠═9e080505-d23f-4cfd-b824-c35ad4608b97
# ╟─cf5e6564-e64a-4a71-9165-89d0515c23ea
# ╟─be6bc51c-e510-401e-884a-b568a637c2a9
# ╟─5a32aabd-d722-4adf-8df1-1b0e0e0fddfc
# ╠═0e8b7993-5ccb-4688-aa6b-f73a8d9580ad
# ╠═7a2c3621-bc2f-4ab2-83ee-fd5a250fed2e
# ╠═e553d94f-4579-48ce-988e-c08533f7b94f
# ╠═418586d6-3a7d-429d-b21d-eb1c5fde7a01
# ╠═2ca4625d-bb8d-4e4c-9a72-c19f3d5265e8
# ╠═7b5b0385-dfe3-423b-99f4-b02430751c96
# ╟─2e7437ba-bee2-4ad9-83f1-fe9d313c4589
# ╠═1593fa9c-3b9f-47b2-b2fb-c72e86834d72
# ╠═fa3e08c5-9a07-4ba3-b697-bdd6972a9de7
# ╠═4e35959b-9e5b-4971-88b1-9521a8ae4952
# ╠═73ab94da-7a17-46f5-94fe-c676e935aede
# ╟─f4ba16a3-4f61-4223-b4d8-1dc0e3f71f06
# ╠═d17ea441-64db-4b7e-aec3-89a6bf41eabb
# ╟─8b443c65-f28d-4b2e-b9e6-26d271087980
# ╟─fd837824-8e51-4211-aa64-e51bb4d87963
# ╟─dc1b297d-d471-40a0-b141-4222df2cea1c
# ╠═6c2cdf6a-3584-4dae-8c52-c14d8bef3807
# ╟─af4fd3a3-345c-4577-ba97-2eb877778a88
# ╟─21cc242a-624c-46ad-ab39-aea721fcb84e
# ╟─2868ee1d-df68-4cb6-8164-2bb7468bebc5
# ╟─fe42ce0a-052a-45bc-a1fc-32dc673092bc
# ╠═2636fc67-515a-4588-b969-6b76853a7b25
# ╟─d24b2d21-5d02-41d3-97f9-917fd9504937
# ╟─a9d0f756-583d-466c-a979-d8d718ae844a
# ╟─f4c6cb09-5aa1-486f-b2b7-070ea2f541fb
# ╠═0116cc0e-9796-4cc5-b411-680d68bb4cf5
# ╟─f90cfcac-5449-4fcc-8d55-732bdf87b853
# ╠═4d2788f9-5549-42a2-80af-eb867d9a0dc7
# ╠═9942d85f-28a6-4728-a61c-0e2d3a927fbf
# ╟─6fe43fcd-3b81-4a0c-bb00-638105841370
# ╠═cc6dd382-b0ae-4d6e-8d52-32350f333655
# ╟─7a016e79-8059-4de2-97d3-215314d82cfe
# ╠═c2b05b34-6786-4a2b-9b66-9e141ba9cc56
# ╟─f8733def-513c-4fe7-ba1e-a0499683feef
# ╟─e3aa7c16-87d6-409c-aa2f-049494a4c755
# ╠═56ed1b16-c63b-4113-910d-87a3e5e5e76e
# ╟─d9a8d700-b283-4a17-844e-cd435c3a5448
# ╠═72f505bb-6493-49ae-9063-9fb49a9e1b8f
# ╟─9457aa06-2ff3-4142-9871-28f17c41e06d
# ╠═9a0c5906-6424-444b-81e3-dc13c08cf224
# ╟─64d0a448-70c4-4873-bbdd-a3a802eee832
# ╠═e98974d0-8f9a-42a1-9706-bc648af36def
# ╠═b496aebc-a424-47c9-b31d-e5e767201e1f
# ╠═769e07db-6708-4ca7-a92a-4d2d62cfbd11
# ╠═f7c99c3b-d4e5-4354-b5d1-72861ef3861d
# ╠═42865852-366f-411d-846b-81ba90115117
# ╟─af303884-5efa-414c-b1c4-19a7a709069d
# ╠═bc51aa46-4d52-45e6-9a5f-5af6b4aea279
# ╠═be8792f1-1ea0-4543-a783-fec94192a20a
# ╟─d554a84d-cb78-49eb-ba47-67158874316a
# ╠═4b8533f0-fe63-4194-95ca-f528616bbe56
# ╟─4a3552a7-d10b-4699-8aeb-6b7c15ecd7f4
# ╠═e4051116-2e1a-4017-9ab6-96b0a598f7e3
# ╟─5eab850c-a362-45a4-bc95-9e4e443b19be
# ╠═0862d0bf-0985-4e12-82eb-6f0d38827914
# ╟─bd8ba32b-6097-44f6-bb8b-e1a695ba436d
# ╠═438bdf51-ccfb-496e-b30e-24dcef0f969b
# ╟─453ac429-36fa-4f2d-9b73-63bfc7d8a2f7
# ╟─ef497706-a238-45da-852d-f4b81f47938d
# ╟─2ae585f4-31e7-4c3b-acc8-fb94a3a3e5fc
# ╠═5e98f59c-c64d-4946-8b9a-db1ea36f9053
# ╠═bbf40228-1acc-4204-aeeb-4ce6c9ae455d
# ╟─344f12f4-a4c3-49be-b8e5-ef31ace5d1ec
# ╠═9216e61e-72ad-4ed4-a457-00ed59604fb5
# ╟─78368d2b-3c06-48f0-bce8-e4a460cd728f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
