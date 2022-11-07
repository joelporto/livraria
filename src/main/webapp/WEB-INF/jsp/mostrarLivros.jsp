<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="favicon/your-logo.png">
        <style type="text/css">
            @import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

            * {
                margin: 0 auto;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Open Sans', sans-serif;
            }

            #menu-h{
                background-color: rgb(37, 37, 39);
            }

            #menu-h ul {
                max-width: 800px;
                list-style: none;
                padding: 0;
            }

            #menu-h ul li {
                display: inline;
            }

            #menu-h ul li a {
                color: #FFF;
                padding: 20px;
                display: inline-block;
                text-decoration: none;
                transition: background .4s;
            }

            #menu-h ul li a:hover {
                background-color: rgb(24, 139, 233);
            }
            select {
                width:130px;
                height:30px;
                font-family: cursive;
                font-size:14px;
                padding:5px;
                background-color:#45675D;
                padding-left:40px;
                color: white;
            }
            option {
                background-color:#45765D;
                color: white;
            }
            label {
                font-family: cursive;
            }
            input {
                background-color: firebrick;
                font-family: cursive;
                color: black;
                border-radius: 2px;
                padding: 2px;
            }
            #code_val{
                font-family: cursive;
                padding: 2px;
                color: black;
                background-color: darkgray;
            }
            .livros{
            	width: 500px;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }
        </style>
        <title>Livraria - Buscar Por Categoria</title>
    </head>
    <body>
        <nav id="menu-h">
            <ul>
                <li>
                    <a href="/">Inicio</a>
                </li>
                <li><a href="categories">Busca por Categoria</a></li>
                <li><a href="mostrarLivros">Busca por Código</a></li>
                <li><a href="addlivros">Outros</a></li>
            </ul>
        </nav>
        <br>
        <br>
        <form id="forms" method="post">
            <label for="selection"><strong>Digite o código do livro: </strong></label>
            <input type="text" placeholder="cÃ³digo" id="code_val" name="codigo_busca">
            <input type="button" id="btn_submit" value="Buscar" name="buscar">
        </form>
        <div id="livros">
        </div>
    </body>
    <script>
    document.querySelector("#btn_submit").addEventListener("click", function(){
        let select = document.querySelector("#code_val").value
        console.log(select)
        fetch("http://localhost:8080/books/byID/"+ select,{
            method: 'GET',
            headers: {'Access-Control-Allow-Origin': '*'}

        }).then(response => response.json())
        .then((response) =>{
        	console.log(response)
        	document.querySelector("#livros").innerHTML += response.titulo
        	document.querySelector("#livros").innerHTML += response.categoria
        	document.querySelector("#livros").innerHTML += response.valor
        	
            
        })
    })
    </script>
</html>
