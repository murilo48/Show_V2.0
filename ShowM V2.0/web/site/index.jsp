<%@page contentType = "text/html" pageEncoding = "UTF-8"%>
<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%
String msg = "";
    if (request.getParameter("txtEntrarLogin") != null
            || request.getParameter("txtEntrarSenha") != null) {
        JogadorDAO dao = new JogadorDAO();
        Jogador jogador;
        String login = request.getParameter("txtEntrarLogin");
        String senha = request.getParameter("txtEntrarSenha");
        
        jogador = dao.realizarLogin(login, senha);
        
        dao.fechaEmf();
        
        if (jogador != null){
            session.setAttribute("bugre", jogador);
            response.sendRedirect("jogo.jsp");
        } else {
            msg="Errou!!!!";
        } 
    } 
%> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show do Milhão</title>
        <link rel="stylesheet" href="css/estilo.css"/>
    </head>
    <body>
        <div class="centralizar">
            <img src="img/show.png" alt=""/>
        </div>
        <div class="inicialformulario">
            <h4>Entrar</h4>
            <form action="index.jsp" method="post">
                <label>Login:</label>
                <input type="text" name="txtEntrarLogin"
                       /><br/>
                <label>Senha:</label>
                <input type="password" name="txtEntrarSenha"
                       /><br/>
                <input type="submit" value="Entrar" />
                <button type="reset" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                        Limpar
                    </button>
            </form>
            <a href="jogo.jsp">Pular login</a>
            
            <div class="centralizar">
                <hr/>
                ou
                <hr/>
            </div>
            <a href="cadastrar.jsp">Cadastre-se</a>
          
</html>
