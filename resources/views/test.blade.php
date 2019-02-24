<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- CSRF Token -->
	<meta name="csrf-token" content="{{ csrf_token() }}">

	<title>{{ config('app.name', 'Laravel') }}</title>


	<!-- Styles -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<link href="/css/app.css" rel="stylesheet">

	<!-- Scripts -->
	<script>
		window.Laravel = <?php echo json_encode([
				'csrfToken'         => csrf_token()
		]); ?>;
		window.impersonate_mode = 'false';
	</script>
</head>
<body>
<div id="app">
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">

				<!-- Collapsed Hamburger -->
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
					<span class="sr-only">Toggle Navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>

				<!-- Branding Image -->
				<a class="navbar-brand" href="{{ url('/') }}">
					{{ config('app.name', 'Laravel') }}
				</a>
			</div>

			<div class="collapse navbar-collapse" id="app-navbar-collapse">
				<!-- Left Side Of Navbar -->
				<ul class="nav navbar-nav">
					&nbsp;
				</ul>

				<!-- Right Side Of Navbar -->

			</div>
		</div>
	</nav>

	<div class="login">
		<div class="panel-body">
			@if (session('status'))
				<div class="alert alert-success">
					{{ session('status') }}
				</div>
			@endif
		</div>
		<form class="form-horizontal" role="form" method="POST" action="{{ url('/password/reset') }}">
			{{ csrf_field() }}
			<img src="images/logo.svg" alt="">

			<h3>Reset Password</h3>
			{{--<input type="hidden" name="token" value="{{ $token }}">--}}

			<div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">

				<div class="inputHolder_email inputHolder">
					<input id="email" type="email" class="form-control" placeholder="Email" name="email" value="{{ $email or old('email') }}"autofocus>

					@if ($errors->has('email'))
						<span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
					@endif
				</div>
			</div>

			<div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
				<div class="inputHolder_password inputHolder">
					<input id="password" type="password" class="form-control" name="password" placeholder="Password">

					@if ($errors->has('password'))
						<span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
					@endif
				</div>
			</div>

			<div class="form-group{{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
				<div class="inputHolder_password inputHolder">
					<input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Confirm Password">

					@if ($errors->has('password_confirmation'))
						<span class="help-block">
                                        <strong>{{ $errors->first('password_confirmation') }}</strong>
                                    </span>
					@endif
				</div>
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-primary">
					Reset Password
				</button>
			</div>
		</form>
	</div>

</div>
<script>
	var loginPage = document.querySelector('.login').parentElement;
	var elements = document.querySelectorAll('.form-group');

	elements.forEach(function (element) {
		element.addEventListener('click',function (e) {
			var target = document.querySelector('.has-error');
			if(e.currentTarget == target){
				target.classList.remove("has-error");
				target.querySelector('.help-block').classList.add("help-block__hidden");
			}
		});
		if(loginPage){
			loginPage.childNodes[1].style.display = 'none';
		}
	})


</script>
<!-- Scripts -->
{{--<script src="/js/app.js"></script>--}}
</body>
</html>
