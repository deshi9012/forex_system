
<template>
    <div>
        <div class="page-bar"  :class="{'page-bar_form':!isScrolled}">
            <breadcrumb-component></breadcrumb-component>
            <div class="page-toolbar">
                <router-link :to="'/position'" class="btn default">Back</router-link>
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
                        <input type="text" class="form-control" id="form_control_1" placeholder="" name="name" v-model="position.name" @focus="removeError('name')">
                        <div class="form-control-focus"> </div>
                        <span class="help-block">edit position name</span>
                    </div>
                </div>

                <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.description}">
                    <label class=" control-label" for="form_control_1">Description
                        <span class="required">*</span>
                    </label>
                    <label class="error-label" v-if="error.description">
                        {{error.description}}
                    </label>
                    <div>
                        <input type="text" class="form-control" id="form_control_2" placeholder="" name="description" v-model="position.description" @focus="removeError('description')">
                        <div class="form-control-focus"> </div>
                        <span class="help-block">edit position description</span>
                    </div>
                </div>
            </div>


            <div class="form-actions">
                <router-link :to="'/position'" class="btn default">Back</router-link>
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
                position: {},
                error: {},
            }
        },
        components:{
            'breadcrumb-component':BreadcrumbComponent
       },
        methods: {
        	getPosition(){
        		var self = this;
				axios.get('position/' + self.id+'/edit').then(function(response){
						self.position = response.data;
					});
        	},
        	save(){
        	var self = this;
        		axios.put('position/'+self.id, self.position).then(function(success){
						self.$router.push({ name: 'position-index' })
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

			this.getPosition();
			 $(document).on('scroll', function(){
                self.isTop();
            });
        }
    }
</script>
