<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index.jsp</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style type="text/css"> @import url("css/style.css"); </style>
    </head>
    <body>
        <h2>Catalogo de Livros</h2>
        <%            
            HttpSession sessao = request.getSession();
            if (sessao.isNew())
            {
        %>
        <form action="autenticacao.jsp" method="post">
            
            Usuário: <br><input type="text" name="nome_usuario"><br>
            Senha: <br><input type="password" name="senha"> <br><br>
            <input type="submit" value="Entrar">
        </form>
        <br><a href="listar_livros.jsp">Listar Livros do Catalogo</a>
        <% 
        }else{            
        %>
        <br>
        <img src="imagens/bemvindo.jpg"><br>          
        <a href="registrar_novo.html">Administração do catalogo</a><br>
        <a href="listar_livros.jsp">Listar Livros do Catalogo</a><br> 
        <a href="sair.jsp">Sair</a>
        <%
            }
        %>
    </body>
</html>