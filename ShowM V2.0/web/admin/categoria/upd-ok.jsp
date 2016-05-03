<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    if (request.getParameter("id") == null
            || request.getParameter("txtNome") == null) {
        response.sendRedirect("list.jsp");
        return;
    }
    
    String id = request.getParameter("id");
    String nome = request.getParameter("txtNome");
    
    CategoriaDAO dao = new CategoriaDAO();
    Categoria obj = dao.buscarPorChavePrimaria(Integer.parseInt(id));
    
    if(obj==null){
        response.sendRedirect("list.jsp");
        return;
    }
    obj.setId(Integer.parseInt(id));
    obj.setNome(nome);
    dao.alterar(obj);
%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Atualizar</h4>
            <p>Registro atualizado com sucesso.</p>
            <a href="list.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

