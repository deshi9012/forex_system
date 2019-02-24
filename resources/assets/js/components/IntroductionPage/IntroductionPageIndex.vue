<template>
	<div id="index-newsfeed">
		<div class="page-bar">
			<breadcrumb-component></breadcrumb-component>

			<div class="page-toolbar">
				<router-link :to="{ name: 'introduction-page-create'}" class="btn default">Create</router-link>
			</div>
		</div>




		<div class="intro-featured" v-if="featured_welcome_pages.length">
			<div class="stream-wrapper-inner featured">
				<div class="intro-featured__post" v-for="(welcome_page,index) in featured_welcome_pages">

					<div class="userPage__img intro-featured__img">
						<img :src="welcome_page.user.avatar" class="img-responsive" alt="">
					</div>

					<div class="content" @click.stop="closeFolderMenu">
						<div class="flex">
							<span class="user-name">{{welcome_page.user.full_name}}</span>

							<span
									class="date"
									v-html="formatDate(welcome_page.created_at)"
							>

							</span>

							<div class="controlls">
								<!--<a data-toggle="tooltip" title="" data-original-title="Pin Post" @click.prevent="changeState(welcome_page.id, index)"><i class="icon-pin icons"></i></a>-->
								<!--<a data-toggle="tooltip" title="" data-original-title="Delete" @click.prevent="deleteMessage(welcome_page.id,index,true)"><i class="icon-trash icons"></i></a>-->


								<div class="user-folders__menu" @click.stop="openFolderMenu($event)">
									<i class="user-folders__hamburger icon-options-vertical"></i>
									<div class="user-folders__actions" v-if="folderMenu">
										<span @click.prevent="changeState(welcome_page.id, index)"><i class="icon-star"></i>Pin</span>
										<span @click.prevent="editMessage(welcome_page.id)"><i class="icon-pencil"></i>Edit</span>
										<span @click.prevent="deleteMessage(welcome_page.id,index,true)"><i class="icon-trash"></i>Delete</span>
									</div>
								</div>
							</div>
						</div>
						<span class="user-possition">{{welcome_page.user.position.description}}</span>

						<p class="short-text">{{ welcome_page.short_message }}</p>

						<transition enter-active-class="animated fadeInUp">
							<div class="long-text" v-if="expand == index" v-html="welcome_page.long_message"></div>
						</transition>

						<button v-if="welcome_page.long_message" class="read-more btn-link" @click="expand = (expand == index ? 9999 : index)">
							<template v-if="expand == index">
								View less
							</template>
							<template v-else>
								View more
							</template>
						</button>

					</div>
				</div>
			</div>
		</div>




		<div class="intro" v-if="welcome_pages.length">
				<div class="stream-wrapper-inner">
					<div class="intro__post" v-for="(welcome_page,index) in welcome_pages">

						<div class="userPage__img intro__img">
							<img :src="welcome_page.user.avatar" class="img-responsive" alt="">
						</div>

						<div class="content">
							<div class="flex">
								<span class="user-name">{{welcome_page.user.full_name}}</span>
								<span
										class="date"
										v-html="formatDate(welcome_page.created_at)"
								>

								</span>
								<div class="controlls">
									<!--<a data-toggle="tooltip" title="" data-original-title="Pin Post" @click.prevent="changeState(welcome_page.id, index)"><i class="icon-pin icons"></i></a>-->
									<!--<a data-toggle="tooltip" title="" data-original-title="Delete" @click.prevent="deleteMessage(welcome_page.id,index,false)"><i class="icon-trash icons"></i></a>-->

									<div class="user-folders__menu" @click.stop="openFolderMenu($event)">
										<i class="user-folders__hamburger icon-options-vertical"></i>
										<div class="user-folders__actions" v-if="folderMenu">
											<span @click.prevent="changeState(welcome_page.id, index)"><i class="icon-star"></i> Pin</span>
											<span @click.prevent="editMessage(welcome_page.id)"><i class="icon-pencil"></i>Edit</span>
											<span @click.prevent="deleteMessage(welcome_page.id,index,false)"><i class="icon-trash"></i> Delete</span>
										</div>
									</div>
								</div>
							</div>
							<span class="user-possition">{{welcome_page.user.position.description}}</span>

							<p class="short-text">{{ welcome_page.short_message }}</p>

							<transition enter-active-class="animated fadeInUp">
							<div class="long-text" v-if="expand == index+1" v-html="welcome_page.long_message"></div>
							</transition>

								<button v-if="welcome_page.long_message" class="read-more btn-link" @click="expand = (expand == index+1 ? 9999 : index+1)">
									<template v-if="expand == index+1">
										View less
									</template>
									<template v-else>
										View more
									</template>
								</button>

						</div>
					</div>
				</div>
		</div>
	</div>
</template>
<style>
</style>
<script>
	//require('../../mixins.js');
	var myMixin = {
		created: function () {
			this.hello()
		},
		methods: {
			hello: function () {
				//console.log('hello from mixin!')
			}
		}
	};
	import moment from "moment";
	import BreadcrumbComponent from '../BreadcrumbComponent.vue'
   export default{

       props: [],
       mixins: [myMixin],
       computed: {},
       data(){
           return{
           		folderMenu:false,
                welcome_pages: [],
                featured_welcome_pages: [],
                auth:{
                    username:window._auth_data.username,
                },
                expand: 9999,
           }
       },
       components:{
		 'breadcrumb-component':BreadcrumbComponent
       },
       methods: {

           getWelcomePages(){
               var self = this;
		       axios.get('welcome-page')
			   .then(function(response){
			       self.welcome_pages = response.data.welcome_pages;
			       self.featured_welcome_pages = response.data.featured_welcome_pages;

			       self.$nextTick(function () {
					$('[data-toggle="tooltip"]').tooltip();
           			});
           			self.getDate();
			   });
           },
           deleteMessage(id,index,is_featured){
           	   	var self = this;
           	   	swal({
                    title: 'Are you sure?',
                      text: "You won't be able to revert this!",
                      type: 'info',
                      html:"<span class='sub'>You won't be able to revert this!</span> <div class='swal__icon'></div>",
                      showCancelButton: true,
                      confirmButtonColor: 'transparent',
                      cancelButtonColor: '#f44e4e',
                      confirmButtonText: 'Delete'
                }).then(function () {

           	   		axios.delete('welcome-page/' + id)
           	    		.then(function(response){
							if(is_featured){
           	    				self.featured_welcome_pages.splice(index, 1);

           	    			}else{
           	    				self.welcome_pages.splice(index, 1);
           	    			}

           	    		});

				});

           },
           editMessage(id){
				this.$router.push(`/introduction-page/${id}/edit`)
           },
           changeState(id, index){
           		var self = this;

				if(typeof self.featured_welcome_pages[index] != "undefined") {
					self.welcome_pages.push(self.featured_welcome_pages[index]);
					self.featured_welcome_pages.splice(index, 1);
				} else {
					self.featured_welcome_pages.push(self.welcome_pages[index]);
					self.welcome_pages.splice(index, 1);
				}

           		axios.patch('welcome-page/' + id + '/change-state').then(function(response){

           		});
           },
			 openFolderMenu(e){
		   		let item = e.currentTarget
		   		if(this.folderMenu){
					if($(item).find(".icon-options-vertical_clicked").length > 0){
						this.closeFolderMenu();
					}else{
						this.closeFolderMenu();
		   				this.openFolderMenu(e);
					}
		   		}else{
					$(item).addClass("user-folders__menu_shown");
					$(item).find(".icon-options-vertical").addClass("icon-options-vertical_clicked");
					this.folderMenu = true;
		   		}

		   },
		   closeFolderMenu(){
		   		$(".user-folders__menu_shown").removeClass("user-folders__menu_shown");
		   		$(".icon-options-vertical").removeClass("icon-options-vertical_clicked");
		   		this.folderMenu = false;
		   },
		   formatDate(date){
		   		let self = this;
				let fullDate = moment(date, 'YYYY-MM-DD hh:mm:ss').format('hh:mm a YYYY-MMM-DD');
				fullDate = fullDate.split(" ");
				return `<span>${fullDate[0]}</span> <span>${fullDate[1]}</span> <span>${fullDate[2]}</span>`;
		   }
       },

       mounted: function () {
       		var self = this;
         	window.componentInstance = this;

            this.getWelcomePages();
       }
   }

//window._.includes(window.user_permissions, 'welcome-page.create')


</script>