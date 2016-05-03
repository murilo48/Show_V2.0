<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Jogador"%>
<%@page import="dao.RankingDAO"%>
<%@page import="modelo.Ranking"%>
<%@page import="modelo.Jogo"%>

<%
    Jogo jogo = (Jogo) session.getAttribute("jogo");
        
    Ranking ranking = new Ranking();

    Jogador jogador = (Jogador) session.getAttribute("jogador");
 
    ranking.setPontos(jogo.getPontuacao());
    ranking.setJogador(jogador);

    RankingDAO dao = new RankingDAO();

    dao.incluir(ranking);
 
%>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/estilo.css"/>
    </head>
    <body>
        <h1>O sonho acabo!!!</h1>
        <a href="jogo.jsp">Jogar novamente</a>
        <a href="index.jsp">Menu</a>
        <hr />

        <h4>TOP 10</h4>

        <%            //
            List<Ranking> lista = dao.listar();
            
            for (int i = 0; i <lista.size(); i++) {
        %>
        <tr>
            <th><%=i+1%></th>
            <th><%=lista.get(i).getJogador()%></th>
            <th><%=lista.get(i).getPontos()%></th>
        </tr>
        <%
            }
            dao.fechaEmf();
        %>

    </body>
</html>
