<template>
    <!--<div class="userPage">-->
        <!--<div class="portlet light">-->
            <!--<div class="row">-->
                <!--<div class="col-md-12">-->
                    <!--&lt;!&ndash; BEGIN PROFILE SIDEBAR &ndash;&gt;-->
                    <!--<div class="profile-sidebar">-->
                        <!--&lt;!&ndash; PORTLET MAIN &ndash;&gt;-->
                        <!--<div class="portlet light profile-sidebar-portlet ">-->
                            <!--&lt;!&ndash; SIDEBAR USERPIC &ndash;&gt;-->
                            <!--<div class="profile-userpic">-->
                                <!--<img src="images/user-icon-6.png" class="img-responsive" alt=""> </div>-->
                            <!--&lt;!&ndash; END SIDEBAR USERPIC &ndash;&gt;-->
                            <!--&lt;!&ndash; SIDEBAR USER TITLE &ndash;&gt;-->
                            <!--<div class="profile-usertitle">-->
                                <!--<div class="profile-usertitle-name">{{user.first_name}} {{user.last_name}} </div>-->
                                <!--<div class="profile-usertitle-job">{{user.position.name}}</div>-->
                            <!--</div>-->
                            <!--&lt;!&ndash; END SIDEBAR USER TITLE &ndash;&gt;-->
                        <!--</div>-->
                        <!--&lt;!&ndash; END PORTLET MAIN &ndash;&gt;-->
                        <!--&lt;!&ndash; PORTLET MAIN &ndash;&gt;-->
                        <!--<div class="portlet light ">-->
                            <!--<div>-->
                                <!--<div class="margin-top-20 profile-desc-link">-->
                                    <!--<i class="icon-envelope-open"></i>-->
                                    <!--<span>-->
                                    <!--{{user.email_personal}}-->
                                <!--</span>-->
                                <!--</div>-->
                                <!--<div class="margin-top-20 profile-desc-link">-->
                                    <!--<i class="icon-envelope-open"></i>-->
                                    <!--<span>-->
                                    <!--{{user.email}}-->
                                <!--</span>-->
                                <!--</div>-->
                                <!--<div class="margin-top-20 profile-desc-link">-->
                                    <!--<i class="icon-call-end"></i>-->
                                    <!--<span>-->
                                    <!--{{user.phone_personal}}-->
                                <!--</span>-->
                                <!--</div>-->
                                <!--<div class="margin-top-20 profile-desc-link">-->
                                    <!--<i class="icon-call-end"></i>-->
                                    <!--<span>-->
                                    <!--{{user.phone_office}}-->
                                <!--</span>-->
                                <!--</div>-->

                            <!--</div>-->
                        <!--</div>-->
                        <!--&lt;!&ndash; END PORTLET MAIN &ndash;&gt;-->
                    <!--</div>-->
                    <!--&lt;!&ndash; END BEGIN PROFILE SIDEBAR &ndash;&gt;-->
                    <!--&lt;!&ndash; BEGIN PROFILE CONTENT &ndash;&gt;-->
                    <!--<div class="portlet-body userPage_block">-->
                        <!--&lt;!&ndash; BEGIN FORM&ndash;&gt;-->
                        <!--<div class="userPage__info">-->
                            <!--<span>Name</span>-->
                            <!--<span>{{user.title}} {{user.first_name}} {{user.last_name}}</span>-->
                        <!--</div>-->

                        <!--<div class="userPage__info">-->
                            <!--<span>Position</span>-->
                            <!--<span>{{user.position.name}}</span>-->
                        <!--</div>-->
                        <!--<div class="userPage__info">-->
                            <!--<span>Work Week</span>-->
                            <!--<span>{{user.work_week}}</span>-->
                        <!--</div>-->
                        <!--<div class="userPage__info">-->
                            <!--<span>Timezone</span>-->
                            <!--<span>{{user.timezone.timezone}}</span>-->
                        <!--</div>-->

                        <!--<div class="userPage__info">-->
                            <!--<span>Salary</span>-->
                            <!--<span>{{user.salary}}</span>-->
                        <!--</div>-->

                        <!--<div class="userPage__info">-->
                            <!--<span>Username</span>-->
                            <!--<span>{{user.username}}</span>-->
                        <!--</div>-->

                        <!--<div class="userPage__info">-->
                            <!--<span>Superior</span>-->
                            <!--<span v-if="user.superior">{{user.superior.title}} {{user.superior.first_name}} {{user.superior.last_name}} </span>-->
                            <!--<span v-else>N/A</span>-->
                        <!--</div>-->
                        <!--&lt;!&ndash; END FORM&ndash;&gt;-->
                        <!--<div class="form-actions">-->
                            <!--<button @click="closePopup" class="btn default">Back</button>-->
                        <!--</div>-->
                    <!--</div>-->
                    <!--&lt;!&ndash; END PROFILE CONTENT &ndash;&gt;-->

                <!--</div>-->
            <!--</div>-->
        <!--</div>-->

    <!--</div>-->
    <div class="userPopup">
        <div>
            <div v-if='user.email_personal'>
                <i class="icon-envelope-open"></i>
                <span>
                {{user.email_personal}}
                </span>
            </div>
            <div v-if='user.email' >
                <i class="icon-envelope-open"></i>
                <span>
                {{user.email}}
                </span>
            </div>
            <div v-if='user.phone_personal' >
                <i class="icon-call-end"></i>
                <span>
                {{user.phone_personal}}
                </span>
            </div>
            <div v-if='user.phone_office'>
                <i class="icon-call-end"></i>
                <span>
                {{user.phone_office}}
                </span>
            </div>
			<div>
				<router-link :to="'/user/' + id" class="btn-link">
					<i class="icon-user"></i><span>Show profile</span>
				</router-link>
			</div>
        </div>

        <i @click="closePopup" class="icon-arrow-up" aria-hidden="true"></i>
    </div>
</template>
<style>

</style>
<script>
   //import GameIndex from './components/header.vue'

	//import UserFiles from '../FileManagement/UserFiles.vue'
	//import UserFiles from '../FileManagement/FileManagement.vue'

	export default{
	name: 'tree-item',
		props: ['id'],

		data(){
		   return{
				user:{
					position:{
					    name:''
					},
					superior:{},
					timezone:{
					    timezone:''
					}
				},
		   }
		},
		components:{
			//'user-files': UserFiles,
		},
		watch:{
		    id:function(){
		        if(this.id != undefined){
		            this.getUser();
		        }

		    }
		},
	   	methods: {

			getUser(){
				var self = this;
				axios.get('user/' + self.id)
					.then(function(response){
						self.user = response.data;

					});
			},
			closePopup(){
			    this.$emit("closePopup")
			}
	   	},
	   	mounted: function () {
            this.getUser();
	   	}
	}


</script>