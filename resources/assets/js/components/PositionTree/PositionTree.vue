<template>
	<div>

		<div class="page-bar">

			<breadcrumb-component></breadcrumb-component>

			<div class="page-toolbar">
			</div>
		</div>

		<div id="chart-container">

		</div>

		<tree-item @closePopup="closePopup" :id=selected_id></tree-item >
	</div>

</template>
<style>

</style>
<script>
   //import GameIndex fro√'./components/header.vue'
import TreeItem from './TreeItem.vue'
import BreadcrumbComponent from '../BreadcrumbComponent.vue'

   export default{
       props: {},
       computed: {},
       data(){
			return{
				isShown:false,
				user:{},
				html: {},
				users:{},
				usersData:[{
					name:'Organisation',
					title: 'Title',
					id:'0',
					children:[{}]
				}],
				selected_id: 1
			}
       },
       components:{
           'tree-item':TreeItem,
           'breadcrumb-component':BreadcrumbComponent
       },
       methods: {
           getPositionTree() {
               var self = this;

               axios.get('tree').then(function(response){
                   self.users = response.data;
        	       //console.log(self.users);
        	       
        	       self.$nextTick(function () {

                       self.getData(self.users, self.usersData);
                       let datasource = {};
                       datasource.title = "";
				       datasource.avatar = 'storage/avatars/user-icon.svg';
                       datasource.name = "FXGlOBE";
                       datasource.children = self.usersData;
					   $('#chart-container').orgchart({
                           'data':datasource,
                           'parentNodeSymbol':'',
                           'nodeContent': 'title',
                           'nodeId': 'id',
                           'verticalDepth': 4, // From the 3th level of orgchart, nodes will be aligned vertically.
  						   'depth': 4,
						   'createNode': function($node, data) {
							   //console.log(data);
						       var secondMenu = '<div class="second-menu"><img class="avatar" src="'+data.avatar+'"></div>';
							   $node.append(secondMenu);

						   }
                       });

                       //$('.orgchart').addClass('noncollapsable'); // deactivate

                       self.$nextTick(function () {
                           $('.orgchart').on('click', function(){
                           		self.closePopup();
                           });
                           self.getNodeId();
					   });
                   });
               });
           },
           getData(data, userData){
                var self = this;
                for(var i = 0; i < data.length; i++){
                    let name = data[i].first_name + " " + data[i].last_name;
                    let title = data[i].position.name;

                    let id = data[i].id;
					let avatar = data[i].avatar;
                    let children = [];
                    if(data[i].subordinate){
                        this.getData(data[i].subordinate, children);
                    }
                    userData[i] = {'name':name, 'title':title,'avatar':avatar, 'children':children, 'id':id};
                }
             //this is fishy
              self.usersData.children = userData;
            },
           getNodeId(){
               self = this;
               $('.node .title, .node .content, .second-menu').on('click',function(e){

               		$(this).parent().addClass("node__opened");
               		//console.log($(this));

                   let id = $(this).parent().attr('id');
					e.stopPropagation();
                   if(self.isShown){
						self.closePopup();
                   }else{
                   		 //if click on root node(Company) to not redirect
						   if(id != undefined){
							   self.$forceUpdate();
						   }
						   self.selected_id = id;
						   if(self.selected_id){
								 var $userPopup = $('.userPopup');
								 if($(this).parents('li').length == 0) {
									$userPopup.addClass('exist').appendTo($(this).closest('.node'));
									setTimeout(function(){
										  $userPopup.addClass('shown');
									 }, 100);

								 } else {
									$userPopup.addClass('exist').appendTo($(this).closest('.node'));
									setTimeout(function(){
										 $userPopup.addClass('shown');
									 }, 100);
								 }
								 self.isShown = true;
						   }
                   }
               });
           },
			closePopup(){
				$(".node__opened").removeClass("node__opened");

				this.isShown = false;
				self.$forceUpdate();
                var $userPopup = $('.userPopup');
				setTimeout(function(){
					$userPopup.removeClass('exist');
				},200);
                $userPopup.removeClass('shown');

			}
       },
       mounted: function () {
           this.getPositionTree();
       }
   }

</script>