<template>
    <ul class="page-breadcrumb">
        <li v-for="breadcrumb in breadcrumbs">
            <a v-bind:href="breadcrumb.url" v-bind:class="breadcrumb.class">{{breadcrumb.name}}</a>
        </li>
    </ul>
</template>

<script>
    export default{
        props: ['item', 'index', 'page'],
        computed: {},
        data: function (){
            var parts = this.$route.name.split('-');
            var length = parts.length;
            var bredcrumbs = new Array();

            parts.forEach(function(part, index) {
                var breadcrumb = new Array();
                breadcrumb.name = part;
                if(index + 1 == length) {
                    breadcrumb.url = 'javascript:;',
                    breadcrumb.class = 'active-breadcrumb'
                } else {
                    breadcrumb.url = '#/' + part,
                    breadcrumb.class = ''
                }
                bredcrumbs.push(breadcrumb);
            });

            return {
                breadcrumbs: bredcrumbs
            }
        },
        components:{},
    }
</script>