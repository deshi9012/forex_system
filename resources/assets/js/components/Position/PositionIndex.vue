<template>
    <div>
        <div class="page-bar">
            <breadcrumb-component></breadcrumb-component>

            <div class="page-toolbar">
                <div class="btn-group">
                    <router-link :to="{ name: 'position-create' }" id="sample_editable_1_new" class="btn green">
                        Create

                    </router-link>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                <div class="portlet light">
                    <div class="portlet-body">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" data-order='[[ 0, "desc" ]]' id="table-cat-document">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="odd gradeX" v-for="(item, index) in positions">
                                <td data-th="ID">{{item.id}}</td>
                                <td data-th="Name">{{item.name}}</td>
                                <td data-th="Name">{{item.description}}</td>
                                <td>
                                    <action-component
                                            :index = "index"
                                            :item = "item"
                                            :page = "'position'"
                                            v-on:delete="deletePosition"
                                    ></action-component>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- END EXAMPLE TABLE PORTLET-->
            </div>
        </div>
    </div>
</template>
<style>

</style>
<script>
import ActionComponent from '../ActionComponent.vue'
import BreadcrumbComponent from '../BreadcrumbComponent.vue'

export default{
    props: {},
        computed: {},
        data(){
            return{
                positions: [],
                error: {},
            }
        },
        methods: {
            getPositions() {

                var self = this;

        		axios.get('position').then(function (response) {
					self.positions = response.data;
					//console.log(response);
					self.$nextTick(function () {
						// DOM is now updated
						// `this` is bound to the current instance
						$('#table-cat-document').DataTable({
							"bLengthChange": false,
							 "columnDefs": [ {
                                            "targets": 2,
                                            "orderable": false
                                            } ]
						});
						self.$nextTick(function () {
							$("input").attr("placeholder", "search");
						});
					})
				});
            },
        	deletePosition(id, index) {

            	var self = this;

                swal({
                      title: 'Are you sure?',
                      text: "You won't be able to revert this!",
                      type: 'info',
                      html:"<span class='sub'>You won't be able to revert this!</span> <div class='swal__icon'></div>",
                      showCancelButton: true,
                      confirmButtonColor: 'transparent',
                      cancelButtonColor: '#f44e4e',
                      confirmButtonText: 'Delete',
                    }).then(function () {
                        	axios.delete('/position/'+id)
					            .then(function (response) {
					                self.positions.splice(index, 1);
				                });
                            swal(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                            );
                    })
        	},
        	goTo(url){
        		this.$router.push(url);
        	}
        },
        components:{
            'action-component':ActionComponent,
            'breadcrumb-component':BreadcrumbComponent
        },

        mounted: function(){
            var self = this;

            $(document).ready(function(){
                self.getPositions();
            });
        }
    }
</script>
