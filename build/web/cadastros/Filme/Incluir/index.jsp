<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/navbar.jsp" %>
<%@include file="../../includes/conexao.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-2 main">
    <h1 class="page-header">Cadastro de Filme</h1>
    <c:if test="${param.enviou == 'True'}" >
        <c:set var="IsErro1" value="s" />
        <c:set var="eS1" value="s" />        
        
        <c:if test="${empty(param.fil_Titulo)}">
            <c:set var="IsErro1" value="f" />
        </c:if>

        <c:if test="${empty(param.fil_sinopse)}">
            <c:set var="IsErro1" value="f" />
        </c:if>

        <c:if test="${empty(param.fil_lancamento)}">
            <c:set var="IsErro1" value="f" />
        </c:if>

        <c:if test="${empty(param.fil_tempo)}">
            <c:set var="IsErro1" value="f" />
        </c:if>

        <c:if test="${empty(param.fil_url)}">
            <c:set var="IsErro1" value="f" />
        </c:if>

        <c:if test="${empty(param.fil_genero)}">
            <c:set var="IsErro1" value="f" />
        </c:if>

        <c:if test="${empty(param.fil_classificacao)}">
            <c:set var="IsErro1" value="f" />
        </c:if>

        <c:if test="${empty(param.fil_distribuidora)}">
            <c:set var="IsErro1" value="f" />
        </c:if>
        <c:if test="${IsErro1 == 's'}">
            <sql:update dataSource="${conexao}" var="r">
                INSERT INTO filmes(Fil_Titulo,Fil_Sinopse,Fil_Foto,Fil_Lancamento,Fil_Tempo,Fil_Genero,Fil_Classificacao,Fil_Distribuidora,Fil_Situacao,fil_url,Fil_Wallpaper,Fil_exibiWallpaper)
			    VALUES (?,?,?,?,?,?,?,?,?,?,?,?);
                <sql:param value="${param.fil_Titulo}" />
                <sql:param value="${param.fil_sinopse}" />
                <sql:param value="${param.fil_foto}" />
                <sql:param value="${param.fil_lancamento}" />
                <sql:param value="${param.fil_tempo}" />
                <sql:param value="${param.fil_genero}" />
                <sql:param value="${param.fil_classificacao}" />
                <sql:param value="${param.fil_distribuidora}" />
                <sql:param value="${'Ativo'}" />
                <sql:param value="${param.fil_url}" />
                <sql:param value="${param.fil_wall}" />
                <sql:param value="${param.fil_exibiwallpaper}" />
            </sql:update>
            
            <c:if test="${not (r>0)}">
                <c:set var="eS1" value="f" /> 
            </c:if>  
        </c:if>
        
        <c:if test="${IsErro1 == 's' or IsErro1 == 'f'}">
            <c:if test="${IsErro1 == 's'}">
                <div class="alert alert-success">
                    <h1><strong>Sucesso!</strong></h1>
                    <p>Seu registro foi incluido com sucesso!</p>
                    <a class="btn btn-warning" href="../Menu/index.jsp">Voltar Página Anterior</a>                
                </div>
            </c:if> 			
            <c:if test="${IsErro1 == 'f'}">
                <div class="alert alert-danger">
                    <h1><strong>Erro!</strong></h1>
                    <p>Ocorreram o(s) seguinte(s) erro(s): <br />
                        <c:if test="${empty(param.fil_Titulo)}">
                          Você esqueceu de digitar o titulo.<br />
                        </c:if>

                        <c:if test="${empty(param.fil_sinopse)}">
                            Você esqueceu de digitar a sinopse.<br />
                        </c:if>

                        <c:if test="${empty(param.fil_lancamento)}">
                            Você esqueceu de digitar a data de lançamento.<br />
                        </c:if>

                        <c:if test="${empty(param.fil_tempo)}">
                            Você esqueceu de digitar o tempo do filme.<br />
                        </c:if>

                        <c:if test="${empty(param.fil_url)}">
                            Você esqueceu de digitar a url.<br />
                        </c:if>

                        <c:if test="${empty(param.fil_genero)}">
                            Você esqueceu de digitar o genero.<br />
                        </c:if>

                        <c:if test="${empty(param.fil_classificacao)}">
                            Você esqueceu de digitar a classificação.<br />
                        </c:if>

                        <c:if test="${empty(param.fil_distribuidora)}">
                            Você esqueceu de digitar a disitribuidora.<br />
                        </c:if>
                            
                        <c:if test="${eS1 == 'f'}">
                            Erro na execução do SQL.<br />
                        </c:if>   
                    </p>
                    Por favor tente novamente.
                </div>
            </c:if>                           
        </c:if> 
    </c:if>

        <form action="index.jsp" method="post">       
	<div id="actions" align="right">
            <a class="btn btn-default" href="../Menu/index.jsp">Voltar Página Anterior</a>
            <input type="submit" class="btn btn-primary" value="Salvar" />			
	</div>
				
	<div class="row">
            <div class="form-group col-md-12">
                <div class="row">
                    <div class="col-md-10">
                        <label>Título</label>
                        <input type="text" name="fil_Titulo" maxlength="50" class="form-control"
                            placeholder="Digite um título" 
                            <c:if test="${IsErro1 == 'f'}">
                                value="<c:out value="${param.fil_Titulo}"/>"
                            </c:if>
                        />
                    </div>    
                    
                    <div class="col-md-1">    
                    </div>    
                    
                    <div class="col-md-1">    
                        <label>Exibir Wallpaper</label>
                        <select name="fil_exibiwallpaper" id="fil_exibiwallpaper" class="form-control w-3">                
                            <option value="Sim">Sim</option>
                            <option value="Nao">Não</option>
                        </select>
                    </div>
                </div>    
                
                <br/>
                
                <label>Sinopse</label>
                
                <br/>
                
                <textarea id="fil_sinopse" name="fil_sinopse" rows="3" cols="60"><c:if test="${IsErro1 == 'f'}"><c:out value="${param.fil_sinopse}"/></c:if></textarea>
                
                <br/>

                <label>Cartaz</label>
                <input type="file" name="fil_foto" class="form-control" 
                    accept=".jpeg,.jpg,.gif,.png,.bitmap"/>
                

                <div class="row">
                    <div class="col-md-3">
                        <label>Data Lançamento</label>
                        <input type="date" name="fil_lancamento" maxlength="50" class="form-control"
                            data-date-format="DD MM YYYY" 
                            placeholder="Digit e uma data de lançamento." 
                            <c:if test="${IsErro1 == 'f'}">
                                value="<c:out value="${param.fil_lancamento}"/>"
                            </c:if>
                         />
                    </div>

                    <div class="col-md-6">
                    </div>

                    <div class="col-md-3">
                        <label>Tempo de filme</label>
                        <input type="text" name="fil_tempo" maxlength="6" class="form-control"
                            placeholder="Digite o tempo do filme" 
                            <c:if test="${IsErro1 == 'f'}">
                                value="<c:out value="${param.fil_tempo}"/>"
                            </c:if>
                         />
                    </div>
                </div> 

                <label>Genero</label>
                <select name="fil_genero" id="fil_genero" class="form-control w-3">
                    <sql:query dataSource="${conexao}" var="r">
                        select gen_codigo,gen_descricao from genero;
                    </sql:query>
                        
                    <c:forEach var="i" items="${r.rows}">
                        <option value="${i.gen_codigo}">${i.gen_descricao}</option>
                    </c:forEach>
                </select>
                                
                <label>Classificacao</label>
                <select name="fil_classificacao" id="fil_classificacao" class="form-control w-3">                
                    <sql:query dataSource="${conexao}" var="r">
                        select cla_codigo,cla_descricao from classificacao;
                    </sql:query>
                        
                    <c:forEach var="i" items="${r.rows}">
                        <option value="${i.cla_codigo}">${i.cla_descricao}</option>
                    </c:forEach>
                </select>    
                                
                <label>Distribuidora</label>
                <select name="fil_distribuidora" id="fil_distribuidora" class="form-control w-3">                
                    <sql:query dataSource="${conexao}" var="r">
                        select dis_codigo,dis_nomefantasia from distribuidora;
                    </sql:query>
                    <c:forEach var="i" items="${r.rows}">
                        <option value="${i.dis_codigo}">${i.dis_nomefantasia}</option>
                    </c:forEach>
                </select>

                <label>WallPaper</label>
                <input type="file" name="fil_wall" class="form-control" 
                    accept=".jpeg,.jpg,.gif,.png,.bitmap"/>  
                
                <label>URL</label>
                <input type="url" name="fil_url" class="form-control"
                    placeholder="Digite a url" 
                    <c:if test="${IsErro1 == 'f'}">
                        <c:out value="${param.fil_url}"/>
                    </c:if>    
                />
                
                <c:if test="${IsErro1 == 'f'}">
                    <script>document.getElementById("fil_genero").value = <c:out value="${param.fil_genero}"/></script>
                    <script>document.getElementById("fil_classificacao").value = <c:out value="${param.fil_classificacao}"/></script>
                    <script>document.getElementById("fil_distribuidora").value = <c:out value="${param.fil_distribuidora}"/></script>
                    <script>document.getElementById("fil_foto").value = <c:out value="${param.fil_foto}"/></script>
                    <script>document.getElementById("fil_wall").value = <c:out value="${param.fil_wall}"/></script>
                </c:if>    
	    </div>
            <input type="hidden" name="enviou" value="True" />
	</form>
</div>	

<%@include file="../../includes/footer.jsp" %>