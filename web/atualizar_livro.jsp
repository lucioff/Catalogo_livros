<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" />
<jsp:useBean id="livro" scope="page" class="database.Livro" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css"> @import url("css/style.css"); </style>
        <title>atualizar livro.jsp</title>
    </head>
    <body>
        <%
            int id_livro = Integer.parseInt(request.getParameter("id_livro"));
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            int ano = Integer.parseInt(request.getParameter("ano"));
            double preco = Integer.parseInt(request.getParameter("preco"));
            String foto = request.getParameter("foto");
            int id_editora = Integer.parseInt(request.getParameter("id_editora"));
            
            conexao.conectar();
            livro.setConexao(conexao.getConexao());
            
            if (livro.atualizar(id_livro, titulo, autor, ano, preco, foto, id_editora))
                out.println("<h2>Livro atualizado com sucesso</h2>");
                            
            else
                out.println("<h2>Erro ao atualizar Livro</h2>");
        
            conexao.fechar();
        %>
        <a href="index.jsp">Pagina Inicial</a><br>
        <a href="registrar_novo.html">Novo Registro</a>
    </body>    
</html>
