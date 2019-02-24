<template>
    <div>
        <!-- BEGIN HEADER -->
        <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <a href="/admin#/">
                        <img src="/images/logo.svg">
                    </a>
                </div>
                <div class="menu-toggler sidebar-toggler">
                    <span></span>
                </div>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                    <span></span>
                </a>

                <div class="top-menu">
                    <ul class="nav navbar-nav pull-right">
                        <!-- BEGIN USER LOGINphp\ DROPDOWN -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        <li class="dropdown dropdown-user" @click.stop="user_menu = !user_menu" v-bind:class="{'open': user_menu}">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <div class="top-menu__img">
                                    <img class="img-circle" :src="auth.avatar" />
                                </div>
                                <span class="username username-hide-on-mobile"> {{auth.username}}</span>
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-default">
                                <li>
                                    <a href="#" @click.prevent="showProfile()">Show Profile</a>
                                </li>
                                <li>
                                    <a href="#" @click.prevent="logout()">Log Out </a>
                                </li>
                            </ul>
                        </li>
                        <!-- END USER LOGIN DROPDOWN -->
                    </ul>

                    <div class="usser-loged">

                    </div>
                </div>
                <!-- END RESPONSIVE MENU TOGGLER -->
            </div>
            <!-- END HEADER INNER -->
        </div>
        <!-- END HEADER -->
    </div>
</template>

<script>
    export default{
        data(){
            return{
                user_menu:false,
                auth:{
                    username:window._auth_data.username,
                    id:window.user_id,
                    avatar: window._auth_data.avatar
                },
            }
        },
        methods:{
            logout(){
                axios.post('logout').then(function(response){
                        //This must change
                        window.location.href = '/login';
                });
            },
            showProfile(){
                //console.log('/user/' + this.auth.id);return;
                this.$router.push('/user/' + this.auth.id);
            },
        },
        components:{
        }
    }
</script>
