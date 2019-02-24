<template>
    <div>
		<table class="files table table-striped table-bordered table-hover table-checkable order-column" id="table" v-if="columns">
			<thead>
			<tr>
				<th @click="sortBy('name')" :class="[(sortKey == 'name') ? 'active' : '', reverse ? 'asc' : 'desc', 'sort']">Name</th>
				<th @click="sortBy('type')" :class="[(sortKey == 'type') ? 'active' : '', reverse ? 'asc' : 'desc', 'sort']">Type</th>
				<th>Actions</th>
			</tr>
			</thead>
			<tbody>
			<!--v-if="file.name"-->
			<tr v-for="(file, index) in fileList">
				<td data-th="Name">
					{{file.name}}
				</td>
				<td data-th="Type" class="files__type">
					<span class="file__text">
						<i :class="putIcon(file.extension)"></i> {{file.extension}}
					</span>
				</td>
				<td class="files__actions">
					<a :href="'/file/get?disk='+ storage +'&file=' + file.path" target="_blank">
						<span class="files__icon files__icon_button" data-toggle="tooltip"
							  title="View File">
							<i class="icon-magnifier"></i>
						</span>
					</a>
					<a :href="'/download?disk='+ storage +'&file=' + file.path" target="_blank">
						<span class="files__icon files__icon_button" data-toggle="tooltip"
							  title="Download file">
							<i class="icon-cloud-download"></i>
						</span>
					</a>
					<a href="#" @click.prevent="deleteFile(file, index)">
						<span class="files__icon files__icon_button"
							  data-toggle="tooltip" title="Delete file">
							<i class="icon-trash"></i>
						</span>
					</a>
				</td>
			</tr>
			<tr v-if="fileList.length == 0" class="odd"><td valign="top" colspan="3" class="dataTables_empty">No matching records found</td></tr>
			</tbody>
		</table>
    </div>
</template>
<style>
    
</style>
<script>
    //import GameIndex from './components/header.vue'

    export default{
        props: ['files', 'storage', 'search'],
        computed: {
        	fileList: function() {
        		var self = this;

				var filesArray = this.files;
				var filesArray2 = [];

				if(this.search.length > 1) {
					//filesArray = this.findBy(filesArray, this.search, 'name')
					//filesArray
					var pattern = "(.+)?"+ self.search.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&") +"(.+)?"
					var patt = new RegExp(pattern, 'gi');

					filesArray = _.filter(filesArray, function(o) {
						return o['name'].match(patt);
					});

					/*filesArray = filesArray.find(function (file) {
						return file.name === self.search;
					});*/
				}

				var direction = (this.reverse) ? 'asc' : 'desc';

				filesArray.sort(function(a, b) {
				  var nameA = a[self.sortKey].toUpperCase(); // ignore upper and lowercase
				  var nameB = b[self.sortKey].toUpperCase(); // ignore upper and lowercase
				  if (nameA < nameB) {
					return -1;
				  }
				  if (nameA > nameB) {
					return 1;
				  }

				  // names must be equal
				  return 0;
				});

				if(direction == 'desc') {
					filesArray.reverse();
				}

				return filesArray;
				//return _.orderBy(filesArray, this.sortKey, direction);
				//return _.orderBy(filesArray, [this.sortKey], direction);
        	},
        },
        data(){
            return{
            	sortKey: 'name',
				reverse: false,
				columns: ['name', 'extension']
            }
        },
        components:{},
        methods: {
        	sortBy: function(sortKey) {
			  this.reverse = (this.sortKey == sortKey) ? ! this.reverse : false;
			  this.sortKey = sortKey;
			},
			findBy: function (list, value, column) {
			  return list.filter(function (item) {
			  	//return item[column].search(new RegExp('/' + value + '/i'));
				return item[column].includes(value);
			  })
			},
			deleteFile(file, index){
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

					axios.delete('/file/0/?file=' + file.path + '&storage='+ self.storage).then(function(response){
						//console.log('Will delete - ' + self.fileList[index].name);

						var localIndex = _.findIndex(self.files, ['path', self.fileList[index].path]);
						//console.log(localIndex);
						self.files.splice(localIndex, 1);
					});
				});
			},
		   	putIcon(file){
				if(file === "doc" || file === "docx" || file === "pdf" || file === "xlsx"){
					return "icon-doc";
				}

				if(file === "png" || file === "jpg" || file === "jpeg" || file === "gif"){
					return "icon-picture";
				}

				return "icon-docs";
		   	}
        },
        mounted: function () {}
    }
</script>
