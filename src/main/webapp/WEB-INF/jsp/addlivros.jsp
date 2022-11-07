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
                //Recomenda-se deixar essa linha de fora, porque a formataÃ§Ã£o a esquerta a justificada nos select fica melhor.
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
            #submit_add {
                background-color: beige;
                font-family: serif;
                position: absolute;
            }
            #submit_del {
                background-color: beige;
                font-family: serif;
                position: absolute;
            }
            #submit_alter {
                background-color: beige;
                font-family: serif;
                margin-left: 7%;
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
            <fieldset>
                <legend>Adicionar Livro</legend>
                <table cellspacing="10">
                    <tr>
                        <td>
                            <label for="codigo">Código: </label>
                        </td>
                        <td align="left">
                            <input type="text" name="codigo" id="codlivro">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="titulo">Titulo: </label>
                        </td>
                        <td align="left">
                            <input type="text" name="titulo" id="titulo">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="autor">Autor: </label>
                        </td>
                        <td align="left">
                            <input type="text" name="autor" id="autor">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="autor">Categoria: </label>
                        </td>
                        <td align="left">
                            <select id="selection">
                                <option>Arquitetura</option>
				                <option>Design</option>
				                <option>Informática</option>
				                <option>Literatura Brasileira</option>
				                <option>Literatura Infantil</option>
				                <option>Literatura Universal</option>
				                <option>Música e Arte</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="value">Valor: </label>
                        </td>
                        <td align="left">
                            <input type="text" name="value" size="10" maxlength="10" id="valor">
                        </td>
                    </tr>
                </table>
                <input type="button" id="submit_add" value="Adicionar" formaction="/book">
                <input type="button" id="submit_alter" value="Alterar">
                <button onsubmit=""></button>
            </fieldset>
            <br>
            <br>
            <fieldset>
                <legend>Excluir Livro</legend>
                <table cellspacing="10">
                    <tr>
                        <td>
                            <label for="codigo_2">Código: </label>
                        </td>
                        <td align="left">
                            <input type="text" name="codigo_2" id="codigo">
                        </td>
                    </tr>
                </table>
                <input type="button" id="delet" value="Excluir">
            </fieldset>
        </form>
    </body>
    <script>
    
    
    	document.querySelector("#submit_add").addEventListener("click", function(){
	    	let codigo = document.querySelector("#codlivro").value;
	    	let titulo = document.querySelector("#titulo").value;
	    	let autor = document.querySelector("#autor").value;
	    	let select = document.querySelector("#selection");
	        let categoria = select.options[select.selectedIndex].value;
	    	let valor = document.querySelector("#valor").value
	    	const data = {}
	    	
	    	data["codlivro"] = codigo;
	    	data["titulo"] = titulo;
	    	data["autor"] = autor;
	    	data["categoria"] = categoria
	    	data["valor"] = valor
	    	
	    	console.log(data)
	   
		    fetch('http://localhost:8080/books/',{
		        method: 'POST',
		        headers:{
		            'Accept': 'application/json',
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify(data)
		    }).then((response) =>{
		    	console.log(response)
		    }).catch((error) =>{
		    	console.log(error)
		    })
    	})
    	
    	
    	document.querySelector("#delet").addEventListener("click", function(){
    		console.log('entrei')
    		let codigo = document.querySelector("#codigo").value;
    		fetch("http://localhost:8080/book/remove/" + codigo, {
    			method: "DELETE",
    			headers:{
    				'Accept': 'application/json',
		            'Content-Type': 'application/json'
    			},
  
    		}).then((response) =>{
    			console.log(response)
    		}).catch((error) =>{
    			console.log(response)
    		})
    	})

    		

  </script>
</html>
