<template>
	<div>

		<div class="page-bar">
			<ul class="page-breadcrumb">
				<li>
					<div class="caption font-green">
						<i class="icon-settings font-green"></i>
						<span class="caption-subject bold uppercase"> Edit Role</span>
					</div>
				</li>
			</ul>
			<div class="page-toolbar">
				<router-link :to="'/role'" class="btn default">Back</router-link>
				<button type="button" class="btn blue" @click="saveRole()">Save</button>
			</div>
		</div>
		<div class="portlet light">
			<div class="portlet-body">
				<!-- BEGIN FORM-->

				<div class="form-body">
					<div class="row">
						<div class="col-sm-6">

							<div class="form-group form-md-line-input" v-bind:class="{'has-error': error.name}">
								<label class=" control-label" for="form_control_1">Name
									<span class="required">*</span>
								</label>
								<label class="error-label" v-if="error.name">
									{{error.name}}
								</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="form_control_1" placeholder="" name="name" v-model="role.name" @focus="removeError('name')">
									<div class="form-control-focus"></div>
									<span class="help-block">role name</span>
								</div>
							</div>

							<div class="form-group form-md-line-input" v-bind:class="{'has-error': error.display_name}">
								<label class=" control-label" for="form_control_2">Display Name
									<span class="required">*</span>
								</label>
								<label class="error-label" v-if="error.display_name">
									{{error.display_name}}
								</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="form_control_2" placeholder="" name="display_name" v-model="role.display_name" @focus="removeError('display_name')">
									<div class="form-control-focus"> </div>
									<span class="help-block">role display name</span>
								</div>
							</div>

							<div class="form-group form-md-line-input" v-bind:class="{'has-error': error.description}">
								<label class=" control-label" for="form_control_5">Description
									<span class="required">*</span>
								</label>
								<label class="error-label" v-if="error.description">
									{{error.description}}
								</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="form_control_5" placeholder="" name="description" v-model="role.description" @focus="removeError('desscription')">
									<div class="form-control-focus"> </div>
									<span class="help-block">description</span>
								</div>
							</div>
						</div>
						<div class="col-sm-6 permissions-list">
							<div class="form-group form-md-line-input">
								<label class=" control-label" for="permissions">Permision
									<span class="required">*</span>
								</label>
								<label class=" control-label" for="form_control_5">
									<span class="required"></span>
								</label>
								<label class="error-label" v-if="error.description">
									{{error.description}}
								</label>
								<div class="col-md-10">
									<select id="permissions" v-model="selected_permissions" multiple="multiple">
										<option v-for="permission in permissions" :value="permission.id">{{ permission.name }}</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="form-actions">
						<router-link :to="'/role'" class="btn default">Back</router-link>
						<button type="button" class="btn blue" @click="saveRole()">Save</button>
					</div>
				</div>


				<!-- END FORM-->
			</div>
		</div>
	</div>
</template>

<style>

</style>
<script>
   //import GameIndex from './components/header.vue'

   export default{
       props: {},
       computed: {
           id(){
               return this.$route.params.id;
           },

       },
       watch:  {
            selected_permissions: function (newVal, oldVal) {
              //console.log('oldval:' + oldVal);
              //console.log('newval:' + newVal);
            }
       },
       data(){
           return{
               role: {
                    permissions: [],
               },
               error: {},
               permissions: [],
               selected_permissions: [],
               selected_permissions2: ['356'],
           }
       },
       components:{},
       methods: {
           getRole(){
               var self = this;
               //console.log('----');
               //peshko
               //miro
               //console.log(self.selected_permissions);
               //console.log('----');
               axios.get('role/' + self.id).then(function(response){

                    //console.log(response.data.permissions);

                    var rolesArray = [];

                    response.data.permissions.forEach(function(role){
                        rolesArray.push(parseInt(role.id));
                    });

                    //console.log(rolesArray);

                    self.$set(self, 'role', response.data);
                    self.$set(self, 'selected_permissions', rolesArray);
                    self.$set(self, 'selected_permissions2', rolesArray);


               //console.log('----2');
               //console.log(self.selected_permissions);
               //console.log(self.selected_permissions2);
               //console.log('----2');

                    self.$nextTick(function () {
                           ///console.log('----3');
                           //console.log(self.selected_permissions);
                           //console.log(self.selected_permissions2);
                           //console.log('----3');
                    });
               });
           },
           getPermissions(){
               var self = this;

               axios.get('permission').then(function(response){

                   self.permissions = response.data;

                   response.data.forEach(function(permission){
                       if(!(permission.name == 'login' || permission.name == 'logout' || permission.name == 'register')){
                           self.setCommonPermission(permission.display_name);
                       }
                   });
               });
           },
           saveRole(){
            var self = this;
                axios.put('role/'+self.id, self.role).then(function(response){
                        self.$router.push({ name: 'role-index' })
                    });
            },
           removeError(field){
                this.error[field] = '';
           }
       },
       mounted: function () {
            var self = this;
            window.componentInstance = this;

            _smReady(function(){
                this.getRole();
                this.getPermissions();
           }, self);
       }
   }
</script>