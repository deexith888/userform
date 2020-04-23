<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>User details</title>

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

</head>

<body>

	<div class="container">

		<form:form method="POST" modelAttribute="UserDetails"
			class="form-signin" action="/loginWeb/submitDetails" onsubmit="return validateRequired()">
			<h2 class="form-signin-heading">User form</h2>
			<div class="form-group">
				<form:input type="text" path="name" class="form-control" id="name"
					placeholder="name" autofocus="true"></form:input>
			</div>

			<div class="form-group">
				<form:input type="text" path="dob" class="form-control"
					id="datepicker" placeholder="Date of birth" autofocus="true"></form:input>
			</div>

			<div class="form-group">
				<form:input type="text" path="email" class="form-control" id="email"
					placeholder="Email" autofocus="true"></form:input>
			</div>

			<div class="form-group">
				<form:input type="text" path="phoneNumber" class="form-control"
					id="phoneNumber" placeholder="Phone number" autofocus="true"></form:input>
			</div>

			<button class="btn btn-lg btn-primary btn-block"
				onclick="return validatedetails()" type="submit">Submit</button>
		</form:form>

	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript">
		function validatedetails() {
			if ($('#name').val() == '') {
				alert("Enter your name");
				return false;
			}
			if ($('#datepicker').val() == '') {
				alert("Enter your DOB");
				return false;
			}

			if ($('#email').val().trim() == '') {
				alert("Enter your Email");
				return false;
			}
			if ($('#phoneNumber').val() == '') {
				alert("Enter your Phone number");
				return false;
			}

		}
	</script>
	<script type="text/javascript">
		$('#datepicker').datepicker({
			format : 'dd-mm-yyyy',
			todayBtn : 'linked',
			autoclose : true
		});
	</script>
	<script type="text/javascript">
		function validateRequired() {
			//alert("validate ");
			var regEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
			var regPhoneNum = /^\d{10}$/;
			if (!(regEmail.test($('#email').val()))) {
				alert('Invalid Email Address');
				return false;
			}

			if (!(regPhoneNum.test($('#phoneNumber').val()))) {
				alert('Invalid Phone number');
				return false;
			}

			var dob= $('#datepicker').val().split('-')[2];
			var now  = new Date().getFullYear();
			//alert(now-dob);
			if(now-dob<18){
				alert('Age should be above 18');
				return false;
				}
			

		}
	</script>
</body>
</html>