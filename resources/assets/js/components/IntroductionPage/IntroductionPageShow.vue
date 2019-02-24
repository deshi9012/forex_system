<template>
    <div>
        <div class="page-bar">
            <breadcrumb-component></breadcrumb-component>
        </div>

        <div class="userPage">
            <div class="userPage__sidebar">
                <div class="userPage__img">
                    <img src="images/user-icon.svg" class="img-responsive" alt="">
                </div>
                <div class="userPage__usertitle">

                </div>
                <div class="userPage__connect">
                    <div>
                        <i class="icon-envelope-open"></i>

                    </div>

                    <div>
                        <i class="icon-envelope-open"></i>

                    </div>

                    <div>
                        <i class="icon-call-end"></i>

                    </div>

                    <div>
                        <i class="icon-call-end"></i>

                    </div>
                </div>
                <div class="userPage_block">
                    <div class="userPage__info">
                        <span>Name</span>

                    </div>

                    <div class="userPage__info">
                        <span>Position</span>

                    </div>
                    <div class="userPage__info">
                        <span>Work Week</span>

                    </div>
                    <div class="userPage__info">
                        <span>Timezone</span>

                    </div>

                    <div class="userPage__info">
                        <span>Salary</span>

                    </div>

                    <div class="userPage__info">
                        <span>Username</span>

                    </div>

                    <div class="userPage__info">
                        <span>Superior</span>


                    </div>


                    <!--<button v-show="impersonateState"  @click="impersonate()" class="btn blue">Login as this user</button>-->
                </div>

            </div>
            <div class="userPage__table">
                <div v-html="welcome_page.long_message"></div>
                <div class="form-actions">
                    <button @click="back()" class="btn default">Back</button>
                    <router-link :to="{ name: 'introduction-page-edit', params: { id: id }}" class="btn blue">Edit</router-link>
                </div>
            </div>

        </div>
    </div>

</template>
<style>

</style>
<script>
   //import GameIndex from './components/header.vue'

    import BreadcrumbComponent from '../BreadcrumbComponent.vue'


	export default{
	name: 'welcome-page',
		props: [],
		computed: {
			id(){
				return this.$route.params.id;
			},
		},
		data(){
		   return{
				welcome_page:{
					user:{}
				},
		   }
		},
		components:{
			'breadcrumb-component':BreadcrumbComponent
		},
	   	methods: {
	   	    getWelcomePage(){
				var self = this;
				axios.get('welcome-page/' + self.id)
					.then(function(response){
						self.welcome_page = response.data;
					});
			},
			back(){
        		this.$router.go(-1);
        	}
	   	},
	   	mounted: function () {
			this.getWelcomePage();
	   	}
	}


</script>