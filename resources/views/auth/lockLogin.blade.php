@extends('layouts.app')

@section('content')

	<div class="login login_small">
		<form class="form-horizontal" role="form" method="POST" action="{{ url('/login') }}">
			{{ csrf_field() }}
			<img src="images/logo.svg" alt="">
			<div class="form-group{{ $errors->has('username') ? ' has-error' : '' }} inputHolder_email inputHolder">
				<input placeholder="username" id="username" type="hidden" class="form-control" name="username" value="{{ Request::cookie('username') }}">

				<h3>
					Hello {{ Request::cookie('username') }}
				</h3>
			</div>

			<div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
				<div class="inputHolder inputHolder_passowrd">
					<input placeholder="password" id="password" type="password" class="form-control" name="password">

					@if ($errors->has('password'))
						<span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
					@endif
				</div>
			</div>
			<div class="form-group">
				<div>
					<div class="checkbox">
						<label>
							<input type="checkbox" name="remember" {{ old('remember') ? 'checked' : ''}}> Remember Me
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div>
					<button type="submit" class="btn btn-primary btn_short">
						Login
					</button>

					<a class="btn btn_transparent" href="clearCookie">
						You are not {{ Request::cookie('username') }} ?
					</a>
				</div>
			</div>
		</form>
	</div>
@endsection
