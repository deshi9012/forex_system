<template>
    <div>
        <div class="page-bar">
            <breadcrumb-component></breadcrumb-component>
        <div class="page-toolbar">
            <div class="btn-group">
                <router-link :to="{ name: 'user-create' }" id="sample_editable_1_new" class="btn green">
                    Create User
                </router-link>
            </div>
        </div>
    </div>


        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet light">
            <div class="portlet-body">
                <table class="table table-large table-striped table-bordered table-hover table-checkable order-column" data-order='[[ 0, "desc" ]]' id="table-user">
                    <thead>
                    <tr>
                        <th><span>ID</span></th>
                        <th>Name</th>
                        <th>Superior</th>
                        <th>Information</th>
                        <th>Salary</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr class="odd gradeX clickable" v-for="(item, index) in users" @click.prevent="goTo('/user/' + item.id)">
                            <td data-th="ID">{{item.id}}</td>
                            <td data-th="Name">{{item.title}} {{item.first_name}} {{item.last_name}}</td>
                            <td data-th="Superior"><template v-if="item.superior">{{item.superior.first_name }} {{ item.superior.last_name }}</template></td>
                            <td data-th="Information"><span>{{item.phone_office}}</span><span>{{item.email}}</span></td>
                            <td data-th="Salary">{{item.salary}}</td>
                            <td data-th="Role"> <div v-for="role in item.roles">{{ role.name }}</div></td>
                            <td>
                                <action-component
                                    :index = "index"
                                    :item = "item"
                                    :page = "'user'"
                                    v-on:delete="deleteUser"
                                ></action-component>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->

        <div id="position-tree">

        </div>
    </div>
</template>
<style>

</style>
<script>
   //import GameIndex from './components/header.vue'
    import ActionComponent from '../ActionComponent.vue'
    import BreadcrumbComponent from '../BreadcrumbComponent.vue'


   export default{
       props: {},
       computed: {},
       data(){
           return{
                users:[],
           }
       },

       methods: {
            getUsers() {
        		var self = this;

        		axios.get('/user').then(function (response) {

                    self.users = response.data;

                    self.$nextTick(function () {
                        $('#table-user').DataTable({
                            "bLengthChange": false,
                             "columnDefs": [ {
                                            "targets": [1,3,6],
                                            "orderable": false
                                            } ]
                        });
                        self.$nextTick(function () {
							$("input").attr("placeholder", "search");
						});
                    })
				});
        	},
            deleteUser(id, index) {

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
                    axios.delete('/user/'+id).then(function (response) {
                        //console.log(response);
                        self.users.splice(index, 1);
                        swal(
                           'Deleted!',
                           'Your file has been deleted.',
                           'success'
                        );
                    });
                })


        	},
        	goTo(url){
        		this.$router.push(url);
        	},

        },
       components:{
           'action-component':ActionComponent,
           'breadcrumb-component':BreadcrumbComponent
       },
       mounted: function () {
            var self = this;
           $(document).ready(function(){
               self.getUsers();
           });

           /*
           this.getPositionTree();
           */
       }
   }


</script>