<template>
	<div>
		<div id="dzContainer" class="dropzone">
			<i v-if="noFile" @click="passClick()" class="icon-cloud-upload dropzone__icon"></i>
		</div>
	</div>
</template>
<style>

</style>
<script>
    //import GameIndex from './components/header.vue'

    export default{
        props: ['folderPath'],
        computed: {
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
			}
        },
        data(){
            return{
                noFile:true,
                dropzoneObj: false,
            }
        },
        components:{},
        methods: {
        	initDropzone() {
        		var self = this;

        		this.Dropzone.autoDiscover = false;

				if(this.dropzoneObj != false) {
					console.log(this.dropzoneObj);
					this.dropzoneObj.destroy();
				}

        		this.dropzoneObj = new this.Dropzone("#dzContainer", {
					url: "/file",
					headers: {
						'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
					},
					//previewsContainer: false,
					paramName: "content", // The name that will be used to transfer the file
					maxFilesize: 2, // MB
					accept: function(file, done) {
						done();
						self.noFile = false;
						window.dispatchEvent(new Event('uploadComplete'));
					},
					init: function() {
						//console.log('ready');
					},
					sending: function(file, xhr, formData) {
					  // Will send the filesize along with the file as POST data.
					  formData.append("path", self.folderPath);
					  formData.append("storage", self.storage);
					}
				});
        	},
        	passClick(){
        		$('.dropzone').trigger('click');
        	}
        },
        mounted: function () {
        	this.Dropzone = require("dropzone");
			this.initDropzone();
			//console.log('test');
        }
    }
</script>