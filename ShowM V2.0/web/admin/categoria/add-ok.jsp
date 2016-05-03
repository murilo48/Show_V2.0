<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    String msg ="";
    if(//request.getParameter("txtId")== null ||
            request.getParameter("txtNome") == null){
        response.sendRedirect("add.jsp");
    }
    else{
        //String id = request.getParameter("txtId");
        String nome = request.getParameter("txtNome");
        
        CategoriaDAO dao = new CategoriaDAO();
        
        Categoria obj = new Categoria();
        //obj.setId(Integer.parseInt(id));
        obj.setNome(nome);
        
        try{
            dao.incluir(obj);
            msg ="Registro cadastrado com sucesso";
        }
        catch(Exception ex){
            msg ="Erro ao cadastrar registro";
        }
    }
%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text ">
            <h4>Categoria - Cadastrar</h4>
            <%=msg%>.
            <a href="list.jsp"><i class="material-icons">list</i></a>
            
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>

