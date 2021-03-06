<%@ include file="/common/taglibs.jsp"%>
<form action="j_spring_security_check" method="post">


	<div class="container">
		<div class="row vertical-offset-100">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">

					<div class="panel-body">

						<fieldset>
							<c:if test="${not empty param.login_error}">
								<div class="alert alert-danger alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<strong>Error!</strong> Invalid user name or password!
								</div>
							</c:if>
							<div class="form-group">
								<s:textfield name="j_username" cssClass="form-control"
									label="User" id="j_username" value="%{#request.appUser}" />
							</div>

							<div class="form-group">
								<s:password cssClass="form-control" name="j_password"
									label="Password" id="j_password" />
							</div>

							<input class="btn btn-success btn-block" type="submit"
								value="Login">
						</fieldset>

					</div>
				</div>
			</div>
		</div>
	</div>

</form>


