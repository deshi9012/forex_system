<template>
    <div>
		<div class="page-bar">
			<breadcrumb-component></breadcrumb-component>

			<router-link :to="{ name: 'page-create' }" id="sample_editable_1_new" class="btn green">
						Create
			</router-link>


		</div>

		<div class="row">
			<div class="col-md-12">
				<!-- BEGIN EXAMPLE TABLE PORTLET-->
				<div class="portlet light">
					<div class="portlet-body">
						<table class="table table-striped table-bordered table-hover table-checkable order-column" data-order='[[ 0, "desc" ]]'s id="table-page">
							<thead>
							<tr>
								<th>#</th>
								<th>Name</th>
								<th>Description</th>
								<th class="table_date">Created At</th>
								<th>Actions</th>
							</tr>
							</thead>
							<tbody>
							<tr class="odd gradeX" v-for="(item, index) in pages">
								<td data-th="Title">{{item.id}}</td>
								<td data-th="First Name">{{item.name}}</td>
								<td data-th="Title" class="light">{{item.description}}</td>
								<td class="table_date" data-th="Title"><span>{{item.date}}</span><span>{{ item.hour }}</span></td>
								<td>
									<action-component
											:index = "index"
											:item = "item"
											:page = "'page'"
											v-on:delete="deletePage"
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
    //import GameIndex from './components/header.vue'
	import ActionComponent from '../ActionComponent.vue'
	import BreadcrumbComponent from '../BreadcrumbComponent.vue'


	export default{
        props: {},
        computed: {},
        data(){
            return{
                msg: 'hello vue',
                pages: [],
            }
        },
        methods: {
        	getPages() {
        		var self = this;

				axios.get('page')
					.then(function(response){
						self.pages = response.data;
						self.$nextTick(function () {
							$('#table-page').DataTable({
								"bLengthChange": false,
								 "columnDefs": [ {
                                            "targets": 4,
                                            "orderable": false
                                            } ]
							});

						});
						 self.$nextTick(function () {
                              $("input").attr("placeholder", "search");
						});
					});
        	},
        	deletePage(id, index) {

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

						self.axios.delete('/page/'+id).then(function (response) {
							//console.log(response);
							self.pages.splice(index, 1);
							swal(
								'Deleted!',
								'Your file has been deleted.',
								'success'
							)
						});
					});
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
         	window.componentInstance = this;

			$(document).ready(function(){
				self.getPages();
			});
        }
    }
</script>
