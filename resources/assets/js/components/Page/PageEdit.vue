<template>
    <div>
		<div class="page-bar"  :class="{'page-bar_form':!isScrolled}">
			<breadcrumb-component></breadcrumb-component>

			<div class="page-toolbar">
				<router-link :to="'/page'" class="btn default">Back</router-link>
				<button @click.prevent="savePage()" class="btn blue">Save</button>
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
							{{error.name[0]}}
						</label>
						<div>
							<input type="text" class="form-control" id="form_control_1" placeholder="" name="name" v-model="page.name" @focus="removeError('name')">
							<div class="form-control-focus"> </div>
							<span class="help-block">enter page name</span>
						</div>
					</div>

					<div class="form-group form-md-line-input" v-bind:class="{'has-error': false}">
						<label class="  control-label" for="categories">Category
							<span class="required">*</span>
						</label>
						<label class="error-label" v-if="false">
							{{error.category}}
						</label>
						<div>
							<div>
								<select id="categories" v-model="selected_categories" multiple="multiple">
									<option v-for="category in categories" :value="category.id">
										{{ category.name }}
									</option>
								</select>
							</div>
						</div>
					</div>

					<div class="form-group form-md-line-input" v-bind:class="{'has-error': error.description}">
						<label class=" control-label" for="form_control_2">Description
							<span class="required">*</span>
						</label>
						<label class="error-label" v-if="error.description">
							{{error.description[0]}}
						</label>
						<div>
							<input type="text" class="form-control" id="form_control_2" placeholder="" name="name" v-model="page.description" @focus="removeError('description')">
							<div class="form-control-focus"> </div>
							<span class="help-block">enter page description</span>
						</div>
					</div>
				</div>
			</div>

			<div class="form-actions">
				<router-link :to="'/page'" class="btn default">Back</router-link>
				<button @click.prevent="savePage()" class="btn blue">Save</button>
			</div>
		</form>
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
        	}
        },
        data(){
            return{
           		 isScrolled:false,
                page: {},
                error: {},
				categories:[''],
				selected_categories:[''],
            }
        },
		components:{
			'breadcrumb-component':BreadcrumbComponent
       },
        methods: {
        	getPage(){
        		var self = this;
				axios.get('page/' + self.id+'/edit')
					.then(function(response){
						self.page = response.data;
					});
        	},
        	   getCategories(){
                	var self = this;
                    axios.get('/page-category')
                        .then(function(response){
                            self.categories = response.data;

                             self.$nextTick(function () {
								setTimeout(function(){
									$('#categories').select2();
								}, 100);
							});
					});
            },
        	savePage(){
        	var self = this;
        		axios.put('page/'+self.id, self.page).then(function(response){
						self.$router.push({ name: 'page-index' })

        			});
        	},
        	removeError(field){
				this.error[field] = '';
			},
			 isTop(){
            	let scroll = $(window).scrollTop();
            	if(scroll < 5){
            	    this.isScrolled = false;
            	}else{
            	    this.isScrolled = true;
            	}
            },
        },

        mounted: function () {
        	var self = this;
         	window.componentInstance = this;

			this.getPage();
			this.getCategories();
 			$(document).on('scroll', function(){
                self.isTop();
            });
        }
    }
</script>
