# Geociência de dados @ UFMG 2024

Minicurso de geociência de dados na mineração.

Instrutor: [Júlio Hoffimann](https://juliohm.github.io)

## Instruções de instalação

1. Faça o download dos arquivos do minicurso:

    - Pressione o botão `Code`, e em seguida o botão `Download ZIP`
    - Extraia o arquivo ZIP em um diretório de fácil acesso

![download](https://i.imgur.com/IqdRmyN.png)

2. Instale a linguagem Julia **v1.10** ou superior:

   - No Windows, basta procurar "juliaup" na Microsoft Store.
   - No Linux e MacOS, copie e cole a seguinte linha no terminal:

```sh
curl -fsSL https://install.julialang.org | sh
```

3. Inicie o Julia através do ícone na área de trabalho ou pelo terminal.

4. No Julia, instale o Pluto **v0.19** ou superior usando o seguinte comando:

```julia
import Pkg
Pkg.add("Pluto")
```

5. Ainda no Julia, inicie o sistema de notebooks Pluto:

```julia
import Pluto
Pluto.run()
```

6. Arraste o notebook de instalação `install.jl` para o Pluto.
7. Pressione o botão `Run notebook code` no canto superior direito.