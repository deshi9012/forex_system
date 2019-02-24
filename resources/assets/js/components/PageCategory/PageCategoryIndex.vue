<template>
    <div>
        <div class="page-bar">
            <breadcrumb-component></breadcrumb-component>

            <div class="page-toolbar">
                <div class="btn-group">
                    <router-link :to="{ name: 'page-category-create' }" id="sample_editable_1_new" class="btn green">
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" data-order='[[ 0, "desc" ]]' id="table-cat-page">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="odd gradeX" v-for="(item, index) in pageCategory">
                                <td data-th="ID">{{item.id}}</td>
                                <td data-th="Name">{{item.name}}</td>
                                <td>
                                    <action-component
                                            :index = "index"
                                            :item = "item"
                                            :page = "'category/page'"
                                            v-on:delete="deleteDocument"
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
                pageCategory: []
            }
        },
        methods: {
            getDocuments() {
                var self = this;


        		axios.get('/page-category')
					.then(function (response) {
					    self.pageCategory = response.data;
					    //console.log(response);
					    self.$nextTick(function () {
						// DOM is now updated
						// `this` is bound to the current instance
						$('#table-cat-page').DataTable({
							"bLengthChange": false,
							 "columnDefs": [ {
                                            "targets": 2,
                                            "orderable": false
                                            } ]
						});
					})
					self.$nextTick(function () {
							$("input").attr("placeholder", "search");
						});
				});
            },
        	deleteDocument(id, index) {

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
                        axios.delete('/page-category/'+id)
					        .then(function (response) {
					           self.pageCategory.splice(index, 1);
				            });
                          swal(
                            'Deleted!',
                             'Your file has been deleted.',
                            'success'
                          );
                    });

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
         	window.componentInstance = this;

            $(document).ready(function(){
                self.getDocuments();
            })

        }
    }

</script>
