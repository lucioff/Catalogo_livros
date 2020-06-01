<%@page import="java.sql.*" %>
<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" />
<jsp:useBean id="livro" scope="page" class="database.Livro" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css"> @import url("css/style.css"); </style>
        <title>Atualizar_livro.jsp</title>
    </head>
    <body>
        <h1>Livros cadastrados</h1>
        <%
            ResultSet rs;
            
            conexao.conectar();
            livro.setConexao(conexao.getConexao());
            rs = livro.listar();
            
            if (rs != null){
                out.println("<table>");
                out.println("<tr><th>Titulo</th><th>Autor</th><th>Ano</th><th>Preço</th><th>Foto</th><th>Editora</tr>");
                while (rs.next())
                {
                out.println("<tr>");
                out.println("<td>" + rs.getString("titulo") + "</td>");
                out.println("<td>" + rs.getString("autor") + "</td>");
                out.println("<td>" + rs.getString("ano") + "</td>");
                out.println("<td>" + rs.getString("preco") + "</td>");
                out.println("<td>" + rs.getString("foto") + "</td>");
                out.println("<td>" + rs.getString("id_editora") + "</td>");
                out.println("</tr>");
            }
                out.println("</table>");
            }
            else
                out.println("<h2>Erro ao listar livros</h2>");
            conexao.fechar();
            out.println("<a href=\"index.jsp\">Pagina Inicial</a>");
        %>
    </body>
</html>
