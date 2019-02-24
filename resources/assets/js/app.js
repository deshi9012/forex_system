import './bootstrap.js';
const {router} = require('./routes.js');

import SidebarComponent from './components/SidebarComponent.vue'
import HeaderComponent from './components/HeaderComponent.vue'

Vue.config.debug = true;

const app = new Vue({
    el: '#app',
    router,
    data: {
        message:'hello',
        sm_breadcrumbs: '',
		error: {}
    },
    components: {
        'header-component': HeaderComponent,
        'sidebar-component': SidebarComponent,
    },
    methods:{
    },
    mounted() {
        var self = this;
    },
    watch: {
        $route: function (val) {

            // format route for breadcrumbs
            if(val.name) {

                //console.log(val);

                var parts = val.name.split('-');
                self.sm_breadcrumbs = '';
                var length = parts.length;

                parts.forEach(function (element, index) {
                    if(index + 1 == length) {
                        self.sm_breadcrumbs += '<li class="active-breadcrumb"><a href="javascript:;">' + element + '</a></li>';
                    } else {
                        self.sm_breadcrumbs += '<li><a href="#/' + element + '">' + element + '</a></li>';
                    }
                });

            }
        }
    }
});