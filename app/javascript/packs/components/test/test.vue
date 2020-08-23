<template>
    <p>{{this.infomation}}</p>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
    export default {
          data: () => ({
      infomation: '',
        }),
        mounted: function(){
            console.log('mounted');
            axios
            .get('http://localhost:3000/api/v1/test_form', {
                email: this.email,
                name: this.name,
                password: this.password,
                    password_confirmation: this.confirmPassword
            })
            .then(response => (this.infomation = response.headers))
            .catch      
        },
        
    }
</script>