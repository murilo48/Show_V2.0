<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Pergunta"%>
<%@page import="dao.PerguntaDAO"%>
<%@include file="../cabecalho.jsp"%>

<%
    String id = request.getParameter("id");
    PerguntaDAO dao = new PerguntaDAO();
    
    Pergunta pergunta = dao.buscarPorChavePrimaria(Integer.parseInt(id));
    
    CategoriaDAO obj = new CategoriaDAO();
    List<Categoria> Lista = obj.listar();
    
%>

<section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
    <div class="mdl-card mdl-cell mdl-cell--12-col">
        <div class="mdl-card__supporting-text">
            <h4>Pergunta - Atualizar</h4>
            <form action="upd-ok.jsp" method="post">
                <!-- 
                    primeira div -- área que ocupará o campo de formulário
                    segunda div -- campo de texto e label 
                -->
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="Integer" value="<%=pergunta.getId()%>" disabled required  name="txtId" />
                        <label class="mdl-textfield__label" for="txtId">ID - Fornecido pelo sistema</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" value="<%=pergunta.getEnunciado()%>" required  name="txtEnunciado" />
                        <label class="mdl-textfield__label" for="txtEnunciado">Enunciado</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" value="<%=pergunta.getA()%>" required  name="txtA" />
                        <label class="mdl-textfield__label" for="txtA">Alternativa A</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" value="<%=pergunta.getB()%>" required  name="txtB" />
                        <label class="mdl-textfield__label" for="txtB">Alternativa B</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" value="<%=pergunta.getC()%>" required  name="txtC" />
                        <label class="mdl-textfield__label" for="txtC">Alternativa C</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" value="<%=pergunta.getD()%>" required  name="txtD" />
                        <label class="mdl-textfield__label" for="txtD">Alternativa D</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col"> 
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="number" value="<%=pergunta.getNivel()%>" required  name="txtNivel" />
                        <label class="mdl-textfield__label" for="txtNivel">Nível</label>
                    </div>
                </div>
                <div class="mdl-cell--12-col">
                    <div class="mdl-select mdl-js-select mdl-select--floating-label">
                        <select class="mdl-select__input" value="<%=pergunta.getCerta()%>" id="txtCerta" name="txtCerta">
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                            <option value="D">D</option>
                        </select>
                        <label class="mdl-select__label" for="txtCerta">Alternativa Correta</label>
                    </div>
                </div>


                <div class="mdl-cell--12-col">
                    <div class="mdl-select mdl-js-select mdl-select--floating-label">
                        <select class="mdl-select__input" id="selCategoria" name="selCategoria">
                            <%            
                                for (Categoria cat : Lista) {
                            %>        
                            <option value="<%=cat.getId()%>"><%=cat%></option>
                            <%
                                }
                            %>  
                        </select>
                        <label class="mdl-select__label" for="selCategoria">Categoria</label>
                    </div>
                </div>

                <div class="mdl-cell--12-col">

                    <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                        <i class="material-icons">save</i></button>
                    <button type="reset" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                        <i class="material-icons">clear</i></button>


                </div>
            </form>
        </div>

    </div>

</section>

<%@include file="../rodape.jsp"%>


