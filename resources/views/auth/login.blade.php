@extends('layouts.app')

@section('content')
<div class="login login_small">
        <form role="form" method="POST" action="{{ url('/login') }}">
            {{ csrf_field() }}
            <img src="images/logo.svg" alt="">
            <h3>Login</h3>
            <div class="form-group{{ $errors->has('username') ? ' has-error' : '' }}">
                <div class="inputHolder_text inputHolder">
                    <input placeholder="username" id="username" type="text" class="form-control" name="username" value="{{ old('username') }}" autofocus>

                    @if ($errors->has('username'))
                        <span class="help-block">
                            <strong>{{ $errors->first('username') }}</strong>
                        </span>
                    @endif
                </div>
            </div>

            <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                <div class="inputHolder_password inputHolder">
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
                        <input type="checkbox" name="remember" id="login__check" {{ old('remember') ? 'checked' : ''}}>
                        <label for="login__check">
                             Remember Me
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div>
                    <button type="submit" class="btn btn-primary btn_short">
                        Login
                    </button>

                    <a class="btn btn_transparent" href="{{ url('/password/reset') }}">
                        Forgot Your Password?
                    </a>
                </div>
            </div>
        </form>
</div>
@endsection
