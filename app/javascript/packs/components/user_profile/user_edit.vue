<template>
<div>
    <v-container fluid>
      <v-row justify="center">
      <v-col lg="5" md="5" sm="5" cols="12"
              class="">
        <v-card
          class ="pa-lg-8 pa-md-8 pa-sm-8 pa-10" outlined tile
          min-height="380"
        >
          <v-form
              ref="form"
              v-model="valid"
              lazy-validation
          >
            <v-text-field
              v-model="name"
              :counter="10"
              :rules="nameRules"
              label="Name"
              required
            ></v-text-field>
            <v-text-field
              v-model="nickname"
              :counter="10"
              :rules="nameRules"
                label="NickName"
                required
              ></v-text-field>
               <v-file-input
            　v-model="input_image"
            　accept="image/*"
            　show-size
            　label="画像ファイルをアップロードしてください"
            　prepend-icon="mdi-image"
            　@change="onImagePicked"
                ></v-file-input>
            <v-img
                v-if="uploadImageUrl != null"
                :src="uploadImageUrl"
                class="white--text align-end"
                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                height="200px"
            ></v-img>
            <v-checkbox
                v-model="checkbox"
                :rules="[v => !!v || 'You must agree to continue!']"
                label="Do you agree?"
                required
            ></v-checkbox>
            <v-row justify="center">
              <v-col lg="3" md="3" sm="12" cols="12">
                <v-btn
                block
                :disabled="!valid"
                color="success"
                class="mr-4"
                @click="updateProfile"
              >
                  Validate
              </v-btn>
              </v-col>
              <v-col lg="4" md="4" sm="12" cols="12">
                <v-btn
                block
                color="error"
                class="mr-4"
                @click="reset"
                >
                    Reset Form
                </v-btn>
              </v-col>
              <v-col lg="5" md="5" sm="12" cols="12">
                <v-btn
                block
                color="warning"
                @click="resetValidation"
                >
                    Reset Validation
                </v-btn>
              </v-col>
            </v-row>
            </v-form>
          </v-card>
        </v-col>
        <v-col lg="4" md="4" sm="4" cols="12" style="background-color:white;">
         <p>right</p>
        </v-col>
      </v-row>
    <v-container>
    <div>{{input_image}}</div>
</div>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';

  export default {

    data: () => ({
      valid: true,
      name: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => (v && v.length <= 10) || 'Name must be less than 10 characters',
      ],
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
      password: '',
      passwordRules: [
        v => !!v || 'Password is required',
      ],
      confirmPassword: '',
      confirmPasswordRules: [
        v => !!v || 'Confirm-Passward is required',
      ],
      checkbox: false,
      nickname: '',
    　input_image: null,
      uploadImageUrl: ''
    }),
 
    mounted: function(){
            console.log('mounted');
            axios
            .get('http://localhost:3000/api/v1/user_edit/' , {
              headers: { "Content-Type": "application/json" }
            })
            .then(response => {
              this.info = response.data
              this.name = response.data.name
              this.nickname = response.data.nickname
              this.uploadImageUrl = 'http://localhost:3000/api/v1/user_photo/' + response.data.id
            })
            .catch      
    },

    methods: {
      validate () {
        this.$refs.form.validate()
      },
      reset () {
        this.$refs.form.reset()
      },
      resetValidation () {
        this.$refs.form.resetValidation()
      },
      updateProfile () {
        const params = new FormData();

        // let binary = this.uploadImageUrl
        // let binaryImage = binary.split(',')[1]

        params.append('file', this.uploadImageUrl);
        params.append('name', this.name);
        params.append('nickname', this.nickname);
         axios
              .put('http://localhost:3000/api/v1/user_edit/1', params,
              { headers: {
                          'content-type': 'multipart/form-data',
                        },}
            
              )
              .then(response => (this.info = response))
              .catch 
      },
      onImagePicked(file) {
        if (file !== undefined && file !== null) {
            if (file.name.lastIndexOf('.') <= 0) {
            return
            }
            const fr = new FileReader()
            fr.readAsDataURL(file)
            fr.addEventListener('load', () => {
            this.uploadImageUrl = fr.result
            })
        } else {
            this.uploadImageUrl = ''
        }
      }

    },
  }
</script>