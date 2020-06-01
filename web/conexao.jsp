<jsp:useBean id="conexao" scope="application" class="database.ConexaoBd" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conexao com banco de dados</title>
    </head>
    <body>
        <h1>conexao com banco de dados</h1>
        <%
            if (conexao.conectar())
            {
                out.println("<p>Conexão efetuada</p>");
               // conexao.fechar();
            }
            else{
                out.println("<p>Falha na conexão</p>");}
            %>
    </body>
</html>
