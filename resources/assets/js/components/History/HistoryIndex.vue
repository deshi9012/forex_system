<template>
    <div>
        <div class="page-bar">
            <breadcrumb-component></breadcrumb-component>
            <div class="page-toolbar">
                <div class="btn-group">

                </div>
            </div>
        </div>


        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet light">
            <div class="portlet-body">
                <table class="table table-large table-striped table-bordered table-hover table-checkable order-column" data-order='[[ 0, "desc" ]]' id="table-history">
                    <thead>
                    <tr>
                        <th><span>ID</span></th>
                        <th>Event type</th>
                        <th>Who did the action(name)</th>
                        <th>Which item(id)</th>
                        <th>Which section</th>
                        <th>When action is done</th>
                        <!--<th>Revert history</th>-->
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="odd gradeX" v-for="(item, index) in histories" >
                        <td > {{item.id}} </td>
                        <td > {{item.event_type}} </td>

                        <td > {{item.user.full_name}} </td>
                        <td > {{item.item_id}} </td>

                        <td > {{item.section}} </td>
                        <td > {{item.created_at}} </td>
                        <!--<td>-->

                            <!--<span @click="revertHistory(item.id)" class="files__icon files__icon_button"-->
                                  <!--data-toggle="tooltip" title="Delete file">-->
											<!--<i class="icon-loop"></i>-->
									<!--</span>-->
                        <!--</td>-->
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
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
                histories:[],
           }
       },

       methods: {
            getHistories() {
        		var self = this;

        		axios.get('/history').then(function (response) {

                    self.histories = response.data;

                    self.$nextTick(function () {
                        if ( ! $.fn.DataTable.isDataTable( '#table-history' ) ) {
                            $('#table-history').DataTable({
                                "bLengthChange": false,
                                 "columnDefs": [ {
                                                "orderable": false
                                                } ]
                            });
                        }
                        //self.$nextTick(function () {
							$("input").attr("placeholder", "search");
						//});
                    })
				});
        	},
            deleteHistory(id, index) {

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
                    axios.delete('/history/'+id).then(function (response) {
                        //console.log(response);
                        self.histories.splice(index, 1);
                        swal(
                           'Deleted!',
                           'Your file has been deleted.',
                           'success'
                        );
                    });
                })


        	},

        	revertHistory(historyId){
        	    var self = this;
        	    axios.post('history/revert', {'id': historyId}).then(function(response){
        	        //console.log(response);
        	        self.getHistories();





        	    }).catch(function(error){
								//console.log(error);
								swal(
								   'Oops...',
								   error,
								   'error'
								);
							});
        	},
        	goTo(url){
        		this.$router.push(url);
        	},

        },
       components:{
           //'action-component':ActionComponent,
           'breadcrumb-component':BreadcrumbComponent
       },
       mounted: function () {
            var self = this;
           $(document).ready(function(){
               self.getHistories();
           });

           /*
           this.getPositionTree();
           */
       }
   }


</script>