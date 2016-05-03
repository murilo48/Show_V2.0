<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@page import="java.util.List"%>
<%@include file="../cabecalho.jsp"%>
<!-- gambiarra pra alinhar o botão a esquerda-->
<%
    JogadorDAO dao = new JogadorDAO();
    List<Jogador> lista = dao.listar();
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
            <h4>Jogador</h4>
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

                        <th>Login</th>
                        <th>Email</th>
                        <th>Foto</th>
                        
                        <th>Ações</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                    for(Jogador item:lista){                        
                    %>
                    <tr>
                        <td><%=item.getLogin()%></td>
                        <td><%=item.getEmail()%></td>
                        <td><%=item.getFoto()%></td>
                        <td>
                           
                            <div id="ttupd" class="icon material-icons">
                                <i class="material-icons"><a href="upd.jsp?txtLogin=<%=item.getLogin()%>">update</a></i>
                            </div>
                            <div class="mdl-tooltip" for="ttupd">
                                Atualizar
                            </div>
                            
                            <div id="ttdel" class="icon material-icons">
                                <i class="material-icons"><a href="del-ok.jsp?txtLogin=<%=item.getLogin()%>">delete</a></i>
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