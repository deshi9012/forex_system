<template>
	<div>
		<elfinder disk="creative"></elfinder>
	</div>
</template>
<style>

</style>
<script>
    import elFinder from './FileManagement_elfinder.vue'

    export default{
        props: {},
        computed: {},
        data(){
            return{
                msg: 'hello vue'
            }
        },
        components:{
        	'elfinder': elFinder
        },
        methods: {},
        mounted: function () {

        }
    }
</script>