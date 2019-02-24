<template>
    <div>

        <div class="page-bar" :class="{'page-bar_form':!isScrolled}">
            <breadcrumb-component></breadcrumb-component>

            <div class="page-toolbar">
                <router-link :to="'/user'" class="btn default">Back</router-link>
                <button @click.prevent="saveUser()" class="btn blue">Save</button>
            </div>
        </div>
        <form class="form">
            <div class="form__main">

                <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.first_name}">

                    <label class="  control-label" for="form_control_1">First Name
                        <span class="required">*</span>
                    </label>

                    <label class="error-label" v-if="error.first_name">
                        {{error.first_name}}
                    </label>
                    <div>
                        <input type="text" class="form-control" id="form_control_1" placeholder="" name="first_name" v-model="user.first_name" @focus="removeError('first_name')">
                        <div class="form-control-focus"> </div>
                        <span class="help-block">user first name</span>
                    </div>
                </div>

                <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.last_name}">
                    <label class="  control-label" for="form_control_2">Last Name
                        <span class="required">*</span>
                    </label>
                    <label class="error-label" v-if="error.last_name">
                        {{error.last_name}}
                    </label>
                    <div>
                        <input type="text" class="form-control" id="form_control_2" placeholder="" name="last_name" v-model="user.last_name" @focus="removeError('last_name')">
                        <div class="form-control-focus"> </div>
                        <span class="help-block">user last name</span>
                    </div>
                </div>

            </div>

            <div class="form__sec">
                <h3 class="form__heading">User information</h3>
                <hr/>
                <div class="form__col">
                    <div class="form__double">
                        <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.username}">
                            <label class="  control-label" for="form_control_5">Username
                                <span class="required">*</span>
                            </label>
                            <label class="error-label" v-if="error.username">
                                {{error.username}}
                            </label>
                            <div>
                                <input type="text" class="form-control" id="form_control_5" placeholder="" name="username" v-model="user.username" @focus="removeError('username')">
                                <div class="form-control-focus"> </div>
                                <span class="help-block">username</span>
                            </div>
                        </div>

                        <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.title}">
                            <label class="  control-label" for="form_control_3">Title
                                <span class="required">*</span>
                            </label>
                            <label class="error-label" v-if="error.title">
                                {{error.title}}
                            </label>
                            <div>
                                <div>
                                    <select class="form-control" name="title" v-model="user.title" id="form_control_3" @focus="removeError('title')">
                                        <option value="">Select title</option>
                                        <option value="Mr.">Mr.</option>
                                        <option value="Mrs.">Mrs.</option>
                                        <option value="Ms.">Ms.</option>
                                        <option value="Prof.">Prof.</option>
                                        <option value="Dr.">Dr.</option>
                                        <option value="Miss">Miss.</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.position_id}">
                        <label class="control-label" for="form_control_4">Position
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.position_id">
                            {{error.position_id}}
                        </label>
                        <div>
                            <select class="form-control" name="position" v-model="user.position_id" id="form_control_4" @focus="removeError('position_id')">
                                <option value="">Select position</option>
                                <option v-for="position in positions" :value="position.id">
                                    {{ position.name }}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group form-froup__role form-md-line-input" v-bind:class="{'has-error': error.selected_roles}">
                        <label class="control-label" for="">Role
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.selected_roles">
                            {{error.selected_roles}}
                        </label>

                        <select id="roles" class="js-example-basic-multiple" multiple="multiple" name="role" @focus="removeError('selected_roles')">
                            <option v-for="role in roles" :value="role.id">{{ role.name }}</option>
                        </select>
                    </div>
                    <div class="form-group form-froup__superior form-md-line-input" v-bind:class="{'has-error': error.superior_id}">
                        <label class="  control-label" for="superior">Choose Superior
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.superior_id">
                            Please choose superior
                        </label>
                        <div>
                            <select id="superior" class="form-control" name="superior" @focus="removeError('superior_id')"><option value="false" selected="selected">Select Superior</option></select>

                        </div>
                    </div>
                    <hr/>
                    <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.work_week}">
                        <label class="  control-label" for="form_control_3">Work week
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.work_week">
                            {{error.work_week}}
                        </label>
                        <div>
                            <div>
                                <select class="form-control" name="title" v-model="user.work_week" @focus="removeError('work_week')">
                                    <option value="">Select work week</option>
                                    <option value="Mon-Fri">Mon-Fri</option>
                                    <option value="Sun-Thu">Sun-Thu</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.salary}">
                        <label class="  control-label" for="form_control_12">Salary
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.salary">
                            {{error.salary}}
                        </label>

                        <div>
                            <input type="text" class="form-control" id="form_control_12" placeholder="" name="salary"  v-model="user.salary" @focus="removeError('salary')">
                            <div class="form-control-focus"> </div>
                            <span class="help-block">user salary</span>
                        </div>
                    </div>
                </div>

                <div class="form__col">
                    <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.phone_office}">
                        <label class="  control-label" for="form_control_9">Office Phone
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.phone_office">
                            {{error.phone_office}}
                        </label>
                        <div>
                            <input type="tel" class="form-control" id="form_control_9" placeholder="" name="phone_office" v-model="user.phone_office" @focus="removeError('phone_office')">
                            <div class="form-control-focus"> </div>
                            <span class="help-block">user office phone</span>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.email}">
                        <label class="  control-label" for="form_control_10">Office Email
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.email">
                            {{error.email}}
                        </label>
                        <div>
                            <input type="email" class="form-control" id="form_control_10" placeholder="" name="email" v-model="user.email" @focus="removeError('email')">
                            <div class="form-control-focus"> </div>
                            <span class="help-block">user work email</span>
                        </div>
                    </div>
                    <hr/>
                    <div class="form-group form-md-line-input" v-bind:class = "{'has-error': error.phone_personal}">
                        <label class="  control-label" for="form_control_8">Personal Phone
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.phone_personal">
                            {{error.phone_personal}}
                        </label>
                        <div>
                            <input type="tel" class="form-control" id="form_control_8" placeholder="" name="phone_personal" v-model="user.phone_personal" @focus="removeError('phone_personal')">
                            <div class="form-control-focus"> </div>
                            <span class="help-block">user personal phone</span>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.email_personal}">
                        <label class="  control-label" for="form_control_11">Personal Email
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.email_personal">
                            {{error.email_personal}}
                        </label>
                        <div>
                            <input type="email" class="form-control" id="form_control_11" placeholder="" name="email_personal" v-model="user.email_personal" @focus="removeError('email_personal')">
                            <div class="form-control-focus"> </div>
                            <span class="help-block">user personal email</span>
                        </div>
                    </div>
                    <div class="form-group form-md-line-input" v-bind:class="{'has-error': error.timezone_id}">
                        <label class="  control-label" for="form_control_3">TimeZone
                            <span class="required">*</span>
                        </label>
                        <label class="error-label" v-if="error.timezone_id">
                             Please choose timezone
                        </label>
                        <div>
                            <div>
                                <select class="form-control" name="timezone_id" id="timezone" @focus="removeError('timezone_id')">
                                    <option value="">Select timezone</option>
                                    <option v-for="timezone in timezones" :value="timezone.id">{{ timezone.timezone }}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <hr class="last"/>
                    <div class="form__double">
                        <div class="form-group form-md-line-input" v-bind:class="{ 'has-error' : error.password}" >
                            <label class="  control-label" for="form_control_6">Password
                                <span class="required">*</span>
                            </label>
                            <label class="error-label" v-if="error.password">
                                {{error.password}}
                            </label>
                            <div>
                                <input type="password" class="form-control" id="form_control_6" placeholder="" name="password" v-model="user.password" @focus="removeError('password')">
                                <div class="form-control-focus"> </div>
                                <span class="help-block">password</span>
                            </div>
                        </div>

                        <div class="form-group form-md-line-input"  v-bind:class="{ 'has-error' : error.password_confirmation}">

                            <label class="  control-label" for="form_control_7">Confirm Password
                                <span class="required">*</span>
                            </label>

                            <label class="error-label" v-if="error.password_confirmation">
                                {{error.password_confirmation}}
                            </label>

                            <div>
                                <input type="password" class="form-control" id="form_control_7" placeholder="" name="password_confirmation" v-model="user.password_confirmation" @focus="removeError('password_confirmation')">
                                <div class="form-control-focus"> </div>
                                <span class="help-block">password</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="form-actions">
                <router-link :to="'/user'" class="btn default">Back</router-link>
                <button @click.prevent="saveUser()" class="btn blue">Save</button>
            </div>
        </form>
    </div>
</template>
<script>
    import BreadcrumbComponent from '../BreadcrumbComponent.vue'

    export default{
        name: 'UserCreate',
        data(){
            return{
                isScrolled:false,
                test:true,
                user:{
                    title:'',
                    first_name:'',
                    last_name:'',
                    position_id:'',
                    selected_roles: [],
                    username:'',
                    password:'',
                    password_confirmation:'',
                    phone_personal:'',
                    phone_office:'',
                    email:'',
                    email_personal:'',
                    salary:'',
                    superior:'',
                    superior_id:'',
                    timezone_id:'',
                    work_week:''
                },
                users:{},
                timezones:{},
                positions:{},
                roles:{},
                error: {}
            }
        },
        computed:{

        },
        methods:{


            getUsers(){
                var self = this;

				var formatRepo = function (repo) {

					if (repo.loading) return repo.text;

					var html = repo.data.first_name + ' ' + repo.data.last_name + ' (' + repo.data.email + ')';

				  return html;
				}

				var formatRepoSelection = function (repo) {

					if(repo.hasOwnProperty('data')) {
						var html = '<b>'+ repo.data.first_name + ' ' + repo.data.last_name +'</b>' + ' (' + repo.data.email + ')';
						return html;
					} else {
						return repo.text;
					}

				}

				$("#superior").select2({
				  ajax: {
					url: "/user/find",
					dataType: 'json',
					delay: 250,
					data: function (params) {
					  return {
						q: params.term, // search term
						page: params.page
					  };
					},
					processResults: function (data, params) {
					  // parse the results into the format expected by Select2
					  // since we are using custom formatting functions we do not need to
					  // alter the remote JSON data, except to indicate that infinite
					  // scrolling can be used
					  params.page = params.page || 1;

					  return {
						results: data,
						pagination: {
						  more: (params.page * 30) < data.total_count
						}
					  };
					},
					cache: true
				  },
				  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
				  minimumInputLength: 1,
				  templateResult: formatRepo, // omitted for brevity, see the source of this page
				  templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
				});
            },
            getFullName(firstName,lastName){
                return firstName+' '+lastName;
            },
            getRoles(){
                var self = this;

                axios.get('role').then(function(response){
                    self.roles = response.data;

                    self.$nextTick(function () {
                    	$("#roles").select2();
                    });
                });

            },
            getPositions(){
                var self = this;

                axios.get('position').then(function(response){
                    //console.log(response.data);
                    self.positions = response.data;
                });
            },
            saveUser(){
                var self = this;

				var selected = $("#roles").val();
				this.$set(this.user, 'selected_roles', selected);


				var superior_id = $("#superior").val();
				this.$set(this.user, 'superior_id', superior_id);

                var timezone = $("#timezone").val();


				this.$set(this.user, 'timezone_id', timezone);


                axios.post('user', self.user).then(function(response){
                    self.$router.push({ name: 'user-index' });
                });
            },
            getTimezones(){
                var self = this;
                axios.get('timezones').then(function(response){
                    self.timezones = response.data;

                    self.$nextTick(function () {
                    	$('#timezone').select2();
                    });
                });
            },
            isTop(){
            	let scroll = $(window).scrollTop();
            	if(scroll < 5){
            	    this.isScrolled = false;
            	}else{
            	    this.isScrolled = true;
            	}
            },
            /*
            handleError(error) {
        		var self = this;
				$.each(error, function(index, value) {
					self.$set(self.error, index, value[0]);
				});
        	}
            */

            removeError(field){
                  if(this.error[field]){
                    this.error[field] = '';
                }
            },
/*            loadSelect2(){
            	var self = this;
                $(document).ready(function(){
                    $(".js-example-basic-multiple").select2().on('change', function(event) {
						self.user.selected_roles = $(event.target).val();
                    });
                });
            } */
        },
        components:{
            'breadcrumb-component':BreadcrumbComponent
        },
        mounted: function(){
            //Why we neew these two lines
            //Val: Because at some point we will need SELF and connection to the VUE instance
            var self = this;
            window.componentInstance = this;

            _smReady(function(){
				this.getUsers();
				this.getPositions();
            	this.getRoles();
            	this.getTimezones();
			}, this);

			$('.form-froup__role').on('focus','.select2',function(){
			      self.removeError('selected_roles');
			});

			$('.form-froup__superior').on('focus','.select2',function(){
			     self.removeError('superior_id');
			});
            $(document).on('scroll', function(){
                self.isTop();
            });

        }
    }
</script>
