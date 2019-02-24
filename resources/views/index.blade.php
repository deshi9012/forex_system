@extends('layouts.admin_base')

@section('content')
	<header-component></header-component>
	<!-- BEGIN HEADER & CONTENT DIVIDER -->
	<div class="clearfix"></div>
	<!-- END HEADER & CONTENT DIVIDER -->

	<!-- BEGIN CONTAINER -->
	<div class="page-container">

		<!-- BEGIN SIDEBAR -->
		<sidebar-component></sidebar-component>
		<!-- END SIDEBAR -->

		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">

			<!-- BEGIN CONTENT BODY -->
			<div class="page-content">
				<router-view></router-view>
			</div>

			<!-- END CONTENT BODY -->
		</div>
	@if(Session::has('impersonate_id'))
		<div class="impersonate">
			<div class="impersonate__as">
				logged in as
				<span>{{ Session::get('full_name') }}</span>
			</div>


			<a href="/impersonate/out" class="impersonate__out">Revert</a>
		</div>
	@endif
		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->
	<div class="scroll-to-top">
		<i class="icon-arrow-up"></i>
	</div>
	<!-- BEGIN FOOTER -->

	<!-- END FOOTER -->
@endsection