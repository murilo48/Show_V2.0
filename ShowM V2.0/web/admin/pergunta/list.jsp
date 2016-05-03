<%@page import="modelo.Pergunta"%>
<%@page import="java.util.List"%>
<%@page import="dao.PerguntaDAO"%>
<%@include file="../cabecalho.jsp"%>
<%
    PerguntaDAO dao = new PerguntaDAO();
    List<Pergunta> lista = dao.listar();
%>

<style>
    .direita
    {
        text-align: right;
        padding-right: 10%;

    }
</style>
<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4>Pergunta</h4>
            <!-- Colored mini FAB button -->
            <div class="direita">
                <a href="add.jsp">
                    <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                        <i class="material-icons">add</i>
                    </button>  
                </a>
            </div>

            <table class="mdl-data-table mdl-js-data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Enunciado</th>
                        <th>Nível</th>
                        <th>Categoria</th>
                        <th>Ações</th>

                    </tr>
                </thead>

                <tbody>
                    <%
                        for (Pergunta item : lista) {
                    %>
                    <tr>
                        <td><%=item.getId()%></td>
                        <td><%=item.getEnunciado()%></td>
                        <td><%=item.getNivel()%></td>
                        <td><%=item.getCategoria()%></td>
                        <td>
                            <!-- 
                                Atualizar 
                            -->
                            <div id="ttupd" class="icon material-icons">
                                <i class="material-icons"><a href="upd.jsp?id=<%=item.getId()%>">update</a></i>
                            </div>
                            <div class="mdl-tooltip" for="ttupd">
                                Atualizar
                            </div>
                            <!-- 
                                Excluir 
                            -->
                            <div id="ttdel" class="icon material-icons">
                                <i class="material-icons"><a href="del-ok.jsp?id=<%=item.getId()%>">delete</a></i>
                            </div>
                            <div class="mdl-tooltip" for="ttdel">
                                Excluir
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>   
        </div>
    </div>
</section>

<%@include file="../rodape.jsp"%>

