
<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String msg = "" ;
    if (request.getParameter("txtLogin") == null 
            || request.getParameter("txtSenha") == null) {
        response.sendRedirect("add.jsp");
    } else {

        String login = request.getParameter("txtLogin");
        String senha = request.getParameter("txtSenha");

        JogadorDAO dao = new JogadorDAO();

        Jogador obj = new Jogador();
        obj.setLogin(login);
        obj.setSenha(senha);
        
        try {
            dao.incluir(obj);
            msg = "Registro cadastrado com sucesso";
        } catch (Exception ex) {
            msg = "Erro ao cadastrar registro";
        }

    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro realizado com sucesso!!!</h1>
        
        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
            <a href="index.jsp">Menu de login</a>
        </button>
        
    </body>
</html>
