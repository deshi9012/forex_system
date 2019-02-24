<template>
    <div>

        <div class="page-bar" :class="{'page-bar_form':!isScrolled}">
            <breadcrumb-component></breadcrumb-component>

            <div class="page-toolbar">
                <router-link :to="'/category/page'" class="btn default">Back</router-link>
                <button @click.prevent="savePage()" class="btn blue">Save</button>
            </div>
        </div>
        <form class="form">
            <div class="form__main">
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
                        <span class="help-block">enter page category name</span>
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <router-link :to="'/category/page'" class="btn default">Back</router-link>
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
        },
        data(){
            return{
                isScrolled:false,
                page: {},
                error:{}
            }
        },
        components:{},
        methods: {
        	savePage(){
        		var self = this;

				axios.post('/page-category', this.page).then(function (response) {
						self.$router.push({ name: 'page-category-index' })
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
        	/*
        	handleError(error) {
        		var self = this;

				$.each(error, function(index, value) {
					self.$set(self.error, index, value[0]);
				});
        	}
        	*/
        },
        components:{
            			'breadcrumb-component':BreadcrumbComponent
       },
        mounted: function () {
        var self = this;
        window.componentInstance = this;

        	$(document).on('scroll', function(){
                self.isTop();
            });
        }
    }
</script>

