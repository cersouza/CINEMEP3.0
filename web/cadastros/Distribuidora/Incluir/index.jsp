<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/navbar.jsp" %>

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
            <%@include file="../../includes/conexao.jsp" %>
            <sql:update dataSource="${conexao}" var="r">
                INSERT INTO distribuidora (dis_razaosocial,dis_nomefantasia,dis_cnpj,dis_ie,dis_site,dis_email,dis_endereco,dis_bairro,dis_cidade,dis_estado,dis_numero)
		VALUES (?,?,?,?,?,?,?,?,?,?,?);
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
                    <a class="btn btn-warning" href="../Menu/index.jsp">Voltar P�gina Anterior</a>                
                </div>
            </c:if> 			

            <c:if test="${IsErro1 == 'f'}">
                <div class="alert alert-danger">
                    <h1><strong>Erro!</strong></h1>
                    <p>Ocorreram o(s) seguinte(s) erro(s): <br />
                        <c:if test="${empty(param.dis_razaosocial)}">
                            Voc� esqueceu de digitar a raz�o social.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_nomefantasia)}">
                            Voc� esqueceu de digitar o nome fantasia.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_cnpj)}">
                            Voc� esqueceu de digitar o CNPJ.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_ie)}">
                            Voc� esqueceu de digitar a IE.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_site)}">
                            Voc� esqueceu de digitar o site.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_email)}">
                            Voc� esqueceu de digitar o e-mail.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_endereco)}">
                            Voc� esqueceu de digitar o endereco.<br />
                        </c:if>
                        <c:if test="${empty(param.dis_bairro)}">
                            Voc� esqueceu de digitar o bairro.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_cidade)}">
                            Voc� esqueceu de digitar a cidade.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_estado)}">
                            Voc� esqueceu de digitar o estado.<br />
                        </c:if> 
                        <c:if test="${empty(param.dis_numero)}">
                            Voc� esqueceu de digitar o n�mero.<br />
                        </c:if> 
                        <c:if test="${eS1 == 'f'}">
                            Erro na execu��o do SQL.<br />
                        </c:if>   
                    </p>
                    Por favor tente novamente.
                </div>
            </c:if>                           
        </c:if> 
    </c:if>
            
    <form action="index.jsp" method="post">
        <div id="actions" align="right">
            <a class="btn btn-default" href="../Menu/index.jsp">Voltar P�gina Anterior</a>
            <input type="submit" class="btn btn-primary" value="Salvar" />
        </div>
        
        <div class="row">
            <div class="form-group col-md-12">
                <label>Raz�o Social</label>
                <input type="text" name="dis_razaosocial" maxlength="50" class="form-control"
                    placeholder="Digite uma raz�o social" 
                    <c:if test="${IsErro1 == 'f'}">
                        value="<c:out value="${param.dis_razaosocial}"/>"
                    </c:if>
                />

                <label>Nome Fantasia</label>
                    <input type="text" name="dis_nomefantasia" maxlength="50" class="form-control"
                        placeholder="Digite um nome fantasia" 
                        <c:if test="${IsErro1 == 'f'}">
                            value="<c:out value="${param.dis_nomefantasia}"/>"
                        </c:if> 
                    />
                    
                <div class="row">
                    <div class="col-md-5">
                        <label>CNPJ</label>
                        <input type="text" name="dis_cnpj" maxlength="14" class="form-control"
                            placeholder="Digite o CNPJ" 
                            <c:if test="${IsErro1 == 'f'}">
                                value="<c:out value="${param.dis_cnpj}"/>"
                            </c:if>
                         />
                    </div>

                    <div class="col-md-2">
                    </div>

                    <div class="col-md-5">				
                        <label>IE</label>
                        <input type="text" name="dis_ie" maxlength="14" class="form-control"
                            placeholder="Digite o IE" 
                            <c:if test="${IsErro1 == 'f'}">
                                value="<c:out value="${param.dis_ie}"/>"
                            </c:if>
                         />
                    </div>	
                </div>		

                <label>Site</label>
                <input type="url" name="dis_site" maxlength="100" class="form-control"
                       placeholder="Digite o Site" 
                       <c:if test="${IsErro1 == 'f'}">
                           value="<c:out value="${param.dis_site}"/>"
                       </c:if>
                 />

                <label>E-mail</label>
                <input type="email" name="dis_email" maxlength="100" class="form-control"
                        placeholder="Digite o E-mail" 
                        <c:if test="${IsErro1 == 'f'}">
                            value="<c:out value="${param.dis_email}"/>"
                        </c:if>
                />

                <div class="row">
                    <div class="col-md-6">
                        <label>Endere�o</label>
                        <input type="text" name="dis_endereco" maxlength="60" class="form-control"
                            placeholder="Digite o Endere�o" 
                            <c:if test="${IsErro1 == 'f'}">
                                value="<c:out value="${param.dis_endereco}"/>"
                            </c:if>
                        />
                    </div>

                    <div class="col-md-1">
                    </div>

                    <div class="col-md-5">				
                        <label>Bairro</label>
                        <input type="text" name="dis_bairro" maxlength="40" class="form-control"
                            placeholder="Digite o Bairro" 
                            <c:if test="${IsErro1 == 'f'}">
                                value="<c:out value="${param.dis_bairro}"/>"
                            </c:if>
                        />                        
                    </div>	
                </div>

                <div class="row">
                    <div class="col-md-5">
                        <label>Cidade</label>
                        <input type="text" name="dis_cidade" maxlength="32" class="form-control"
                            placeholder="Digite o Cidade" 
                            <c:if test="${IsErro1 == 'f'}">
                                value="<c:out value="${param.dis_cidade}"/>"
                            </c:if>
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
                        document.getElementById("dis_estado").value = "SP"
                        <c:if test="${IsErro1 == 'f'}">
                            document.getElementById("dis_estado").value = "${param.dis_estado}"
                        </c:if>    
                    </script>

                    <div class="col-md-1">
                    </div>

                    <div class="col-md-3">				
                        <label>N�mero</label>
                        <input type="text" name="dis_numero" maxlength="5" class="form-control"
                            placeholder="Digite o N�mero"
                            <c:if test="${IsErro1 == 'f'}">
                                value="<c:out value="${param.dis_numero}"/>"
                            </c:if>
                        />                                
                    </div>	
                </div>
            </div>
        </div>

        <input type="hidden" name="enviou" value="True" />
    </form>
</div>	

<%@include file="../../includes/footer.jsp" %>