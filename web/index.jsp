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
            <form action="autenticacao.jsp" method="post">
            Usuário: <input type="text" name="nome_usuario"> <br>
            Senha: <input type="password" name="senha"> <br>
            <input type="submit" value="Entrar">
        </form>
        <br>
        <!--<a href="registrar_novo.html">TESTE Registrar novo</a><br>-->
        <a href="listar_livros.jsp">Listar Livros do Catalogo</a>
    </body>
</html>
