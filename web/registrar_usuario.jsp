<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" />
<jsp:useBean id="usuario" scope="page" class="database.Usuario" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css"> @import url("css/style.css"); </style>
        <title>registrar usuario.jsp</title>
    </head>
    <body>
        <h1>registrar usuario.jsp</h1>
        <%
            HttpSession sessao = request.getSession();
            int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
            String nome_usuario = request.getParameter("nome_usuario");
            String senha = request.getParameter("senha");
            
            conexao.conectar();
            usuario.setConexao(conexao.getConexao());
                                
            int resultado = usuario.inserir(id_usuario, nome_usuario, senha);
            
            if (resultado == 0)
                out.println("<h2>Usuario registrado com sucesso</h2>");
            else
                if (resultado == 1)
                    out.println("<h2>Usuario já registrado</h2>");
                else
                    out.println("<h2>Erro ao registrar Usuario</h2>");
            
            conexao.fechar();
            
        %>
        <a href="index.jsp">Pagina de Login</a><br>
        <a href="registrar_novo.html">Novo Registro</a>
    </body>    
</html>
