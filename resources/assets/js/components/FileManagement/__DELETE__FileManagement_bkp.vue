<template>
	<div>
		<div class="row">
			<div class="col-md-12">

				<!-- BEGIN EXAMPLE TABLE PORTLET-->
				<div class="portlet light">
					<div class="portlet-body">
						<Uploader></Uploader>
						<div class="table-toolbar">
							<div class="row">
								<div class="col-md-6">

								</div>
							</div>
						</div>

						<div class="form-body">
							<div class="form-actions files__actions">
								<button @click="goBack()" class="btn default">Back</button>
							</div>
						</div>
						<table class="files table table-striped table-bordered table-hover table-checkable order-column" id="table">
							<thead>
							<tr>
								<th>Name</th>
								<th>Type</th>
								<th>Actions</th>
							</tr>
							</thead>
							<tbody>
								<tr v-for="(folder, index) in structure.directories">
									<td data-th="Name" @click="goToFolder(folder.name)" class="files__folder">
											<span class="files__icon">
												<i class="icon-folder-alt"></i>
											</span>
											<span class="file__text">
												{{folder.name}}
											</span>
									</td>
									<td data-th="Type" class="files__type">folder</td>
									<td class="file__actions">
											<!--<span @click="deleteFile(file)" class="files__icon files__icon_button">-->
												<!--<i class="icon-close"></i>-->
											<!--</span>-->
									</td>
								</tr>
								<tr v-for="(file, index) in structure.files">
									<td data-th="Name">
										<span class="files__icon">
											<i class="icon-docs"></i>
										</span>
										<span class="file__text">
											{{file.name}}
										</span>
									</td>
									<td data-th="Type" class="files__type">{{file.extension}}</td>
									<td class="files__actions">
										<a :href="'/download?file=' + file.path" target="_blank">
											<span class="files__icon files__icon_button" data-toggle="tooltip" title="Download file">
												<i  class="icon-cloud-download"></i>
											</span>
										</a>
										<span @click="deleteFile(file,index)" class="files__icon files__icon_button" data-toggle="tooltip" title="Delete file">
											<i class="icon-close" ></i>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="form-body">
							<div class="form-actions files__actions">
								<button @click="goBack()" class="btn default">Back</button>
							</div>
						</div>
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
import Uploader from './Upload.vue'

   export default{

	   props: [],
	   computed: {
			previousDir(){
				var str = this.$route.path;

				if (str.charAt(str.length - 1) == '/') {
					 str = str.substr(0, str.length - 1);
				}

				var res = str.substr(0, str.lastIndexOf("/"));

				if(res == "") {
					res = '/';
				}

				return res;
			}
	   },
	   data(){
		   return{
			   structure:{},
		   }
	   },
		components:{
			Uploader
		},
	   methods: {
		   getRootStructure(){
				var self = this;
				var directory = self.$route.path.split("/file").pop();

			   axios.get('/file?folder=' + directory).then(function(response){
				   self.structure = response.data;

				   self.$nextTick(function () {

							if ( ! $.fn.DataTable.isDataTable( '#table' ) ) {
								$('#table').DataTable({
									"bLengthChange": false,
									"bFilter": false,
									"bInfo": false,
									"bPaginate": false,
									 "columnDefs": [ {
                                            "targets": 2,
                                            "orderable": false
                                            } ]
								});
							}
							$('[data-toggle="tooltip"]').tooltip()
						});
			   }).catch(function(error){
				   if(error.response){
					   //console.log(error.response);
				   }
			   });
		   },
		   goToFolder(folderName){
			   var self = this;

			   this.$router.push(self.$route.path + '/' + folderName, function(){
				self.getRootStructure();
			   });
		   },
		   deleteFile(file,index){
		   	var self = this;
			swal({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then(function () {
                	axios.delete('/file/0/?file=' + file.path).then(function(response){
		   				//console.log(response);
		   				self.structure.files.splice(index, 1);
		   			});
                });

		   },
		   goBack(){
				var self = this;
				this.$router.push(this.previousDir, function(){
					self.getRootStructure();
				});
		   }


	   },
	   mounted: function(){
		   	this.getRootStructure();
			var self = this;
			window.onpopstate = function(event) {
				//self.getRootStructure();

			};
	   }
   }
</script>