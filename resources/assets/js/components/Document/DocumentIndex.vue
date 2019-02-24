<template>
    <div>
        <div class="page-bar">
            <breadcrumb-component></breadcrumb-component>

            <div class="page-toolbar">
                <div class="btn-group">
                    <router-link :to="{ name: 'document-create' }" id="sample_editable_1_new" class="btn green create-btn" >
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
                        <table class="table table-striped table-bordered table-hover table-checkable order-column" data-order='[[ 0, "desc" ]]' id="table-document">
                            <thead>
                                <tr>
                                    <th><span>#</span></th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th class="table_date">Created At</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <tr class="odd gradeX clickable" v-for="(item, index) in documents" @click.prevent="goTo('/document/' + item.id)">
                                <td data-th="ID">{{item.id}}</td>
                                <td data-th="Name">{{item.name}}</td>
                                <td data-th="Description" class="light">{{item.description}}</td>
                                <td class="table_date" data-th="created_at"><span>{{item.date}}</span> <span>{{ item.hour }}</span></td>
                                <td>
                                    <action-component
                                            :index = "index"
                                            :item = "item"
                                            :page = "'document'"
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
                documents: []
            }
        },
        methods: {
            getDocuments() {
                var self = this;

				axios.get('/document')
					.then(function (response){
						self.documents = response.data;
						self.$nextTick(function () {
							$('#table-document').DataTable({
							    "bLengthChange": false,
							    "columnDefs": [ {
                                            "targets": 4,
                                            "orderable": false
                                            } ]
							});
                        self.$nextTick(function () {
                              $("input").attr("placeholder", "search");
						});
						})
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
                      confirmButtonText: 'Delete',
                    }).then(function () {
                         axios.delete('/document/'+id)
                            .then(function(){
                                self.documents.splice(index, 1);
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
                self.getDocuments();
            });

        }
    }

</script>