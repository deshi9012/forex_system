/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */
var elixir = require('laravel-elixir');
require('laravel-elixir-sass-compass');
require('laravel-elixir-vue-2');

var paths = {
    // 'bootstrap_sass': './node_modules/bootstrap-sass/assets/',
    'jquery': './node_modules/jquery/'
};

elixir(function (mix) {
    mix
        // .copy(paths.bootstrap_sass + 'stylesheets/**', './resources/assets/sass/bootstrap')
		.copy('./node_modules/sweetalert2/src/sweetalert2.scss', 'resources/assets/scss/plugins/sweetalert2.scss')
		.copy('./node_modules/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css', 'public/css/jquery.mCustomScrollbar.css')
        .compass("app.scss", "public/css", {
            style: "expanded",
            sass: "./resources/assets/scss",
            font: "public/assets/fonts",
            image: "public/assets/images",
            javascript: "public/assets/js",
            sourcemap: true
        })
        // .copy(paths.bootstrap_sass + 'fonts/bootstrap/**', 'public/fonts/bootstrap')
        .copy(paths.jquery + 'dist/jquery.js', 'public/js/dist')
		.scripts([
			// './node_modules/froala-editor/js/froala_editor.min.js',
			// './node_modules/froala-editor/js/plugins/*.js'
		])
		.styles([
			'./node_modules/froala-editor/css/froala_editor.css',
			'./node_modules/froala-editor/css/froala_style.css',
			'./node_modules/froala-editor/css/plugins/*.css',
			'./node_modules/froala-editor/css/themes/dark.css',
			'./node_modules/animate.css/animate.min.css'
		])
        .webpack('app.js', 'public/js/app.js')
});