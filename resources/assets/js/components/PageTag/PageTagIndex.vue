<template>
    <div>
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN EXAMPLE TABLE PORTLET-->
                <div class="portlet light">
                    <div class="portlet-body">
                        <div class="table-toolbar">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="btn-group">
                                        <router-link :to="{ name: 'page-tag-create' }" id="sample_editable_1_new" class="btn green">
                                            Create Page
                                            <i class="fa fa-plus"></i>

                                        </router-link>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="table-tag-page">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th class="table_date">Created At</th>
                                <th class="table_date">Updated At</th>
                                <th class="table_date">Deleted At</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="odd gradeX" v-for="(item, index) in pageTag">
                                <td data-th="ID">{{item.id}}</td>
                                <td data-th="Name">{{item.name}}</td>
                                <td class="table_date" data-th="Created At">{{item.created_at}}</td>
                                <td class="table_date" data-th="Updated At">{{item.updated_at}}</td>
                                <td class="table_date" data-th="Deleted At">{{item.deleted_at}}</td>
                                <td>
                                    <action-component
                                            :index = "index"
                                            :item = "item"
                                            :page = "'tag/page'"
                                            v-on:delete="deletePageTag"
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
export default{
    props: {},
        computed: {},
        data(){
            return{
                pageTag: []
            }
        },
        components:{},
        methods: {
            getPageTags() {
                var self = this;

        		axios.get('/page-tag')
					.then(function (response) {
					self.pageTag = response.data;
					//console.log(response);
					self.$nextTick(function () {
						// DOM is now updated
						// `this` is bound to the current instance
						$('#table-tag-page').DataTable({
							"bLengthChange": false,
							 "columnDefs": [ {
                                            "targets": 5,
                                            "orderable": false
                                            } ]
						});
					})
				})
				.catch(function (error) {
				    //console.log(error);
				});
            },
        	deletePageTag(id, index) {

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
                    axios.delete('/page-tag/'+id)
					    .then(function (response) {
					        self.pageTag.splice(index, 1);
				        })
				        .catch(function (error) {
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
        	goTo(url){
        		this.$router.push(url);
        	}
        },
         components:{
            'action-component':ActionComponent
        },
        mounted: function(){
            this.getPageTags();
        }
    }

</script>

