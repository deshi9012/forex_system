<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>Metronic Admin Theme #1 | Blank Page Layout</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="Preview page of Metronic Admin Theme #1 for blank page layout" name="description"/>
    <meta content="" name="author"/>

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet"
          type="text/css"/>
    <link href="../metronic/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    {{--<link href="../metronic/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>--}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">



    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">

    <link rel="stylesheet" href="../orgchart/dist/css/jquery.orgchart.css">

	<link href="/css/iziModal.css" rel="stylesheet" />
	<link href="/css/jquery.mCustomScrollbar.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/profile.min.css">

	<!-- elFinder CSS (REQUIRED) -->
	<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" href="<?= asset('/packages/barryvdh/elfinder/css/elfinder.min.css') ?>">
	<link rel="stylesheet" type="text/css" href="<?= asset('/packages/barryvdh/elfinder/css/theme.css') ?>">
	<link rel="stylesheet" type="text/css" href="<?= asset('/packages/barryvdh/elfinder/css/themes/Material/theme.css') ?>">

	<link rel="stylesheet" href="/css/all.css">
    <link rel="stylesheet" href="/css/app.css">


    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
<div class="page-wrapper">
    <div id="app">
        @yield('content')

    </div>

</div>

@include ('layouts.footer')

<!-- BEGIN CORE PLUGINS -->
<!-- END CORE PLUGINS -->
<script>
	window.Laravel = <?php echo json_encode([
			'csrfToken' 		=> csrf_token(),
	]); ?>;
	window.impersonate_mode = 'false';
	window._auth_data = {
		'username': '{{ $username }}',
		'avatar': '{{ $avatar }}'
	};
</script>
<script src="../js/app.js" type="text/javascript"></script>
<script src="../metronic/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../metronic/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="../metronic/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="../metronic/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="../metronic/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>

<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="../metronic/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="../metronic/layouts/layout/scripts/layout.js" type="text/javascript"></script>
<script src="../metronic/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>

<!-- Include Code Mirror CSS. -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>

{{--<script src="../js/all.js" type="text/javascript"></script>--}}

<!-- END THEME LAYOUT SCRIPTS -->
<script src="../orgchart/dist/js/jquery.orgchart.js"></script>

<!-- Begin Select 2 SHTE TE BIQ ILIIKA!!!-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<!-- End Select 2 -->

<!-- elFinder JS (REQUIRED) -->
<script src="<?= asset('/packages/barryvdh/elfinder/js/elfinder.min.js') ?>"></script>

</body>

</html>