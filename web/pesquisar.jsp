<%@page import="java.sql.*" %>
<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" />
<jsp:useBean id="livro" scope="page" class="database.Livro" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css"> @import url("css/style.css"); </style>
        <title>Listar_livro.jsp</title>
    </head>
    <body>
        <h1>Pesquisa de livros</h1>
        <%
            HttpSession sessao = request.getSession();
          
            String titulo = request.getParameter("titulo");
            ResultSet rs;
            
            conexao.conectar();
            livro.setConexao(conexao.getConexao());
            rs = livro.pesquisar(titulo);
                       
            if (titulo != null){
                out.println("<table>");
                out.println("<tr><th>Foto</th><th>Titulo</th><th>Autor</th><th>Ano</th><th>Preço</th><th>Editora</th><th>Código/ID</th></tr>");
                while (rs.next())
               {
                out.println("<tr>");
                out.println("<td>");
                out.println("<img src='imagens/" + rs.getString("foto") + "'>");
                out.println("</td>");
                out.println("<td>" + rs.getString("titulo") + "</td>");
                out.println("<td>" + rs.getString("autor") + "</td>");
                out.println("<td>" + rs.getString("ano") + "</td>");
                out.println("<td>" + rs.getString("preco") + "</td>");                
                out.println("<td>" + rs.getString("id_editora") + "</td>");                
                out.println("<td>" + rs.getString("id_livro") + "</td>");                
                out.println("</tr>");
            }
                out.println("</table>");                  
            }
            else
                out.println("<h2>Erro ao listar livros</h2>");
            conexao.fechar();            
        %> 
        <form action="pesquisar.jsp" method="post">
            
            Informe o Título para pesquisa: <br><input type="text" name="pesquisa">            
            <input type="submit" value="Pesquisar"><br><br>
        </form>
        <a href="index.jsp">Pagina Inicial</a><br>
        <a href="listar_livros.jsp">Voltar</a>
    </body>
</html>
