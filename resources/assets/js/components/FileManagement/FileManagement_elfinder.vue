<template>
    <div>
		<div class="wrapper">
			<div id="elfinder"></div>
		</div>
    </div>
</template>
<style>

</style>
<script>
    //import GameIndex from './components/header.vue'

    export default{
        props: ['disk'],
        computed: {

        },
        data(){
            return{
                msg: 'hello vue'
            }
        },
        components:{},
        methods: {
        	initElfinder() {
        		var self = this;

					elFinder.prototype.i18.en.messages['cmdcustom'] = 'Get public link';
        			elFinder.prototype.commands.custom = function() {
        					var self = this;
							var fm  = this.fm;
							this.exec = function(hashes) {
									//console.log(hashes);
									//console.log(this);

									var files   = this.files(hashes);
									if (! files.length) {
										files   = this.files([ this.fm.cwd().hash ]);
									}
									//console.log(fm.url(files[0].hash));

									var data = {
										'links': files,
										'storage': self.disk
									};

									data.links.forEach(function(file,index){
										file.fullUrl = fm.url(file.hash)
									});

									console.log(data);

									axios.post('/file/public/generate', data).then(function(response){

										var html = '';

										var clipboard = new window.clipboard('.btn');


										_.forEach(response.data, function(value, key) {

											html += '<b>' + value.name + '</b> <br>';
											html += '<small class="public-url" id="id_'+key+'" >' + value.url + '</small><i data-toggle="tooltip" id="tip_'+key+'" title="Copied!" data-clipboard-target="#id_'+key+'" class="btn fa fa-copy"></i><br> <br>';
										});

										clipboard.on('success', function(e) {


											//e.trigger.$('[data-toggle="tooltip"]').tooltip();


											//$('[data-toggle="tooltip"]').tooltip('open');

											//e.clearSelection();
										});

										swal({
										  title: 'Public link',
										  html: html,
										  type: 'success',
										  showCancelButton: false,
										  confirmButtonColor: '#3085d6',
										  cancelButtonColor: '#d33',
										  confirmButtonText: 'Close'
										});



									});
							}
							this.getstate = function() {
									//return 0 to enable, -1 to disable icon access
									return 0;
							}
					}
					//console.log('---');
					//console.log(self.disk);
					window.elfinder = $('#elfinder').elfinder({
						// set your elFinder options here
						customData: {
							//We are sending this in the URL for now
							//'disks': [self.disk]
						},
						customHeaders : {
							 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
						},

						url : '/file/connector?disks='+self.disk,  // connector URL
						urlUpload: '/file/connector?disks='+self.disk,
						cssAutoLoad: false,
						height: 600,
						commands : [
							'custom','open', 'reload', 'home', 'up', 'back', 'forward', 'getfile', 'quicklook',
							'download', 'rm', 'duplicate', 'rename', 'mkdir', 'mkfile', 'upload', 'copy',
							'cut', 'paste', 'edit', 'extract', 'archive', 'search', 'info', 'view', 'help', 'resize', 'sort', 'netmount'
						],
						contextmenu : {
							// navbarfolder menu
							navbar : ['open', '|', 'copy', 'cut', 'paste', 'duplicate', '|', 'rm', '|', 'info'],
							// current directory menu
							cwd    : ['reload', 'back', '|', 'upload', 'mkdir', 'mkfile', 'paste', '|', 'sort', '|', 'info'],
							// current directory file menu
							files  : ['getfile', '|', 'custom', 'quicklook', '|', 'download', '|', 'copy', 'cut', 'paste', 'duplicate', '|', 'rm', '|', 'edit', 'rename', '|', 'archive', 'extract', '|', 'info']
						},
						rememberLastDir: false,
						useBrowserHistory: false,
						reloadClearHistory: true
					}).elfinder('instance');
        	}
        },
        mounted: function () {
			var self = this;


			//console.log("Some:" + this.disk);

			$(document).ready(function(){
				self.initElfinder();
			});
        }
    }
</script>
