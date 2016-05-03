
<%@page import="java.util.List"%>
<%@page import="dao.PerguntaDAO"%>
<%@page import="modelo.Jogador"%>
<%@page import="modelo.Pergunta"%>
<%@page import="modelo.Jogo"%>

<%  
    Jogo jogo;
    
    if(session.getAttribute("jogo") != null){
        jogo= (Jogo)session.getAttribute("jogo");
    }
    else{
          jogo= new Jogo();
    }
    
    if(request.getParameter("btnConfirmar") != null){
       String opcaomarcada = request.getParameter("rdoPergunta");
       if(!jogo.confirmar(opcaomarcada)){
             response.sendRedirect("fim.jsp");
       }
       else{
         if(jogo.getPontuacao()== 1000000){
        session.getAttribute("jogo");
        response.sendRedirect("fim.jsp");
        return;
    }
    }
    }
    else{
      
        if(request.getParameter("btnPular") != null){
            jogo.pular();
        }
        else{
            if(request.getParameter("btnParar") != null){
          response.sendRedirect("fim.jsp");
    }
            else{
              jogo.iniciar();
            }
   }
 }

   session.setAttribute("jogo", jogo);
   Pergunta pergunta = jogo.getPerguntas().get(0);
   Jogador jogador = (Jogador)session.getAttribute("jogador");   
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <body>
    <head>
        <a href="index.jsp">Menu</a>
        <hr></hr>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" href="css/estilo.css"/>
    </head>
        <div class="pergunta">
            <h4 class="enunciado"><%=pergunta.getEnunciado()%></h4>
            <div class="opcoes">
                <form action="pergunta.jsp" method="post">
                    <input type="radio" value="A" name="rdoPergunta" />
                    <%=pergunta.getA()%><br/>
                    <input type="radio" value="B" name="rdoPergunta" />
                    <%=pergunta.getB()%><br/>
                    <input type="radio" value="C" name="rdoPergunta" />
                    <%=pergunta.getC()%><br/>
                    <input type="radio" value="D" name="rdoPergunta" />
                    <%=pergunta.getD()%><br/>
                    <hr/>
                    <input type="submit" value="confirmar"  name="btnConfirmar"/>
                     <input type="submit" value="pular" name="btnPular"/><%=jogo.getPulos()%>
                      <input type="submit" value="parar" name="btnParar"/>
                </form>
            </div>
        </div>
        <div class="painelUsuario">
            <%=jogo.ErrouP()%> errar<br/>
            <%=jogo.ParouP()%> parar<br/>
            <%=jogo.AcertouP()%> acertar<br/>
        </div>
    </body>
</html>
