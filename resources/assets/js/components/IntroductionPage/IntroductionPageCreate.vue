<template>
    <div id="create-newsfeed">
        <div class="page-bar"  :class="{'page-bar_form':!isScrolled}">
            <breadcrumb-component></breadcrumb-component>

            <div class="page-toolbar">
                <router-link :to="'/'" class="btn default">Back</router-link>
                <button @click.prevent="saveWelcomePage()" class="btn blue">Save</button>
            </div>
        </div>
        <form class="form">
            <div class="form__main">
                <div class="form-group form-md-line-input"  v-bind:class="{'has-error': error.short_message}">
                    <label class=" control-label" for="form_control_1">Short message
                        <span class="required">*</span>
                    </label>
                    <label class="error-label" v-if="error.short_message">
                        {{error.short_message}}
                    </label>

                    <div>
                        <input type="text" class="form-control" id="form_control_1" placeholder="" name="short_message" v-model="welcome_page.short_message" >
                        <div class="form-control-focus"> </div>
                        <span class="help-block">enter welcome page short message</span>
                    </div>
                </div>
				<div class="form-group form-md-checkboxes">
					<div class="md-checkbox-list">
						<div class="md-checkbox">
							<input type="checkbox" name="is_featured" id="checkbox2_2" v-model="welcome_page.is_featured" class="md-check">
							<label for="checkbox2_2">
								<span></span>
								<span class="check"></span>
								<span class="box"></span> Is Featured?
							</label>

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
                <router-link :to="'/'" class="btn default">Back</router-link>
                <button @click.prevent="saveWelcomePage()" class="btn blue">Save</button>
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
       computed: {},
       data(){
           return{
               isScrolled:false,
               welcome_page: {
                   is_featured:false,
               },
               error:{}
           }
       },
       components:{
            'breadcrumb-component':BreadcrumbComponent
       },
       methods: {

           saveWelcomePage(){
        	    var self = this;

        	    self.welcome_page.long_message = $('#edit').froalaEditor('html.get', true);

        	    axios.post('welcome-page', self.welcome_page)
        	    	.then(function (response){
                        self.$router.push({ name: 'introduction-page' });
                    });
        	},
        	 isTop(){
            	let scroll = $(window).scrollTop();
            	if(scroll < 5){
            	    this.isScrolled = false;
            	}else{
            	    this.isScrolled = true;
            	}
            },
            removeError(field){
                if(this.error[field]){
                    this.error[field] = '';
                }
            },
       },
       mounted: function () {
           let self = this;
           window.componentInstance = this;
            $(function() {
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