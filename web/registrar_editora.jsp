<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" />
<jsp:useBean id="editora" scope="page" class="database.Editora" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css"> @import url("css/style.css"); </style>
        <title>registrar_editora.jsp</title>
    </head>
    <body>
        <%
            String nome = request.getParameter("nome");
            String cidade = request.getParameter("cidade");
            int id_editora = Integer.parseInt(request.getParameter("id_editora"));
            
            conexao.conectar();
            editora.setConexao(conexao.getConexao());
            
            if (editora.inserir(nome, cidade, id_editora))
                out.println("<h2>Editora registrado com sucesso</h2>");
                            
            else
                out.println("<h2>Erro ao registrar Editora</h2>");
        
            conexao.fechar();
        %>
        <a href="index.jsp">Pagina Inicial</a><br>
        <a href="registrar_novo.html">Novo Registro</a>
    </body>    
</html>
