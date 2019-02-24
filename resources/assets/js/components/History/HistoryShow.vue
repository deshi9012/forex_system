<template>
    <div class="userPage">
        <div class="portlet light">
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PROFILE SIDEBAR -->
                    <div class="profile-sidebar">
                        <!-- PORTLET MAIN -->
                        <div class="portlet light profile-sidebar-portlet ">
                            <!-- SIDEBAR USERPIC -->
                            <div class="profile-userpic">
                                <img src="images/user-icon-6.png" class="img-responsive" alt=""> </div>
                            <!-- END SIDEBAR USERPIC -->
                            <!-- SIDEBAR USER TITLE -->
                            <div class="profile-usertitle">
                                <div class="profile-usertitle-name">{{history.user.full_name}}</div>
                                <div class="profile-usertitle-job">{{history.user.position.name}}</div>
                            </div>
                            <!-- END SIDEBAR USER TITLE -->
                        </div>
                        <!-- END PORTLET MAIN -->
                        <!-- PORTLET MAIN -->
                        <div class="portlet light ">
                            <div>
                                <div class="margin-top-20 profile-desc-link">
                                    <i class="icon-envelope-open"></i>
                                    <span>
                                    {{history.user.email}}
                                </span>
                                </div>

                                <div class="margin-top-20 profile-desc-link">
                                    <i class="icon-call-end"></i>
                                    <span>
                                    {{history.user.phone_office}}
                                </span>
                                </div>

                            </div>
                        </div>
                        <!-- END PORTLET MAIN -->
                    </div>
                    <!-- END BEGIN PROFILE SIDEBAR -->
                    <!-- BEGIN PROFILE CONTENT -->
                    <div class="portlet-body userPage_block">
                        <!-- BEGIN FORM-->
                        <div class="userPage__info">
                            <span>Name</span>
                            <span>{{history.user.title}} {{history.user.full_name}}</span>
                        </div>

                        <div class="userPage__info">
                            <span>Position</span>
                            <span>{{history.user.position.name}}</span>
                        </div>
                        <div class="userPage__info">
                            <span>Username</span>
                            <span>{{history.user.username}}</span>
                        </div>

                        <!-- END FORM-->
                        <div class="form-actions">
                            <button @click="back()">Back</button>
                        </div>
                    </div>
                    <!-- END PROFILE CONTENT -->

                </div>
            </div>
        </div>

    </div>

</template>
<style>

</style>
<script>
   //import GameIndex from './components/header.vue'

	export default{
	name: 'history-show',
		props: [],
		computed: {
			id(){
				return this.$route.params.id;
			}
		},
		data(){
		   return{
				history:{
					user:{
					    username:'',
					    full_name:'',
					    position:{
					        name: ''
					    }
					},
					before_data: {},
					after_data: {}
				},
		   }
		},
	   	methods: {

			getHistory(){

				var self = this;
				axios.get('history/' + self.id)
					.then(function(response){
						self.history = response.data;
					});
			},
			back(){
        		this.$router.go(-1);
        	}
	   	},
	   	mounted: function () {
			this.getHistory();
	   	}
	}


</script>