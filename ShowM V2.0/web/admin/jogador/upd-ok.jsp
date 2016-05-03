<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    if (request.getParameter("txtLogin") == null
            || request.getParameter("txtEmail") == null
            || request.getParameter("txtSenha") == null) {
        response.sendRedirect("list.jsp");
        return;
    }
    
    String login = request.getParameter("txtLogin");
    String email = request.getParameter("txtEmail");
    String senha = request.getParameter("txtSenha");
    
    JogadorDAO dao = new JogadorDAO();
    Jogador obj = dao.buscarPorChavePrimaria(login);
    
    if(obj==null){
        response.sendRedirect("list.jsp");
        return;
    }
    obj.setLogin(login);
    obj.setEmail(email);
    obj.setSenha(senha);
    dao.alterar(obj);
%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Jogador - Atualizar</h4>
            <p>Registro atualizado com sucesso.</p>
            <a href="list.jsp"><i class="material-icons">list</i></a>

        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

