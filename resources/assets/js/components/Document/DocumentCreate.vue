<template>
    <div>
        <div class="page-bar"  :class="{'page-bar_form':!isScrolled}">
            <breadcrumb-component></breadcrumb-component>

            <div class="page-toolbar">
                <router-link :to="'/document'" class="btn default">Back</router-link>
                <button @click.prevent="saveDocument()" class="btn blue">Save</button>
            </div>
        </div>
        <form class="form">
            <div class="form__main">
                <div class="form__triple">
                    <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.name}">
                        <label class="  control-label" for="form_control_1">Name
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.name">
                            {{error.name}}
                        </label>
                        <div>
                            <input type="text" class="form-control" id="form_control_1" placeholder="" name="name" v-model="document.name" @focus="removeError('name')">
                            <div class="form-control-focus"> </div>
                            <span class="help-block">enter document name</span>
                        </div>
                    </div>

                    <div class="form-group form-md-line-input" v-bind:class="{'has-error': false}">
                        <label class="  control-label" for="categories">Category

                        </label>
                        <div>
                            <div>
                                <select id="categories" v-model="selected_categories" multiple="multiple">
                                    <option v-for="category in categories" :value="category.id">{{ category.name }}</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group form-md-line-input"  v-bind:class="{'has-error': error.description}">
                        <label class="  control-label" for="form_control_2">Description
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.description">
                            {{error.description}}
                        </label>
                        <div>
                            <input type="text" class="form-control" id="form_control_2" placeholder="" name="name" v-model="document.description" @focus="removeError('description')">
                            <div class="form-control-focus"> </div>
                            <span class="help-block">enter document description</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form__sec">
                <section id="editor">
                    <div id="edit">

                    </div>
                </section>
            </div>

            <div class="form-actions">
                <router-link :to="'/document'" class="btn default">Back</router-link>
                <button @click.prevent="saveDocument()" class="btn blue">Save</button>
            </div>
        </form>
    </div>
</template>
<style>
   
</style>
<script>
	import BreadcrumbComponent from '../BreadcrumbComponent.vue'

    export default{
        props: {},
        computed: {
        },
        data(){
            return{
                isScrolled:false,
                msg: 'hello vue',
                document: {},
                error:{},
                categories:[''],
                selected_categories:[''],
            }
        },
         components:{
            'breadcrumb-component':BreadcrumbComponent
        },
        methods: {
            getCategories(){
                	var self = this;
                    axios.get('/document-category')
                        .then(function(response){
                            self.categories = response.data;

                               self.$nextTick(function () {
                                    setTimeout(function(){
                                        $('#categories').select2();
                                    }, 100);
                                });
					});


            },
        	saveDocument(){
        		var self = this;

                self.document.content = $('#edit').froalaEditor('html.get', true);
                self.document.categories = $('#categories').val();

				axios.post('/document', this.document)
				.then(function (response) {
					self.$router.push({ name: 'document-index' })
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

            this.getCategories();
            $(function(){
			    $('#edit').froalaEditor({
				    theme: 'dark',
				    toolbarButtons: [
				        'fontFamily', 'fontSize', '|',
				        'specialCharacters', 'color', 'emoticons',
				        'inlineStyle', 'paragraphStyle', '|',
				        'paragraphFormat', 'align', 'formatOL',
				        'formatUL', 'outdent', 'indent',
				        '-', 'quote', 'insertHR',
				        'insertLink', 'insertImage', 'insertVideo',
				        'insertFile', 'insertTable', '|',
				        'undo', 'redo', 'clearFormatting',
				        'selectAll', 'html', 'applyFormat',
				        'removeFormat', 'fullscreen', 'print', 'help'
				    ],

			    })
			});
			 $(document).on('scroll', function(){
                self.isTop();
            });
        }
    }
</script>
