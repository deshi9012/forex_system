<template>
    <div>
        <div class="page-bar" :class="{'page-bar_form':!isScrolled}">
            <breadcrumb-component></breadcrumb-component>

            <div class="page-toolbar">
				<button @click="back()"  class="btn default">Back</button>
                <button @click="goToView()"  class="btn default">Go to view</button>
                <button @click.prevent="saveDocument()" class="btn blue">Save</button>
            </div>
        </div>
        <form class="form">
            <div class="form__main">

                <div class="form__triple">
                    <div class="form-group form-md-line-input"  v-bind:class="{'has-error': error.name}">
                        <label class=" control-label" for="form_control_1">Name
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

                    <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.category}">
                        <label class="  control-label" for="categories">Category
                        </label>
                        <label class="error-label" v-if="false">
                            {{error.category}}
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
                        <label class=" control-label" for="form_control_2">Description
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
                    <div id="edit"></div>
                </section>
            </div>

            <div class="form-actions">
                <button @click="back()"  class="btn default">Back</button>
                <button @click="goToView()"  class="btn default">Go to view</button>
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
       	    id(){
				return this.$route.params.id;
        	}
        },
       data(){
           return{
               isScrolled:false,
               document:{},
               error:{},
               categories: [],
               selected_categories: [],
           }
       },
        components:{
              'breadcrumb-component':BreadcrumbComponent
        },
       methods: {
        	getDocument(){
        	    var self = this;

        		axios.get('/document/'+self.id+'/edit')
        			.then(function (response) {

						self.document = response.data.document;
						self.categories = response.data.categories;

						var categoriesArray = [];

						self.document.categories.forEach(function(category){
							categoriesArray.push(parseInt(category.id));
						});

						self.selected_categories = categoriesArray;

						self.$nextTick(function () {
							$('#edit').froalaEditor('html.set', self.document.content, true);
							$('#categories').select2();
						});
				    });

        	},
        	saveDocument(){
        	    var self = this;

				self.document.categories = $('#categories').val();
        	    self.document.content = $('#edit').froalaEditor('html.get', true);

        	    axios.put('document/'+self.id, self.document)
        	    	.then(function (response){
                        self.$router.push({ name: 'document-index' });
                    });
        	},
        	goToView(){
                this.$router.push('/document/' + this.id);
        	},
        	back(){
        		this.$router.go(-1);
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

       		$(function(){
				$('#edit').froalaEditor({
					toolbarButtons: ['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', '|', 'specialCharacters', 'color', 'emoticons', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', '-', 'quote', 'insertHR', 'insertLink', 'insertImage', 'insertVideo', 'insertFile', 'insertTable', '|', 'undo', 'redo', 'clearFormatting', 'selectAll', 'html', 'applyFormat', 'removeFormat', 'fullscreen', 'print', 'help'],
      				pluginsEnabled: null
				})
			});
			this.getDocument();
			 $(document).on('scroll', function(){
                self.isTop();
            });
       }
   }
</script>