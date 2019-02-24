<template>
    <div>
        <div class="page-bar">
            <breadcrumb-component></breadcrumb-component>

            <div class="page-toolbar">
                <div class="btn-group">
                    <router-link :to="{ name: 'role-create' }" id="sample_editable_1_new" class="btn green">
                        Create
                    </router-link>
                </div>
            </div>
        </div>
        <!-- BEGIN EXAMPLE TABLE PORTLET-->


        <div class="role-list">
            <div class="role-list__role" v-for="(item, index) in roles">
                   <div class="role-list__heading">
                       <h3>{{item.name}}</h3>
                       <action-component
                               :index = "index"
                               :item = "item"
                               :page = "'role'"
                               v-on:delete="deleteRole"
                       ></action-component>
                   </div>
                <p class="role-list__description">
                    {{item.description}}
                </p>
            </div>
            <router-link :to="{ name: 'role-create' }" tag="div" class="role-list__role role-list__role_add">
                <i class="icon-close"></i>
                <span>Create role</span>
            </router-link>
        </div>

        <!--<div class="portlet light">-->
            <!--<div class="portlet-body">-->
                <!--<table id="table-role" class="table table-large table-striped table-bordered table-hover table-checkable order-column">-->
                    <!--<thead>-->
                    <!--<tr>-->
                        <!--<th>Name</th>-->
                        <!--<th>Display name</th>-->
                        <!--<th>Description</th>-->
                        <!--<th>Actions</th>-->
                    <!--</tr>-->
                    <!--</thead>-->
                    <!--<tbody>-->
                    <!--<tr class="odd gradeX" v-for="(item, index) in roles">-->
                        <!--<td data-th="Name">{{item.name}}</td>-->
                        <!--<td data-th="Display name">{{item.display_name}}</td>-->
                        <!--<td data-th="Description">{{item.description}}</td>-->
                        <!--<td>-->
                            <!--<action-component-->
                                    <!--:index = "index"-->
                                    <!--:item = "item"-->
                                    <!--:page = "'role'"-->
                                    <!--v-on:delete="deleteRole"-->
                            <!--&gt;</action-component>-->
                        <!--</td>-->
                    <!--</tr>-->
                    <!--</tbody>-->
                <!--</table>-->
            <!--</div>-->
        <!--</div>-->
        <!-- END EXAMPLE TABLE PORTLET-->
    </div>
</template>

<script>
   //import GameIndex from './components/header.vue'
   import ActionComponent from '../ActionComponent.vue'
    import BreadcrumbComponent from '../BreadcrumbComponent.vue'

   export default{
       name:'RoleIndex',
       props: {},
       components: {
           'action-component':ActionComponent,
           'breadcrumb-component':BreadcrumbComponent
       },
       data(){
           return{
               roles:{}
           }
       },
       methods: {
           getRoles(){

               var self = this;

               axios.get('/role').then(function(response){

                   self.roles = response.data;

                   self.$nextTick(function () {
				       $('#table-role').DataTable({
				           "bLengthChange": false,
				            "columnDefs": [ {
                                            "targets": 3,
                                            "orderable": false
                                            } ]
				       });
				   });
				   self.$nextTick(function () {
                        $("input").attr("placeholder", "search");
                    });
               });
           },
           deleteRole(id, index) {
            	var self = this;

            	swal({
                        title: 'Are you sure?',
                      text: "You won't be able to revert this!",
                      type: 'info',
                      html:"<span class='sub'>You won't be able to revert this!</span> <div class='swal__icon'></div>",
                      showCancelButton: true,
                      confirmButtonColor: 'transparent',
                      cancelButtonColor: '#f44e4e',
                      confirmButtonText: 'Delete'
                    }).then(function () {
                         axios.delete('/role/'+id)
                            .then(function(){
                                self.roles.splice(index, 1);
                            }).catch(function(error){
                               if(error.response) {
								    self.error = error.response.data;
							    }
                            });
                         swal(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                         );
                    })
        	},
       },
       mounted: function () {
           var self = this;

           $(document).ready(function(){
                self.getRoles();
           });
       }
   }
</script>