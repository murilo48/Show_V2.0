<%@page import="modelo.Categoria"%>
<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String id = request.getParameter("txtId");
    String enunciado = request.getParameter("txtEnunciado");
    String nivel = request.getParameter("txtNivel");
    String certa = request.getParameter("txtCerta");
    String categoria = request.getParameter("selCategoria");
    String a = request.getParameter("txtA");
    String b = request.getParameter("txtB");
    String c = request.getParameter("txtC");
    String d = request.getParameter("txtD");

    PerguntaDAO dao = new PerguntaDAO();

    Pergunta pergunta = dao.buscarPorChavePrimaria(Integer.parseInt(id));

    Categoria obj = new Categoria();

    obj.setId(Integer.parseInt(categoria));

    pergunta.setEnunciado(enunciado);
    pergunta.setNivel(Integer.parseInt(nivel));
    pergunta.setCerta(certa);
    pergunta.setCategoria(obj);
    pergunta.setA(a);
    pergunta.setB(b);
    pergunta.setC(c);
    pergunta.setD(d);

    dao.alterar(pergunta);
%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Pergunta - Atualizar</h4>
            <p>Registro atualizado com sucesso.</p>
            <a href="list.jsp"><i class="material-icons">list</i></a>

        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>
