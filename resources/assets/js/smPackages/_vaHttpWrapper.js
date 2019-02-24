window.errorTypes = require('./errorCodes');

window.addEventListener("unhandledrejection", function(e) {
	// NOTE: e.preventDefault() must be manually called to prevent the default
	// action which is currently to log the stack trace to console.warn
	e.preventDefault();
	// NOTE: parameters are properties of the event detail property
	var reason = e.detail.reason;
	var promise = e.detail.promise;

	//First we chack if this is an AJAX request
	if(reason.hasOwnProperty('response')) {
		//Add this in case:when session is еxpired and try ot access some section
		if ( reason.response.status == 401 ) {

			window.location.href = '/login';
		}

		if(reason.response.status == 422) {
			_.forEach(reason.response.data, function(value, key) {
				// console.log(key);
				// console.log(value);
				// console.log('blabla');
				Vue.set(window.componentInstance['error'], key, value[0]);
			});

			return;
		}

		//Check if this is an error
		var error = _.find(errorTypes, { 'HTTPStatusCode': reason.response.status});

		if(error) {
			swal(
				'Oops...',
				error.description,
				'error'
			)
		}
	}
});



window._smReady = function(callback, self){

	// if(!self.domLoaded) {

		// self.$nextTick(function () {

			$(function() {

				//console.log('execute on load');

				callback.call(self);
				// self.domLoaded = true;

			});

		// });
	// }
};

//
// class _vaHttp {
//
//     constructor(settings) {
//
// 		console.log('asdf');
//
//         var defaults = {
//             url: '/',
//             method: 'GET',
//             data: {},
//             success: this.handleSuccess,
//             error: this.handleError,
//             httpProcessor: window.axios
//         };
//
//         this.settings = Object.assign({}, defaults, settings);
//     }
//
//     get(params) {
//         params.method = "GET";
//         this.sendRequest(params);
//     }
//
//     delete(params) {
//         params.method = "DELETE";
//         this.sendRequest(params);
//     }
//
//     post(params) {
//         params.method = "POST";
//         this.sendRequest(params);
//     }
//
//     put(params) {
//         params.method = "PUT";
//         this.sendRequest(params);
//     }
//
//     sendRequest(params) {
//         var self = this;
//         this.settings = Object.assign({}, this.settings, params);
//
// 		console.log(this);
// 		return;
//
//         this.settings.httpProcessor({
//             method: this.settings.method,
//             url: this.settings.url,
//             data: this.settings.data,
//         }).then(function (response) {
//             self.settings.success(response);
//         }).catch(function (error) {
//             self.settings.error(error);
//         });
//     }
//
//     handleSuccess(data) {
//         console.log(data);
//     }
//
//     handleError(error) {
//         //Your long error method;
//         console.log(error);
//     }
// }
//
// window._sm  = {
//
// 	http: eval(function(settings){
// 		// console.log(_vaHttp);
// 		return _vaHttp(settings);
// 	})
// }
//
// export default _sm;
//
//
// _sm.http.get = function (something) {
// 	console.log(something);
// }