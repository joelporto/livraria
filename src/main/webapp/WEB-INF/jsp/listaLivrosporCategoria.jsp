<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                //Recomenda-se deixar essa linha de fora, porque a formataï¿½ï¿½o a esquerta a justificada nos select fica melhor.
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
            .livros{
            
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;}
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
            <label for="selection"><strong>Escolha uma categoria: </strong></label>

            <select id="selection">
                <option>Arquitetura</option>
                <option>Design</option>
                <option>Informática</option>
                <option>Literatura Brasileira</option>
                <option>Literatura Infantil</option>
                <option>Literatura Universal</option>
                <option>Música e Arte</option>
            </select>
            <input type="button" id="btn_submit" value="Buscar" name="buscar">
        </form>
        <div id="livros">
        	
        </div>
    </body>
    <script>

        document.querySelector("#btn_submit").addEventListener("click", function(){
            let select = document.querySelector("#selection");
            let selectTrue = select.options[select.selectedIndex].value;
            console.log(selectTrue)
            fetch("http://localhost:8080/books/"+ selectTrue,{
                method: 'GET',
                headers: {'Access-Control-Allow-Origin': '*'}

            }).then(response => response.json())
            .then((response) =>{
            	console.log(response.length)
            	for(let i = 0; i <= response.length; i++){
            		console.log(response)
            		document.querySelector("#livros").innerHTML += response[i].titulo
            		
            	}
            	
                
            })
        })

        
    </script>
</html>
