<%@include file="../../../resources/includes/header.jsp" %>
<%@include file="../../../resources/includes/navbar.jsp" %>
<%@include file="../../conexao.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-12 col-md-offset-2 main">
    <h1 class="page-header">Cadastro de Distribuidora</h1>
    <c:if test="${param.enviou == 'True'}">
        <c:set var="IsErro1" value="s" />
        <c:set var="eS1" value="s" />        
        
        <c:if test="${empty(param.dis_razaosocial)}">
            <c:set var="IsErro1" value="f" />
        </c:if> 
        <c:if test="${empty(param.dis_nomefantasia)}">
            <c:set var="IsErro1" value="f" />
        </c:if> 
        <c:if test="${empty(param.dis_cnpj)}">
            <c:set var="IsErro1" value="f" />
        </c:if> 
        <c:if test="${empty(param.dis_ie)}">
            <c:set var="IsErro1" value="f" />
        </c:if> 
        <c:if test="${empty(param.dis_site)}">
            <c:set var="IsErro1" value="f" />
        </c:if> 
        <c:if test="${empty(param.dis_email)}">
            <c:set var="IsErro1" value="f" />
        </c:if> 
        <c:if test="${empty(param.dis_endereco)}">
            <c:set var="IsErro1" value="f" />
        </c:if>
        <c:if test="${empty(param.dis_bairro)}">
            <c:set var="IsErro1" value="f" />
        </c:if> 
        <c:if test="${empty(param.dis_cidade)}">
            <c:set var="IsErro1" value="f" />
        </c:if> 
        <c:if test="${empty(param.dis_estado)}">
            <c:set var="IsErro1" value="f" />
        </c:if> 
        <c:if test="${empty(param.dis_numero)}">
            <c:set var="IsErro1" value="f" />
        </c:if>
        
        <c:if test="${IsErro1 == 's'}">
            <sql:update dataSource="${conexao}" var="r">
                UPDATE distribuidora SET dis_razaosocial=?,dis_nomefantasia=?,dis_cnpj=?,dis_ie=?,dis_site=?,dis_email=?,dis_endereco=?,
                dis_bairro=?,dis_cidade=?,dis_estado=?,dis_numero=?
                where dis_codigo=?;
                <sql:param value="${param.dis_razaosocial}" />
                <sql:param value="${param.dis_nomefantasia}" /> 
                <sql:param value="${param.dis_cnpj}" />
                <sql:param value="${param.dis_ie}" />
                <sql:param value="${param.dis_site}" />
                <sql:param value="${param.dis_email}" />
                <sql:param value="${param.dis_endereco}" />
                <sql:param value="${param.dis_bairro}" />
                <sql:param value="${param.dis_cidade}" />
                <sql:param value="${param.dis_estado}" />
                <sql:param value="${param.dis_numero}" />
                <sql:param value="${param.id}" />
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
                        <c:if test="${empty(param.dis_razaosocial)}">
                            Você esqueceu de digitar a razão social.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_nomefantasia)}">
                            Você esqueceu de digitar o nome fantasia.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_cnpj)}">
                            Você esqueceu de digitar o CNPJ.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_ie)}">
                            Você esqueceu de digitar a IE.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_site)}">
                            Você esqueceu de digitar o site.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_email)}">
                            Você esqueceu de digitar o e-mail.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_endereco)}">
                            Você esqueceu de digitar o endereco.<br />
                        </c:if>
                        <c:if test="${empty(param.dis_bairro)}">
                            Você esqueceu de digitar o bairro.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_cidade)}">
                            Você esqueceu de digitar a cidade.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_estado)}">
                            Você esqueceu de digitar o estado.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_numero)}">
                            Você esqueceu de digitar o número.<br />
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
                
    <sql:query dataSource="${conexao}" var="r">
        SELECT * FROM distribuidora WHERE dis_codigo=?;
        <sql:param value="${param.id}" />
    </sql:query>             
            
    <form action="index.jsp" method="post">
        <div id="actions" align="right">
            <a class="btn btn-default" href="../Menu/index.jsp">Voltar Página Anterior</a>
            <input type="submit" class="btn btn-primary" value="Salvar" />
        </div>
        
        <c:forEach var="i" items="${r.rows}" >
        <div class="row">
            <div class="form-group col-md-12">
                <label>Razão Social</label>
                <input type="text" name="dis_razaosocial" maxlength="50" class="form-control"
                    placeholder="Digite uma razão social" 
                    value="<c:out value="${i.dis_razaosocial}"/>"
                    
                />

                <label>Nome Fantasia</label>
                    <input type="text" name="dis_nomefantasia" maxlength="50" class="form-control"
                        placeholder="Digite um nome fantasia" 
                        value="<c:out value="${i.dis_nomefantasia}"/>"
                    />
                    
                <div class="row">
                    <div class="col-md-5">
                        <label>CNPJ</label>
                        <input type="text" name="dis_cnpj" maxlength="14" class="form-control"
                            placeholder="Digite o CNPJ" 
                            value="<c:out value="${i.dis_cnpj}"/>"
                         />
                    </div>

                    <div class="col-md-2">
                    </div>

                    <div class="col-md-5">				
                        <label>IE</label>
                        <input type="text" name="dis_ie" maxlength="14" class="form-control"
                            placeholder="Digite o IE" 
                            value="<c:out value="${i.dis_ie}"/>"
                         />
                    </div>	
                </div>		

                <label>Site</label>
                <input type="url" name="dis_site" maxlength="100" class="form-control"
                       placeholder="Digite o Site" 
                       value="<c:out value="${i.dis_site}"/>"
                 />

                <label>E-mail</label>
                <input type="email" name="dis_email" maxlength="100" class="form-control"
                        placeholder="Digite o E-mail" 
                        value="<c:out value="${i.dis_email}"/>"
                />

                <div class="row">
                    <div class="col-md-6">
                        <label>Endereço</label>
                        <input type="text" name="dis_endereco" maxlength="60" class="form-control"
                            placeholder="Digite o Endereço" 
                            value="<c:out value="${i.dis_endereco}"/>"
                        />
                    </div>

                    <div class="col-md-1">
                    </div>

                    <div class="col-md-5">				
                        <label>Bairro</label>
                        <input type="text" name="dis_bairro" maxlength="40" class="form-control"
                            placeholder="Digite o Bairro" 
                            value="<c:out value="${i.dis_bairro}"/>"
                        />                        
                    </div>	
                </div>

                <div class="row">
                    <div class="col-md-5">
                        <label>Cidade</label>
                        <input type="text" name="dis_cidade" maxlength="32" class="form-control"
                            placeholder="Digite o Cidade" 
                            value="<c:out value="${i.dis_cidade}"/>"
                        />                        
                    </div>

                    <div class="col-md-1">
                    </div>

                    <div class="col-md-2">
                        <label>Estado</label>
                        <select name="dis_estado" id="dis_estado" class="form-control w-3">
                            <option value="AC">AC</option>
                            <option value="AL">AL</option>
                            <option value="AP">AP</option>
                            <option value="AM">AM</option>
                            <option value="BA">BA</option>
                            <option value="CE">CE</option>
                            <option value="DF">DF</option>
                            <option value="ES">ES</option>
                            <option value="GO">GO</option>
                            <option value="MA">MA</option>
                            <option value="MT">MT</option>
                            <option value="MS">MS</option>
                            <option value="MG">MG</option>
                            <option value="PA">PA</option>	 
                            <option value="PB">PB</option>
                            <option value="PR">PR</option>
                            <option value="PE">PE</option>
                            <option value="PI">PI</option>
                            <option value="RJ">RJ</option>
                            <option value="RN">RN</option>
                            <option value="RS">RS</option>
                            <option value="RO">RO</option>
                            <option value="RR">RR</option>
                            <option value="SC">SC</option>
                            <option value="SP">SP</option>
                            <option value="SE">SE</option>
                            <option value="TO">TO</option>						
                        </select>
                    </div>

                    <script>
                        document.getElementById("dis_estado").value = "${i.dis_estado}"
                    </script>

                    <div class="col-md-1">
                    </div>

                    <div class="col-md-3">				
                        <label>Número</label>
                        <input type="text" name="dis_numero" maxlength="5" class="form-control"
                            placeholder="Digite o Número"
                            value="<c:out value="${i.dis_numero}"/>"
                        />                                
                    </div>	
                </div>
            </div>
        </div>
        </c:forEach>
        <input type="hidden" name="id" value="${param.id}" />
        <input type="hidden" name="enviou" value="True" />
    </form>
</div>	

<%@include file="../../../resources/includes/footer.jsp" %>