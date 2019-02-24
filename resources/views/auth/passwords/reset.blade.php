@extends('layouts.app')

@section('content')

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
            <input type="hidden" name="token" value="{{ $token }}">

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
                    <input id="password" type="password" class="form-control" placeholder="Password" name="password">

                    @if ($errors->has('password'))
                        <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                    @endif
                </div>
            </div>

            <div class="form-group{{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
                <div class="inputHolder_password inputHolder">
                    <input id="password-confirm" type="password" class="form-control" placeholder="Confirm Password" name="password_confirmation">

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
@endsection
