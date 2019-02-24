<template>
	<div>
		<div class="user-folders__breadcrumb" >
			<span v-for="breadcrumb in localBreadcrumb" @click="goToBcFolder(breadcrumb.path)">{{breadcrumb.name}}</span>
		</div>
		<div class="folder-tabs" v-if="baseFolders.directories">
				<div
						v-for="(folder, index) in baseFolders.directories"
						@click="goToFolder(folder.name), makeCurrent($event)"
						class="folder-tabs__tab"
				>
					{{folder.name}}
				</div>
		</div>

		<div class="user-folders__wrapper">
			<div :class="(structure.directories.length == 0) ? 'user-folders__search_small user-folders__search_have' : 'user-folders__search'">
				<input v-model="search" type="search" class="form-control input-sm search" placeholder="search" aria-controls="table">
			</div>

			<div class="user-folders__holder">
				<div class="user-folders" v-if="structure.directories.length > 0 " @click.stop="closeFolderMenu">
					<div
							v-for="(folder, index) in structure.directories"
							data-th="Name"
							@click="goToFolder(folder.path)"
							class="user-folders__folder "
					>
						{{folder.name}}

						<div class="user-folders__menu" @click.stop="openFolderMenu($event)">
							<i class="user-folders__hamburger icon-menu"></i>
							<div class="user-folders__actions" v-if="folderMenu">
								<span @click.stop="renameDir(folder)">Rename<i class="icon-pencil"></i></span>
								<span @click.stop="deleteDir(folder)">Delete<i class="icon-trash"></i></span>
							</div>
						</div>
					</div>
					<div class="user-folders__folder user-folders__folder_add" @click="createDir()">Create New Folder <span >+</span></div>
				</div>
				<div class="user-folders" v-if="structure.directories.length === 0">
					<div class="user-folders__folder user-folders__folder_add" @click="createDir()">Create New Folder <span>+</span></div>
				</div>
			</div>

			<sortable-table :files="structure.files" :storage="storage" :search="search"></sortable-table>
		</div>

		<div class="user-folders__uploader">
			<Uploader :folder-path="uploadFolder"></Uploader>
		</div>

	</div>
</template>
<style>


.nav-tabs, .nav-pills {
	margin-bottom: 0px;
	border-bottom: none;
}
</style>
<script>
import Uploader from './Upload.vue'
import SortableTable from './SortableTable.vue'

	export default{

		props: [],
		computed: {
			id() {
				return this.$route.params.id;
			},
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
			},
			uploadFolder() {
				return this.$route.params.id + '/' + this.currentFolder;
			},
			storage() {
				//Determines the root dir based on entry URL
				var path = this.$route.path;
				var storage = false;

				var matches = path.match(/\/file\/(\w*)/)||[];

				if(!_.isUndefined(matches) && matches.length > 0) {
					storage = matches[1];
				} else {
					storage = 'users';
				}

				return storage;
			},
			localBreadcrumb(){
				let breadcrumb = [];
				let names;
				let path;
				if(this.currentFolder.length > 1){
						names = this.currentFolder.split('/');
						for(let i = 0; i < names.length; i++){
							breadcrumb.push({name:names[i]});
						}
						for(let i = 0; i < names.length; i++){
							path = "/"
							for(let j = 0; j < i+1; j++){
								path = path +"/"+names[j];
								breadcrumb[j].path = path;
							}
						}
				return breadcrumb;
				}
			},
		},
		data(){
		   return{
		   		folderMenu:false,
			    structure: {
					directories: [],
					files: []
			   },
			   oldFolder: '/',
			   currentFolder: '/',
			   baseFolders: {
			   		directories: []
			   },
			   activeTab: '',
			   breadcrumbs: [
			   		{name: 'HOME', path: '/'}
			   ],
			   search: ''
		   }
		},
		watch: {
			currentFolder: function (folder, oldFolder) {
			this.oldFolder = oldFolder;

			//Only for user folder we have to remove /users/ID

			folder = folder.replace(/\/*?\users\/\d*\/*/ig, "");

//			console.log('-------');
//			console.log(folder);

			this.currentFolder = folder;

			this.getRootStructure();
			//this.getBreadCrumbs();
			},
			$route: function() {
				console.log('change data');
				this.init();
			}
		},
		components:{
			Uploader,
			'sortable-table': SortableTable
		},
			methods: {
			getInitialDirs() {
				var self = this;

				//file.index
	   			axios.get('/user/'+ this.id +'/docs/?folder=/&storage=' + this.storage).then(function(response){
					self.$set(self.baseFolders, 'directories', response.data.directories);

					//self.$nextTick(function () {
						if(response.data.directories[0]){
							self.goToFolder(response.data.directories[0].name);
						}
					//});
				});
				self.openTab();
	   		},
			getRootStructure(){

				var self = this;
				var directory = this.currentFolder;

				axios.get('/user/'+ this.id +'/docs/?folder=' + directory + '&storage=' + this.storage).then(function(response){
					console.log(response.data.files);


					_.forEach(response.data.files, function(value, key) {
						response.data.files[key].path = response.data.files[key].path.replace(/\/*?\users\/*/ig, "");
					});

					console.log(response.data.files);

					self.$set(self.structure, 'files', response.data.files);
					self.$set(self.structure, 'directories', response.data.directories);
					self.$set(self.structure, 'currentPath', response.data.currentPath);
				})

			},
			createDir(){
				var self = this;
				swal({
				  title: 'Create folder',
				  text: "You won't be able to revert this!",
				  input: 'text',
				  cancelButtonText: "Cancel",
					confirmButtonText: "Create",
					confirmButtonColor: '#7ab8e8',
				  html:"<span></span> <div class='swal__icon swal__icon_create'></div>",
				  showCancelButton: true,

				}).then(function (result) {

					axios.post('/file/createDir',{
								storage: self.storage,
								currentFolder: self.id + '/' + self.currentFolder,
								newFolderName: result
							}).then(function(response){
								//console.log(response);
								/*
								swal({
									type: 'success',
									html: 'You entered: ' + result
								  });
							  	*/
								  self.getRootStructure();
							}).catch(function(error){
								//console.log(error.response.data.error.message);
								swal(
								   'Oops...',
								   error.response.data.error.message,
								   'error'
								);
							});
				})
					$(".swal__icon").parents().eq(1).addClass("swal__dialog");
					$(".swal__icon_create").parents().eq(1).addClass("swal__dialog_create");
					$(".swal2-input").attr('placeholder', "Enter Folder Name");
			},
			deleteDir(folder){
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

					var path = folder.path.replace('users/','');
					axios.delete('/folder/0/?folder=' + path + '&storage='+ self.storage)
								.then(function(response){
									//console.log(response);
									self.getRootStructure();
								});
				});
			},
			renameDir(folder){

				var self = this;

				var oldName =  folder.path.substr(folder.path.indexOf("/") + 1);

				var buffer = folder.path.substring(0,folder.path.lastIndexOf("/") + 1); // Contains 24 //

				var corePath = buffer.substr(buffer.indexOf("/") + 1);


				swal({
					/*
					title: 'Input something',
				  	input: 'text',
				  	showCancelButton: true,
				  	*/
					title: 'Rename folder',
					text: "You won't be able to revert this!",
					input: 'text',
					cancelButtonText: "Cancel",
					confirmButtonText: "Rename",
					confirmButtonColor: '#7ab8e8',
					html:"<span></span> <div class='swal__icon swal__icon_create'></div>",
					showCancelButton: true,
				  	inputValidator: function (value) {
					return new Promise(function (resolve, reject) {
					  if (value) {
						resolve();
					  } else {
						reject('You need to write something!');
					  }
					})
				  }

				}).then(function (result) {

					var data = {
							storage: self.storage,
							oldName: oldName,
							corePath: corePath,
							newName: result
					};

					axios.post('/file/renameDir',data).then(function(response){
						console.log(response.data);
						self.getRootStructure();
					}).catch(function(error){
								//console.log(error.response.data.error.message);
								swal(
								   'Oops...',
								   error.response.data.error.message,
								   'error'
								);
							});
				});
					$(".swal__icon").parents().eq(1).addClass("swal__dialog");
					$(".swal__icon_create").parents().eq(1).addClass("swal__dialog_create");
					$(".swal2-input").attr('placeholder', "Rename Folder Name");
			},
			getBreadCrumbs(){
				var self = this;
				var directory = this.currentFolder;

				var breadcrumbs = [];
				breadcrumbs = directory.split('/');

				var result = [];
				result[0] = {};
				result[0]['name'] = 'HOME';
				result[0]['path'] = '/';
				_.forEach(breadcrumbs, function(value, key) {

					if(value == "") {
						return;
					}

					var path = '';
					for (var i = 0; i <= key; i++) {
						path += breadcrumbs[i] + "/";
					}
					result[key+1] = {};
					result[key+1]['name'] = value;
					result[key+1]['path'] = path;
				});

				this.breadcrumbs = result;
			},
		   goToFolder(folderName){
			   var self = this;
				//console.log(folderName);
				this.currentFolder = folderName;
				self.getRootStructure();
//				this.$forceUpdate();

			   //this.$router.push(self.$route.path + '/' + folderName, function(){
				//	self.getRootStructure();
			   //});
		   },
		   goToBcFolder(path){
		   		path = "users/" + this.id + path
		   		this.currentFolder = path;
		   },
		   goBack(){
				var self = this;
				var pathArr = this.currentFolder.split('/');
				pathArr.pop();
				this.currentFolder = pathArr.join("/");
		   },
		   openFolderMenu(e){
		   		let item = e.currentTarget
		   		if(this.folderMenu){
					if($(item).find(".icon-menu_clicked").length > 0){
						this.closeFolderMenu();
					}else{
						this.closeFolderMenu();
		   				this.openFolderMenu(e);
					}
		   		}else{
					$(item).addClass("user-folders__menu_shown");
					$(item).find(".icon-menu").addClass("icon-menu_clicked");
					this.folderMenu = true;
		   		}

		   },
		   closeFolderMenu(){
		   		$(".user-folders__menu_shown").removeClass("user-folders__menu_shown");
		   		$(".icon-menu").removeClass("icon-menu_clicked");
		   		this.folderMenu = false;
		   },
		   makeCurrent(e){
		   		$(".folder-tabs__tab").removeClass("folder-tabs__tab_active");
		   		let item = e.currentTarget
		   		$(item).addClass("folder-tabs__tab_active");

		   },
		   openTab(){
		   		setTimeout(function(){
					$('.folder-tabs__tab:first-of-type').addClass("folder-tabs__tab_active");
				}, 1001)
		   },
		   addNoDataMessage(){
		   		/* Datatables do not support colspan! http://olxn.datatables.net/forums/discussion/36934/uncaught-typeerror-cannot-set-property-dt-cellindex-of-undefined */
		   		return;
		   		if($('tbody td').length === 0){
		   			$('tbody').append('<tr class="odd"><td valign="top" colspan="3" class="dataTables_empty">No matching records found</td></tr>');
		   		}
		   },
		   formatFilePath(path){
		   		return path.substring('users/'.length);
		   },
		   putIcon(file){
				if(file === "doc" || file === "docx" || file === "pdf" || file === "xlsx"){
					return "icon-doc";
				}

				if(file === "png" || file === "jpg" || file === "jpeg" || file === "gif"){
					return "icon-picture";
				}

				return "icon-docs";
		   },
		   init() {
		   		this.openTab();
				this.getInitialDirs();
		   }
		},
		mounted: function(){
			var self = this;

			this.init();

			//window.onpopstate = function(event) {
			//	self.getRootStructure();
			//};
			// Listen for the event.
			window.addEventListener('uploadComplete', function(e){
				//This timeout is set in order to deal with potential server lag.
				setTimeout(function(){
					self.getRootStructure();
				}, 1000)
			}, false);
	   }
   }
</script>