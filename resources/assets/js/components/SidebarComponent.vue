    <template>
    <div>
        <div class="page-sidebar-wrapper">
            <!-- BEGIN SIDEBAR -->
            <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
            <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
            <div class="page-sidebar navbar-collapse collapse">
                <!-- BEGIN SIDEBAR MENU -->
                <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
                <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
                <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
                <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
                <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true"
                    data-slide-speed="200" style="padding-top: 20px">
                    <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
                    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                    <li class="sidebar-toggler-wrapper hide">
                        <div class="sidebar-toggler">
                            <span></span>
                        </div>
                    </li>
                    <!-- END SIDEBAR TOGGLER BUTTON -->

					<li v-for="item in menuItems" class=""   @mousedown.stop="makeCurrent(item)" @click="test(item.hasOwnProperty('subItems'), $event)" v-bind:class="{'active': current == item.title, 'menu-label': item.class == 'menu-label'}">
						<router-link :to="item.href" class="nav-link nav-toggle" exact>
							<i :class="item.iconClass"></i>
							<span class="title" >{{item.title}}</span>
                            <i class="icon-arrow-down right-icon" v-if="item.hasOwnProperty('subItems')"></i>
						</router-link>
                        <transition>
                            <ul class="sub-menu" v-if="item.hasOwnProperty('subItems')">
                                <li class="nav-item" v-for="sub in item.subItems" @mousedown.stop="makeSub(sub)" v-bind:class="{'active': current == item.title && currentSub == sub.title}">
                                    <router-link :to="sub.href" class="nav-link" exact>
                                        <span class="title">{{sub.title}}</span>
                                    </router-link>
                                </li>
                            </ul>
                        </transition>

					</li>
                </ul>
            </div>
            <!-- END SIDEBAR -->
        </div>
    </div>
</template>

<script>

    export default{
        props: {},
        computed: {},
        watch: {
			$route: function() {
				if (this.$route.name == 'file-manager') {
					$('body').addClass('page-sidebar-closed auto-close');
        			$('ul.page-sidebar-menu').addClass('page-sidebar-menu-closed');
            	} else {
            		if($('body').hasClass('auto-close')) {
						$('body').removeClass('page-sidebar-closed auto-close');
						$('ul.page-sidebar-menu').removeClass('page-sidebar-menu-closed');
            		}
            	}
			}
        },
        data(){
			return{
				menuItems: window.menu_items,
				current:'',
				currentSub:'',
			}
		},
        components:{},
        methods: {
        	makeSub(sub){
                this.currentSub = sub.title;
            },
            goToFirstSubMenu(){


            },
            makeCurrent(item){
                this.current = item.title;
                this.currentSub = '';
            },
            test(have, event){
            if(have){
                event.stopPropagation();
            }

            }
        },
        mounted: function () {
        }
    }

</script>