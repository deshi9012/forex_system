<template>
   <div>
	   <div class="page-bar" :class="{'page-bar_form':!isScrolled}">
		   <breadcrumb-component></breadcrumb-component>

		   <div class="page-toolbar">
				   <button @click="back()" class="btn default">Back</button>
				   <button @click="downloadPdf(id)" class="btn default">Save pdf</button>

				   <router-link :to="{ name: 'document-edit', params: { documentId: document.id }}" class="btn green">Edit</router-link>
		   </div>
	   </div>


	   <form class="form">
		   <div class="form__main">
			   <div class="form__triple">
				   <div class="form-group form-md-line-input">
					   <label class=" control-label">Name
					   </label>
					   <div class="form__inputLike">
						   <label class=" control-label">{{document.name}}</label>
					   </div>
				   </div>
				   <div class="form-group form-md-line-input">
					   <label class=" control-label">category
					   </label>


					   <ul class="form__inputLike">
						   <li v-for="category in document.categories">
							   {{ category.name }}
							   <span>,</span>
						   </li>
					   </ul>
				   </div>
				   <div class="form-group form-md-line-input">
					   <label class="  control-label">Description
					   </label>
					   <div class="form__inputLike">
						   <label class="control-label">{{document.description}}</label>
					   </div>
				   </div>
			   </div>
		   </div>
		   <div class="form__doc">
			   <div v-html="document.content"></div>
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
               document: {
               		name: '',
               		description: '',
               		content: ''
               }
           }
       },
       components:{
			'breadcrumb-component':BreadcrumbComponent
       },
       methods: {
       		getDocument(){
        	    var self = this;

        		axios.get('/document/'+self.id)
        			.then(function (response) {

						self.document = response.data;

						self.$nextTick(function () {
							$('select').select2();
						});
				    });

        	},
        	downloadPdf(id){

        	console.log(id);
        		var self = this;
				location.href = 'document-pdf/'+id;


        	},
        	back(){
        		this.$router.go(-1);
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
       let self = this;
       		this.getDocument();
       		 $(document).on('scroll', function(){
                self.isTop();
            });
       }
   }
</script>