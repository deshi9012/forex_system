<template>
	<div>

		<div class="page-bar"  :class="{'page-bar_form':!isScrolled}">
			<breadcrumb-component></breadcrumb-component>
			<div class="page-toolbar">
				<router-link :to="'/role'" class="btn default">Back</router-link>
				<button type="button" class="btn blue" @click="saveRole()">Save</button>
			</div>
		</div>
		<form class="form">
			<div class="form__main">
				<div class="form__triple">
					<div class="form-group form-md-line-input" v-bind:class="{'has-error': error.name}">
						<label class=" control-label" for="form_control_1">Name
							<span class="required">*</span>
						</label>
						<label class="error-label" v-if="error.name">
							{{error.name}}
						</label>
						<div>
							<input type="text" class="form-control" id="form_control_1" placeholder="" name="name" v-model="role.name" @focus="removeError('name')">
							<div class="form-control-focus"></div>
							<span class="help-block">role name</span>
						</div>
					</div>
					<div class="form-group form-md-line-input" v-bind:class="{'has-error': error.display_name}">
						<label class=" control-label" for="form_control_3">Display name
							<span class="required">*</span>
						</label>
						<label class="error-label" v-if="error.display_name">
							{{error.display_name}}
						</label>
						<div>
							<input type="text" class="form-control" id="form_control_3" placeholder="" name="name" v-model="role.display_name" @focus="removeError('display_name')">
							<div class="form-control-focus"></div>
							<span class="help-block">role display name</span>
						</div>
					</div>
					<div class="form-group form-md-line-input" v-bind:class="{'has-error': error.description}">
						<label class=" control-label" for="form_control_5">Description
							<span class="required">*</span>
						</label>
						<label class="error-label" v-if="error.description">
							{{error.description}}
						</label>
						<div>
							<input type="text" class="form-control" id="form_control_5" placeholder="" name="description" v-model="role.description" @focus="removeError('desscription')">
							<div class="form-control-focus"> </div>
							<span class="help-block">description</span>
						</div>
					</div>
				</div>

			</div>
			<div class="form__sec form__sec_transp">

				<div class="form__col form__col_small form__col_back" v-bind:class="{'has-error': error.selected_permissions}">
						<label class="error-label" v-if="error.selected_permissions">
							Please choose permission/s !
						</label>
					<!--<button @click.prevent="bulkAll()" class="btn permissions-list__btn">All Permisssions</button>-->
					<!--<button @click.prevent="bulkShow()" class="btn permissions-list__btn">Show Permissions</button>-->

					<i class="icon-pin permissions-list__btn" data-toggle="tooltip" title="Select all!"  @click.prevent="bulkAll()"></i>
					<i class="icon-eye permissions-list__btn" data-toggle="tooltip" title="Select only show and index!" @click.prevent="bulkShow()" ></i>
					<h3 class="form__heading">Categories</h3>
					<ul class="categories-list">
						<div>
							<li
									class="categories-list__item"
									v-for="category in categories"
									@click="choseCategory(category)"
									:class="{'categories-list__item_active': categoryChosen == category, 'categories-list__item_chosen': checkChosenCategory(category)}"

							>{{category}}</li>
						</div>
					</ul>
				</div>
				<div class="form__col form__col_large form__col_back">
					<h3 class="form__heading">{{categoryChosen}}</h3>
					<hr/>
					<!--<button v-show="categoryChosen != 'Content-bank'" @click.prevent="bulkAllForCategory(categoryChosen)" class="btn permissions-list__btn permissions-list__btn_cat">All</button>-->
					<!--<button v-show="categoryChosen != 'Content-bank'" @click.prevent="bulkShowForCategory(categoryChosen)" class="btn permissions-list__btn permissions-list__btn_cat">Show</button>-->
					<i class="icon-pin permissions-list__btn permissions-list__btn_cat" data-toggle="tooltip" title="Select all for this category!"  v-show="categoryChosen != 'Content-bank'" @click.prevent="bulkAllForCategory(categoryChosen)"></i>
					<i
							class="icon-eye permissions-list__btn permissions-list__btn_cat"
							data-toggle="tooltip" title="Select only show and index for this category!"
							v-show="categoryChosen != 'Content-bank' && show"
							@click.prevent="bulkShowForCategory(categoryChosen)"
					></i>
					<div class="permissions-list">
						<div
							 v-for="permission in permissions"
							 v-if="categoryChosen === 'Content-bank' && permission.name === 'elfinder.connector'"
							 class="permissions-list__permission"
							 v-text="elFinderList()"
							 @click="switchChosenElFinder()"
							 :class="{'permissions-list__permission_chosen':checkChosen(elFinderPerms), 'permissions-list__permission_chosen':checkChosen(permission.id)}"
						>
						</div>

						<div
								v-for="permission in permissions"
								v-if="showPermission(permission.display_name) && isFileEdit(permission)"
								v-text="showPermissionList(permission.display_name)"
								@click="switchChosen(permission,$event)"
								class="permissions-list__permission"
								:class="{'permissions-list__permission_chosen':checkChosen(permission.id)}"
						>
						</div>
						<div
								v-for="permission in permissions"
								v-if="categoryChosen == 'file' && permission.name === 'file.destroy'"
								class="permissions-list__permission"
								@click="switchChosenFileEdit()"
								:class="{'permissions-list__permission_chosen':checkChosen(fileEditPerms), 'permissions-list__permission_chosen':checkChosen(permission.id)} "
						>
							Edit
						</div>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<router-link :to="'/role'" class="btn default">Back</router-link>
				<button type="button" class="btn blue" @click="saveRole()">Save</button>
			</div>
		</form>

		<!--<div class="portlet light">-->
			<!--<div class="portlet-body">-->
				<!--&lt;!&ndash; BEGIN FORM&ndash;&gt;-->

				<!--<div class="form-body">-->
					<!--<div class="row">-->
						<!--<div class="col-sm-6 permissions-list">-->
							<!--<div class="form-group form-md-line-input">-->
								<!--<label class=" control-label" for="permissions">Permision-->
									<!--<span class="required">*</span>-->
								<!--</label>-->
								<!--<label class=" control-label" for="form_control_5">-->
									<!--<span class="required"></span>-->
								<!--</label>-->
								<!--<label class="error-label" v-if="error.description">-->
									<!--{{error.description}}-->
								<!--</label>-->
								<!--<div class="col-md-10">-->
									<!--<select id="permissions" v-model="selected_permissions" multiple="multiple">-->
										<!--<option v-for="permission in permissions" :value="permission.id">{{ permission.name }}</option>-->
									<!--</select>-->
								<!--</div>-->
							<!--</div>-->
						<!--</div>-->
					<!--</div>-->

					<!--<div class="form-actions">-->

					<!--</div>-->
				<!--</div>-->


				<!--&lt;!&ndash; END FORM&ndash;&gt;-->
			<!--</div>-->
		<!--</div>-->
	</div>
</template>

<style>

</style>
<script>
	//import GameIndex from './components/header.vue'

import BreadcrumbComponent from '../BreadcrumbComponent.vue'
	export default{
		props: {},
		computed: {
			id(){
				return this.$route.params.id;
			},
			fileEditPerms: function(){
                let arr = this.permissions;
                let permGrp = [];
                arr.forEach(function(permission){
                    let name = permission.display_name.split('.');
                    if(name[0] == 'file' && name[1] != 'user_docs' && name[1] != 'preview' && name[1] != 'work_manuals'){
                       permGrp.push(permission);
                    }
                });
                return permGrp;
            },
		},
		data(){
			return{
				show:false,
				isScrolled:false,
				role: {
					permissions: [],
					selected_permissions: [],
				},
				error: {},
				permissions: [],
				categories:[],
				categoryChosen:'',
				elFinderPerms:[]
			}
		},
		components:{},
		methods: {
		elFinderList(){
               return 'permissions';
           },
		  setCategories(categoryName){
               var self = this;
               var category = categoryName.split(".",1);

				if(category[0] == 'elfinder'){
                   category[0] = 'Content-bank';
               }
               //Check if this common permission name already exists
               if(!self.categories.includes(category[0])){
                   self.categories.push(category[0]);

               }
           },
			getEditData(){
				var self = this;

				axios.get('role/' + self.id + '/edit').then(function(response){

					self.permissions = response.data.permissions;
					//

					self.permissions.forEach(function(permission,index){

                       var name = permission.display_name.split('.',1);
                       if(name == 'elfinder'){
	                       //contacts[contacts.length] = add1;
							//console.log(permission);
                           self.elFinderPerms.push(permission);
                       }
                    });
					//
					var rolesArray = [];

					response.data.role.permissions.forEach(function(role){
						rolesArray.push(parseInt(role.id));
					});

					  let loginIndex = self.permissions.findIndex(x => x.name == "login");
                   		self.permissions.splice(loginIndex,1);

					   let logoutIndex = self.permissions.findIndex(x => x.name == "logout");
					   self.permissions.splice(logoutIndex,1);

					   let registerIndex = self.permissions.findIndex(x => x.name == "register");
					   self.permissions.splice(registerIndex,1);

                   response.data.permissions.forEach(function(permission){
                       if(!(permission.name == 'login' || permission.name == 'logout' || permission.name == 'register')){
                           self.setCategories(permission.display_name);
                       }
                   });


					self.role = response.data.role;
					self.role.selected_permissions = rolesArray;

					self.$nextTick(function () {
						self.choseCategory(self.categories[0]);
						$('#permissions').select2();
					});

				});
			},
			saveRole(){
				var self = this;
				//this.role.selected_permissions = $('#permissions').val();
				//self.role.categories = $('#categories').val();
				axios.put('role/'+self.id, self.role).then(function(response){
					self.$router.push({ name: 'role-index' })
				});
			},
			removeError(field){
				this.error[field] = '';
			},
			 choseCategory(category){
                this.categoryChosen = category;
				let self = this;
				 setTimeout(function(){
                	self.haveToShow();
                }, 50);
                this.$forceUpdate();
           },
            showPermissionList(permission){

                let name = permission.split('.');

                if(name[1]){
                    return name[1]
                }else{
                    return name[0]
                }
            },
            showPermission(permission){
                let name = permission.split('.');
                if(name[0] == this.categoryChosen){
                    return true;
                }else{
                    return false;
                }
            },
			 switchChosen(permission){
                let id = permission.id;
                let additional_ids = permission.additional_rights;
                let arr = this.role.selected_permissions;
                let addArr = this.additionals;
                if(additional_ids){
                    this.switchAdd(permission);
                }
                if(arr.includes(id)){
                    let element = arr.indexOf(id);
                    arr.splice(element,1);
                }else{
                    arr.push(id);
                }
                this.$forceUpdate();
            },
            switchAdd(rights){
               let id = rights.id;
               let adds = rights.additional_rights;
               let arr = this.role.selected_permissions;
               let self = this;
               adds.forEach(function(add){
                    if(!arr.includes(add) && !arr.includes(id)){
                        self.role.selected_permissions.push(add);
                    }else if(arr.includes(add) && arr.includes(id)){
                        let element = arr.indexOf(add);
                        arr.splice(element,1);
                    }
               });

            },
            checkChosen(chosen_id){
                let arr = this.role.selected_permissions;
                if( arr.includes(chosen_id) ){
                    return true;
                }else{
                    return false;
                }
            },
             bulkAll(){
               var self = this;
               let arrAll = this.permissions;
               let unique;
               let numOfElements = arrAll.length;
               arrAll.forEach(function(permission){
                    let name = permission.display_name.split('.');
                    unique = true;
                     if(self.role.selected_permissions.includes(permission.id)){
                         unique = false;
                         numOfElements --;
                         //check if the current element is unique and if its not decreases the number of elements to add.
                     }
                    if(unique){
                        //if the role is unique is added to the role.selected_permissions array
                       self.role.selected_permissions.push(permission.id);
                    }
                });
                if(numOfElements === 0){
                    // if all roles are added and the number of elements to add is 0 remove all.
                    arrAll.forEach(function(permission){
                        let name = permission.display_name.split('.');
                        let element = self.role.selected_permissions.indexOf(permission.id);
                        self.role.selected_permissions.splice(element, 1);
                    });
                }
                this.$forceUpdate();
           },
		   bulkShow(){
               var self = this;
               let arrAll = this.permissions;
               let unique;
               let numOfElements = 0;
               arrAll.forEach(function(permission){
                    let name = permission.display_name.split('.');
                    unique = true;
                     if(name[1] == 'index' || name[1] == 'show'){
                       numOfElements ++;
                       //get how many permissions this category have
                    }
                     if(self.role.selected_permissions.includes(permission.id) && (name[1] == 'index' || name[1] == 'show')){
                         unique = false;
                         numOfElements --;
                         //check if the current element is unique and if its not decreases the number of elements to add.
                     }
                    if((name[1] == 'index' || name[1] == 'show') && unique){
                        //if the role is unique is added to the role.selected_permissions array
                       self.role.selected_permissions.push(permission.id);
                    }
                });
                if(numOfElements === 0){
                    // if all roles are added and the number of elements to add is 0 remove all.
                    arrAll.forEach(function(permission){
                        let name = permission.display_name.split('.');

                        if((name[1] == 'index' || name[1] == 'show')){
                            let element = self.role.selected_permissions.indexOf(permission.id);
                           self.role.selected_permissions.splice(element, 1);
                        }
                    });
                }
                this.$forceUpdate();
           },
		  bulkAllForCategory(category){
               var self = this;
               let arrAll = this.permissions;
               let unique;
               let numOfElements = 0;
               arrAll.forEach(function(permission){
                    let name = permission.display_name.split('.');
                    unique = true;

                    if(name[0] == category){
                       numOfElements ++;
                       //get how many permissions this category have
                    }
                     if(self.role.selected_permissions.includes(permission.id) && name[0] == category){
                         unique = false;
                         numOfElements --;
                         //check if the current element is unique and if its not decreases the number of elements to add.
                     }

                    if(name[0] == category && unique){
                        //if the role belong to the current category and is unique is added to the role.selected_permissions array
                       self.role.selected_permissions.push(permission.id);
                    }
                });
                if(numOfElements === 0){
                    // if all roles are added and the number of elements to add is 0 remove all.
                    arrAll.forEach(function(permission){
                        let name = permission.display_name.split('.');

                        if(name[0] == category){
                            let element = self.role.selected_permissions.indexOf(permission.id);
                           self.role.selected_permissions.splice(element, 1);
                        }
                    });
                }
                this.$forceUpdate();
           },
           bulkShowForCategory(category){
               var self = this;
               let arrAll = this.permissions;
               let unique;
               let numOfElements = 0;
               arrAll.forEach(function(permission){
                    let name = permission.display_name.split('.');
                    unique = true;

                    if(name[0] == category && (name[1] == 'index' || name[1] == 'show')){
                       numOfElements ++;
                       //get how many permissions this category have
                    }
                     if(self.role.selected_permissions.includes(permission.id) && name[0] == category && (name[1] == 'index' || name[1] == 'show')){
                         unique = false;
                         numOfElements --;
                         //check if the current element is unique and if its not decreases the number of elements to add.
                     }

                    if(name[0] == category && unique && (name[1] == 'index' || name[1] == 'show')){
                        //if the role belong to the current category and is unique is added to the role.selected_permissions array
                       self.role.selected_permissions.push(permission.id);
                    }
                });
                if(numOfElements === 0){
                    // if all roles are added and the number of elements to add is 0 remove all.
                    arrAll.forEach(function(permission){
                        let name = permission.display_name.split('.');

                        if(name[0] == category && (name[1] == 'index' || name[1] == 'show')){
                            let element = self.role.selected_permissions.indexOf(permission.id);
                           self.role.selected_permissions.splice(element, 1);
                        }
                    });
                }
                this.$forceUpdate();
           },
            isTop(){
            	let scroll = $(window).scrollTop();
            },
            isFileEdit(permission){
                let name = permission.display_name.split('.');
                if(name[0] == 'file' && name[1] != 'user_docs' && name[1] != 'work_manuals' && name[1] != 'preview'){
                   return false;
                }
                return true;
            },
           switchChosenElFinder(){
               var self = this;
               this.elFinderPerms.forEach(function(permission){
                    let index = self.elFinderPerms.indexOf(permission);
                    if(index === 0){
                        self.switchChosen(permission);
                    }
               });
           },
           switchChosenFileEdit(){
               var self = this;
               this.fileEditPerms.forEach(function(permission){
                    let index = self.fileEditPerms.indexOf(permission);
                    if(index === 0){
                        self.switchChosen(permission);
                    }
               });
           },
           haveToShow(){
           		let self = this;
				this.show = false;
           		let arr = document.querySelectorAll('.permissions-list__permission');
           		arr.forEach(function(perm){
           			let text = perm.innerHTML;
           			if(text === 'index' || text === 'show'){
           				self.show = true;
           			}
           		})
           },
           checkChosenCategory(category){
           //checks if any of the chosen permissions belong to the current category
             let self = this;
             let arrChosen = this.role.selected_permissions;
             let arrAll = this.permissions;
             let chosenCats = [];

             arrChosen.forEach(function(cat){
                arrAll.forEach(function(perm){
                    if(cat === perm.id){
                        let displayName = perm.display_name;
                        let names = displayName.split(".");
                        let name = names[0];
                        if(name === "elfinder"){
                            name = "Content-bank";
                        }
                        if(!chosenCats.includes(name)){
                            chosenCats.push(name);
                        }
                    }
                });
             });
             if(chosenCats.includes(category)){
                return true;
             }
             return false;
           }
		},
		components:{
			'breadcrumb-component':BreadcrumbComponent
		},
		mounted: function () {

			var self = this;
			window.componentInstance = this;

			$(document).ready(function(){
				self.getEditData();
				$('[data-toggle="tooltip"]').tooltip();
			});
 			$('.categories-list').mCustomScrollbar({
                 theme:"inset"
            });
 			$(document).on('scroll', function(){
                self.isTop();
            });
		}
	}
</script>