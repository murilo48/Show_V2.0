<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg = "" ;
    if (request.getParameter("txtLogin") == null 
            || request.getParameter("txtEmail") == null
            || request.getParameter("txtSenha") == null) {
        response.sendRedirect("add.jsp");
    } else {

        String login = request.getParameter("txtLogin");
        String email = request.getParameter("txtEmail");
        String senha = request.getParameter("txtSenha");

        JogadorDAO dao = new JogadorDAO();

        Jogador obj = new Jogador();
        obj.setLogin(login);
        obj.setEmail(email);
        obj.setSenha(senha);
        
        try {
            dao.incluir(obj);
            msg = "Registro cadastrado com sucesso";
        } catch (Exception ex) {
            msg = "Erro ao cadastrar registro";
        }

    }
%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Jogador - Cadastrar</h4>
            <%=msg%>.
            <a href="list.jsp"><i class="material-icons">list</i></a>

        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

