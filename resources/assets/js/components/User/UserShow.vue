<template>
    <div>
        <div class="page-bar page-bar_form page-bar_bordered">
            <breadcrumb-component></breadcrumb-component>

            <div class="page-toolbar">
                <button @click="back()" class="btn default">Back</button>
                <router-link :to="{ name: 'user-edit', params: { userId: user.id }}" class="btn blue">Edit</router-link>

            </div>
        </div>

        <div class="userPage">
            <div class="userPage__sidebar">
                <div id="avatar_placeholder" class="userPage__img" @click="passClick()">
                    <img :src="user.avatar" class="img-responsive" alt="">
                </div>

                <div class="userPage__usertitle">
                    <h3>{{user.first_name}} {{user.last_name}} </h3>
                    <h4>{{user.position.name}}</h4>
                </div>
                <div class="userPage__connect">
                    <div>
                        <i class="icon-envelope-open"></i>
                        <span>{{user.email_personal}}</span>
                    </div>

                    <div>
                        <i class="icon-envelope-open"></i>
                        <span>{{user.email}}</span>
                    </div>

                    <div>
                        <i class="icon-call-end"></i>
                        <span>{{user.phone_personal}}</span>
                    </div>

                    <div>
                        <i class="icon-call-end"></i>
                        <span>{{user.phone_office}}</span>
                    </div>
                </div>
                <div class="userPage_block">
                    <div class="userPage__info">
                        <span>Name</span>
                        <span>{{user.title}} {{user.first_name}} {{user.last_name}}</span>
                    </div>

                    <div class="userPage__info">
                        <span>Position</span>
                        <span>{{user.position.name}}</span>
                    </div>
                    <div class="userPage__info">
                        <span>Work Week</span>
                        <span>{{user.work_week}}</span>
                    </div>
                    <div class="userPage__info">
                        <span>Timezone</span>
                        <span>{{user.timezone.timezone}}</span>
                    </div>

                    <div class="userPage__info">
                        <span>Salary</span>
                        <span>{{user.salary}}</span>
                    </div>

                    <div class="userPage__info">
                        <span>Username</span>
                        <span>{{user.username}}</span>
                    </div>

                    <div class="userPage__info">
                        <span>Superior</span>
                        <span v-if="user.superior">{{user.superior.title}} {{user.superior.first_name}} {{user.superior.last_name}} </span>
                        <span v-else>N/A</span>
                    </div>

                        <button v-show="impersonateState"  @click="impersonate()" class="btn blue">Login as this user</button>

                </div>
            </div>
            <div class="userPage__table">
                <user-files></user-files>
                <div class="form-actions">
                    <button @click="back()" class="btn default">Back</button>
                    <router-link :to="{ name: 'user-edit', params: { userId: user.id }}" class="btn blue">Edit</router-link>
                </div>
            </div>

        </div>
    </div>

</template>
<style>

</style>
<script>
   //import GameIndex from './components/header.vue'

	import UserFiles from '../FileManagement/FileManagement_user_profile.vue'
    import BreadcrumbComponent from '../BreadcrumbComponent.vue'


	export default{
	name: 'user-page',
		props: [],
		watch: {
			$route: function() {
				this.init();
			}
		},
		computed: {
			id(){
				return this.$route.params.id;
			},
			impersonateState(){
                var self = this;

                var impersonate_mode = this.getCookie("impersonate_mode");
                //console.log(impersonate_mode);
                if (impersonate_mode != "" || window.user_id == self.id) {
                    return false;
                }
                else {
                    return true;
                }
            }
		},
		data(){
		   return{
				user:{
					position:{},
					superior:{},
					timezone:{}
				},
		   }
		},
		components:{
			'user-files': UserFiles,
			'breadcrumb-component':BreadcrumbComponent
		},
	   	methods: {
	   	    impersonate(){
                var self = this;

                axios.post('impersonate',{'id':self.id})
                    .then(function(response){
						//set window.impersonate_mode to true
						//console.log(window.impersonate_mode);
						if(response.data.impersonate_mode == 'true'){

						    document.cookie="impersonate_mode=true";

						    window.location = '/admin';

						}

					});

	   	    },
	   	    getCookie(cname) {
                var name = cname + "=";
                var decodedCookie = decodeURIComponent(document.cookie);
                var ca = decodedCookie.split(';');
                for(var i = 0; i <ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                        return c.substring(name.length, c.length);
                    }
                }
                return "";
            },
			getUser(){
				var self = this;
				axios.get('user/' + self.id)
					.then(function(response){
						self.user = response.data;
					});
			},
			back(){
        		this.$router.go(-1);
        	},
        	getRandomInt(min, max) {
                return Math.floor(Math.random() * (max - min + 1) + min);
            },
        	initDropzone() {

				var self = this;

        		try {
					this.dropzoneObj = this.Dropzone.forElement("#avatar_placeholder");
				} catch(error) {

					this.Dropzone.autoDiscover = false;
					this.dropzoneObj = new this.Dropzone("#avatar_placeholder", {
						url: "/avatar",
						headers: {
							'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
						},
						paramName: "content", // The name that will be used to transfer the file
						maxFilesize: 2, // MB
						accept: function(file, done) {
							done();

						},
						init: function() {
							this.on("addedfile", function(file) {
								//console.log(file)
							});
							//console.log('ready');
						},
						sending: function(file, xhr, formData) {
						  // Will send the filesize along with the file as POST data.
						  formData.append("user_id", window.user_id);
						},
						previewsContainer: false,
						success: function(something, response) {
							var firstState = self.user.avatar + '?refresh=' + self.getRandomInt(1,100);

							//self.user.avatar = '/images/user-icon.svg';
							self.user.avatar = firstState;
							self.$forceUpdate();
						}
					});
				}


				if(this.id != window.user_id) {
					console.log('disable');
        			this.dropzoneObj.disable();
        		} else {
        			console.log('enable');
        			this.dropzoneObj.enable();
        		}

        	},
        	passClick(){
        		$('#avatar_placeholder').trigger('click');
        	},
        	init() {
        		this.getUser();
        		this.initDropzone();
        	}
	   	},
	   	mounted: function () {
			this.Dropzone = require("dropzone");
			this.init();

			$('.userPage__sidebar').mCustomScrollbar({
					 theme:"inset"
			});
	   	}
	}


</script>