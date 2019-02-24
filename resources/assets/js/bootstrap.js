
/**
 * First we will load all of this project's JavaScript dependencies which
 * include Vue and Vue Resource. This gives a great starting point for
 * building robust, powerful web applications using Vue and Laravel.
 */

/**
 * We'll load jQuery and the Bootstrap jQuery plugin which provides support
 * for JavaScript based Bootstrap features such as modals and tabs. This
 * code may be modified to fit the specific needs of your application.
 */

window.$ = window.jQuery = require('jquery');

require('bootstrap-sass');
require('jquery-ui-bundle');
window._ = require('lodash');

window.swal = require('sweetalert2');

window.clipboard = require('clipboard');
// window.izimodal = require('izimodal');

window.Promise = require("bluebird");
Promise.config({
	// Enable warnings
	warnings: true,
	// Enable long stack traces
	longStackTraces: true,
	// Enable cancellation
	cancellation: true,
	// Enable monitoring
	monitoring: true
});

require('./smPackages/_vaHttpWrapper.js');

require('froala-editor');
require('../../../node_modules/froala-editor/js/plugins/align.min.js');
require('../../../node_modules/froala-editor/js/plugins/colors.min.js');
require('../../../node_modules/froala-editor/js/plugins/code_view.min.js');
require('../../../node_modules/froala-editor/js/plugins/align.min.js');
require('../../../node_modules/froala-editor/js/plugins/char_counter.min.js');
require('../../../node_modules/froala-editor/js/plugins/code_beautifier.min.js');
require('../../../node_modules/froala-editor/js/plugins/code_view.min.js');
require('../../../node_modules/froala-editor/js/plugins/colors.min.js');
require('../../../node_modules/froala-editor/js/plugins/draggable.min.js');
require('../../../node_modules/froala-editor/js/plugins/emoticons.min.js');
require('../../../node_modules/froala-editor/js/plugins/entities.min.js');
require('../../../node_modules/froala-editor/js/plugins/file.min.js');
require('../../../node_modules/froala-editor/js/plugins/font_family.min.js');
require('../../../node_modules/froala-editor/js/plugins/font_size.min.js');
require('../../../node_modules/froala-editor/js/plugins/fullscreen.min.js');
require('../../../node_modules/froala-editor/js/plugins/help.min.js');
require('../../../node_modules/froala-editor/js/plugins/image.min.js');
require('../../../node_modules/froala-editor/js/plugins/image_manager.min.js');
require('../../../node_modules/froala-editor/js/plugins/inline_style.min.js');
require('../../../node_modules/froala-editor/js/plugins/line_breaker.min.js');
require('../../../node_modules/froala-editor/js/plugins/link.min.js');
require('../../../node_modules/froala-editor/js/plugins/lists.min.js');
require('../../../node_modules/froala-editor/js/plugins/paragraph_format.min.js');
require('../../../node_modules/froala-editor/js/plugins/paragraph_style.min.js');
require('../../../node_modules/froala-editor/js/plugins/print.min.js');
require('../../../node_modules/froala-editor/js/plugins/quick_insert.min.js');
require('../../../node_modules/froala-editor/js/plugins/quote.min.js');
require('../../../node_modules/froala-editor/js/plugins/save.min.js');
require('../../../node_modules/froala-editor/js/plugins/special_characters.min.js');
require('../../../node_modules/froala-editor/js/plugins/table.min.js');
require('../../../node_modules/froala-editor/js/plugins/url.min.js');
require('../../../node_modules/froala-editor/js/plugins/video.min.js');
require('../../../node_modules/froala-editor/js/plugins/word_paste.min.js');

// require('node_modules/froala-editor/js/plugins/font_family.min.js');
// require('node_modules/froala-editor/js/plugins/font_size.min.js');

$(document).ready(function () {
	console.log('in');
	require( 'datatables.net' );
	require( 'datatables.net-bs' );
});

require('../../../node_modules/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js');
// require( 'datatables.net' )();

/**
 * Vue is a modern JavaScript library for building interactive web interfaces
 * using reactive data binding and reusable components. Vue's API is clean
 * and simple, leaving you to focus on building your next great project.
 */

window.Vue = require('vue');

// require('vue-resource');

// import VueSweetAlert from 'vue-sweetalert'
import axios from 'axios'
import VueAxios from 'vue-axios'

window.axios = axios;
window.Vue.use(VueAxios, axios);

// window.Vue.use(VueSweetAlert)

import { sync } from 'vuex-router-sync'

/**
 * We'll register a HTTP interceptor to attach the "CSRF" header to each of
 * the outgoing requests issued by this application. The CSRF middleware
 * included with Laravel will automatically verify the header's value.
 */

axios.defaults.headers.common['X-CSRF-TOKEN'] = Laravel.csrfToken;
// Vue.axios.interceptors.request.use(function (config) {
//     config.headers['X-CSRF-TOKEN'] = Laravel.csrfToken;
//
//     return config;
// }, function (error) {
//     // Do something with request error
//     return Promise.reject(error);
// });

// Vue.http.interceptors.push((request, next) => {
//     request.headers.set('X-CSRF-TOKEN', Laravel.csrfToken);
//
//     next();
// });

/**
 * Echo exposes an expressive API for subscribing to channels and listening
 * for events that are broadcast by Laravel. Echo and event broadcasting
 * allows your team to easily build robust real-time web applications.
 */

// import Echo from "laravel-echo"

// window.Echo = new Echo({
//     broadcaster: 'pusher',
//     key: 'your-pusher-key'
// });


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */


/* HTTP Wrapper over Axios */
//import _sm from './smPackages/_vaHttpWrapper.js'
// window._sm = {};
// _sm.http = new _vaHttp();