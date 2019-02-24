<template>
	<!--<div class="btn-group" @click.stop="toggleOpen()" :class="{ open: isOpen }">-->
		<!--<button class="btn btn-xs green dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false"> Actions-->
			<!--<i class="fa fa-angle-down"></i>-->
		<!--</button>-->
		<!--<ul class="dropdown-menu pull-right" role="menu">-->
			<!--<li>-->
				<!--<a  @click.stop="goTo('/' + page + '/' + item.id + '/edit')"><i class="icon-pencil icons"></i> Edit</a>-->
			<!--</li>-->
			<!--<li class="divider"> </li>-->
			<!--<li>-->
				<!--<a  @click.stop="deleteUser(item.id, index)"><i class="icon-trash icons"></i> Delete</a>-->
			<!--</li>-->
		<!--</ul>-->
	<!--</div>-->
	<div>
		<a data-toggle="tooltip" title="Edit" @click.stop="goTo('/' + page + '/' + item.id + '/edit')"><i class="icon-pencil icons"></i></a>
		<a data-toggle="tooltip" title="Delete" @click.stop="deleteUser(item.id, index)"><i class="icon-trash icons"></i></a>
	</div>
</template>

<script>
    export default{
        props: ['item', 'index', 'page'],
        computed: {},
         data(){
           return{
                isOpen:false,
           }
       },
        components:{},
        methods: {
            toggleOpen(){
        	   this.isOpen = !this.isOpen;
        	},
        	goTo(url){
        		this.$router.push(url);
        	},
        	deleteUser(id, index){
        	    this.$emit('delete',id,index);
        	}
        },
         mounted: function () {
			$('[data-toggle="tooltip"]').tooltip()
       }
    }
</script>