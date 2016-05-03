<%@page import="modelo.Jogador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    Jogador jogador = (Jogador)session.getAttribute("bugre");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show do Milhão</title>
          <link rel="stylesheet" href="css/estilo.css"/>
    </head>
    
    <body>
        <div class="usuario">
            <%=jogador.getLogin()%>
        </div>
        <div class="centralizar">
            <img src="img/show.png" alt=""/>
            <br/>
            
            <a href="pergunta.jsp">Iniciar Jogo</a>
            <a href="index.jsp">Sair</a>
        </div>
        
    </body>
</html>
 