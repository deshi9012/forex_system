<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>elFinder 2.0</title>

    <!-- jQuery and jQuery UI (REQUIRED) -->
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

    <!-- elFinder CSS (REQUIRED) -->

    <!-- elFinder JS (REQUIRED) -->
    <script src="<?= asset('/packages/barryvdh/elfinder/js/elfinder.min.js') ?>"></script>


    <!-- elFinder initialization (REQUIRED) -->
    <script type="text/javascript" charset="utf-8">
        // Documentation for client options:
        // https://github.com/Studio-42/elFinder/wiki/Client-configuration-options
        $().ready(function() {
            $('#elfinder').elfinder({
                // set your elFinder options here
                customData: { 
                    _token: '<?= csrf_token() ?>'
                },
                url : '<?= route("elfinder.connector") ?>',  // connector URL
                soundPath: '<?= asset('/packages/barryvdh/elfinder/sounds') ?>',
	            cssAutoLoad: false,
	            height: 600
            });
        });
    </script>
</head>
<body>
<!-- Element where elFinder will be created (REQUIRED) -->
<div class="wrapper" style="width: 900px;">
	<div id="elfinder"></div>
</div>

</body>
</html>
