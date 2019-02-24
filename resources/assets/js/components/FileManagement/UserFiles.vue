<template>
   <div>
       <elfinder disk="users"></elfinder>
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

           }
       },
       components:{
        	'elfinder': elFinder
        },
       methods: {},
       mounted: function () {}
   }
</script>