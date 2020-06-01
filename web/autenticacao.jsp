<jsp:useBean id="conexao" scope="page" class="database.ConexaoBd" />
<jsp:useBean id="usuario" scope="page" class="database.Usuario" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css"> @import url("css/style.css"); </style>
        <title>autenticacao.jsp</title>
    </head>
    <body>
        <h1>autenticacao.jsp</h1>
        <%
            String nome_usuario = request.getParameter("nome_usuario");
            String senha = request.getParameter("senha");
            
            conexao.conectar();
            usuario.setConexao(conexao.getConexao());
            
            int resultado = usuario.autenticar(nome_usuario, senha);
            
            if (resultado == 0){
                out.println("<h2>Usuario ou Senha invalidos</h2>");
                out.println("<a href=\"index.jsp\">Tentar novamente</a>");
            }              
            else
                        
            if (resultado == 1){
                HttpSession sessao = request.getSession();
                sessao.setAttribute("nome_usuario", usuario.getUsuario()); 
                out.println("<h2>Seja bem vindo</h2>");
                out.println("<a href=\"registrar_novo.html\">Administração do catalogo</a><br>");
                out.println("<a href=\"listar_livros.jsp\">Listar Livros do Catalogo</a>");
            }
            else
                out.println("<h2>erro ao autenticar usuario</h2>");
                
            conexao.fechar();                
        %>
    </body>
</html>
