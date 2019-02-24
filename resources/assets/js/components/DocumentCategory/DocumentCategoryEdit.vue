
<template>
    <div>
        <div class="page-bar"  :class="{'page-bar_form':!isScrolled}">
            <breadcrumb-component></breadcrumb-component>
            <div class="page-toolbar">
                <router-link :to="'/category/document'" class="btn default">Back</router-link>
                <button @click.prevent="save()" class="btn blue">Save</button>
            </div>
        </div>

        <form class="form">
            <div class="form__main">
                <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.name}">
                    <label class=" control-label" for="form_control_1">Name
                        <span class="required">*</span>
                    </label>
                    <label class="error-label" v-if="error.name">
                        {{error.name}}
                    </label>
                    <div>
                        <input type="text" class="form-control" id="form_control_1" placeholder="" name="name" v-model="document.name" @focus="removeError('name')">
                        <div class="form-control-focus"> </div>
                        <span class="help-block">enter document category name</span>
                    </div>
                </div>
            </div>


            <div class="form-actions">
                <router-link :to="'/category/document'" class="btn default">Back</router-link>
                <button @click.prevent="save()" class="btn blue">Save</button>
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
                msg: 'hello vue',
                document: {},
                error: {},
            }
        },
        components:{
            'breadcrumb-component':BreadcrumbComponent
       },
        methods: {
        	getDocument(){
        		var self = this;
				axios.get('document-category/' + self.id+'/edit').then(function(response){
						self.document = response.data;
					});
        	},
        	save(){
        	var self = this;
        		axios.put('document-category/'+self.id, self.document).then(function(success){
						self.$router.push({ name: 'document-category-index' })
						//console.log(response.data);
        			});
        	},
        	removeError(field){
                if(this.error[field]){
                    this.error[field] = '';
                }
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

			this.getDocument();
			 $(document).on('scroll', function(){
                self.isTop();
            });
        }
    }
</script>
