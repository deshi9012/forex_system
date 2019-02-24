@extends('layouts.app')

<!-- Main Content -->
@section('content')
<div class="login">
    <div class="panel-body">
        @if (session('status'))
            <div class="alert alert-success">
                {{ session('status') }}
            </div>
        @endif
    </div>
    <form class="form-horizontal" role="form" method="POST" action="{{ url('/password/email') }}">
        {{ csrf_field() }}
        <h3>Reset Password</h3>
        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
            <div class="inputHolder_email inputHolder">
                <input placeholder="email" id="email" type="email" class="form-control" name="email" value="{{ old('email') }}">

                @if ($errors->has('email'))
                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                @endif
            </div>
        </div>

        <div class="form-group">
            <div>
                <button type="submit" class="btn btn-primary">
                    Send Password Reset Link
                </button>
                <a href="" class="btn btn_transparent">Back</a>
            </div>
        </div>
    </form>
</div>
@endsection
