<template>
    <v-container fluid class="pa-md-0">
      <h1 class="page-title">User - <span class="fw-semi-bold">Profile</span></h1>
      <v-row>
        <v-col lg="6" md="6" sm="12" cols="12">
          <section class="widget">
            <div class="widgetBody widget-body">
              <div class="widget-top-overflow text-white">
                <div class="height-250 overflow-hidden">
                  <img src="../../../../assets/images/dam.jpg" class="img-fluid" alt="test"/>
                </div>
                  <a class="btn btn-outline btn-sm mb-2"><v-icon class="fa fa-twitter mr-2">mdi-magnify</v-icon></a>
                  <v-row>
                    <v-col cols="12" md="5" class="text-center">
                      <div class="profileContactContainer">
                        <!-- <span class="thumb-xl thumb-lg thumb-sm thumb thumb-xs mb-3">
                          <img src="../../../../assets/images/dam.jpg" alt="test" class="profileAvatar rounded-circle"/>
                        </span> -->
                        <v-avatar size="100px">
                          <img alt="Avatar" src="../../../../assets/images/dam.jpg">
                        </v-avatar>
                        <h5 class="fw-normal text-black">{{getUserName}}<span class="fw-semi-bold"></span></h5>
                        <p class="text-black">UI/UX designer</p>
                        <a href="#" class="btn btn-success btn-sm mb-3">Send</a>
                        <div>
                          <ul class="profileContacts mt-sm">
                            <li><i class="fa fa-lg fa-phone fa-fw mr-2"></i><a>+375 29 555-55-55</a></li>
                            <li><i class="fa fa-lg fa-envelope fa-fw mr-2"></i><a>psmith@example.com</a></li>
                            <li><i class="fa fa-lg fa-map-marker fa-fw mr-2"></i><a>Minsk, Belarus</a></li>
                          </ul>

                        </div>
                    </v-col>
                    <v-col cols="12" md="7" class="text-black">
                      <div class="stats-row mt-3 text-black">
                        <div class="stats-row mt-3">
                          <p class="profileStatValue value text-right text-center text-black">{{this.testHeaderSize}}</p>
                          <h6 class="name text-black">Posts</h6>
                        </div>
                        <div class="stats-row mt-3">
                          <p class="profileStatValue value text-right text-center text-black">9.38%</p>
                          <h6 class="name text-black">Conversion</h6>
                        </div>
                        <div class="stats-row mt-3">
                          <p class="profileStatValue value text-right text-center text-black">842</p>
                          <h6 class="name text-black">Followers</h6>
                        </div>
                      </div>
                      <div>
                        <p class="badge badge-info rounded-0">UI/UX</p>
                        <p class="badge badge-primary rounded-0 ml-2"> Web Design</p>
                        <p class="badge badge-default rounded-0 ml-2"> Mobile Apps</p>
                        <v-chip :color="`green lighten-4`" class="ml-0 mr-2 black--text" label small>test apps</v-chip>
                      </div>
                      <p class="lead mt-xlg">My name is Adam Johns and here is my new Sing user profile page.</p>
                      <p class="text-muted">
                        I love reading people's summaries page especially
                        those who are in the same industry as me.
                        Sometimes it's much easier to find your concentration during the night.
                      </p>
                    </v-col>
                  </v-row>
              </div>
            </div>
          </section>
        </v-col> 
        <v-col lg="6" md="6" sm="12" cols="12">
          <section class="activities">
            <h2>Activities_test_change</h2>
            <section class="event">
              <header>
                <v-list-item-avatar size="54px" style="display:inline-block;">
                  <img alt="Avatar" src="../../../../assets/images/dam.jpg">
                </v-list-item-avatar>
                <v-list-item-content style="display: inline-flex;">
                <v-list-item-title>
                    <a>Bob Nilson</a>
                    <small><a>@nils</a></small>
                  </v-list-item-title>
                  <v-list-item-title class="eventTimestamp">February 22, 2014 at 01:59 PM</v-list-item-title>
                </v-list-item-content>
              </header>
                <div>
                  There is no such thing as maturity. There is instead an ever-evolving process of maturing. Because when there is a maturity, there is ..
                </div>
                <v-row
                  align="center"
                  justify="start"
                  class="eventFooter"
                >
                  <v-icon class="mr-1">
                    mdi-heart
                  </v-icon>
                  <span class="subheading mr-2">256</span>
                  <span class="mr-1">·</span>
                  <v-icon class="mr-1">
                    mdi-share-variant
                  </v-icon>
                  <span class="subheading">45</span>
                </v-row>
            </section>
          </section>
          <section class="activities">
            <section class="event">
              <header>
                <v-list-item-avatar size="54px" style="display:inline-block;">
                  <img alt="Avatar" src="../../../../assets/images/dam.jpg">
                </v-list-item-avatar>
                <v-list-item-content style="display: inline-flex;">
                <v-list-item-title>
                    <a>Jessica Smith</a>
                    <small><a>@jess</a></small>
                  </v-list-item-title>
                  <v-list-item-title class="eventTimestamp">February 22, 2014 at 01:59 PM</v-list-item-title>
                </v-list-item-content>
              </header>
                <div>
                  Check out this awesome photo I made in Italy last summer. Seems it was lost somewhere deep inside my brand new HDD 40TB. Thanks god I found it!
                </div>
                <v-row
                  align="center"
                  justify="start"
                  class="eventFooter"
                >
                  <v-icon class="mr-1">
                    mdi-heart
                  </v-icon>
                  <span class="subheading mr-2">256</span>
                  <span class="mr-1">·</span>
                  <v-icon class="mr-1">
                    mdi-share-variant
                  </v-icon>
                  <span class="subheading">45</span>
                </v-row>
                <v-list-item-content style="display: inline-flex;">
                  <v-list-item-title >
                    <a>Ignacio Abad </a>
                  </v-list-item-title>
                  <v-list-item-title>Hey, have you heard anything about that?</v-list-item-title>
                </v-list-item-content>
                <div>
                  <v-list-item-avatar size="54px" style="display:inline-block;">
                    <img alt="Avatar" src="../../../../assets/images/dam.jpg">
                  </v-list-item-avatar>
                 <div class="comment-body" style="display: inline-flex;"><input type="text" placeholder="Write your comment..." class="form-control form-control-sm form-control"/></div>
                </div>
            </section>
          </section>
        </v-col>
        <v-col lg="6" md="6" sm="12" cols="12" class="pa-md-0">
          <v-card
            class ="pa-lg-8 pa-md-8 pa-sm-8 pa-8"
            min-height="600"
            >
            <v-card :elevation="0" color="amber lighten-5">
              <v-card-title class="headline">Profile</v-card-title>
              <v-card-subtitle title>Listen to your favorite artists and albums whenever and wherever, online and offline.</v-card-subtitle>
              <v-card-text class="text--primary">
                <div>{{getUserId}}</div>
                <div>{{getUserName}}</div>
                <div>{{getEmail}}</div>
              </v-card-text>
             </v-card>
             <v-divider
                class="md-6"
                vertical
              ></v-divider>
            <v-card :elevation="0" color="amber lighten-5">
              <v-card-title class="headline">Test Page</v-card-title>
              <v-card-subtitle>Listen to your favorite artists and albums whenever and wherever, online and offline.</v-card-subtitle>
            </v-card>
             <v-divider
                class="md-6"
                vertical
              ></v-divider>
            <v-card :elevation="0" color="amber lighten-5">
              <v-card-title class="headline">JpTech Sign Up</v-card-title>
              <v-card-subtitle>Listen to your favorite artists and albums whenever and wherever, online and offline.</v-card-subtitle>
            </v-card>
             <v-divider
                class="md-6"
                vertical
              ></v-divider>
            <v-form>
              <v-row>
                <v-col lg="4" md="4" sm="12" cols="12">
                   <v-btn
                    block
                    color="warning"
                    @click="backToRoot"
                    >
                    Back to URL
                  </v-btn>
                </v-col>
                <v-col lg="4" md="4" sm="12" cols="12">
                   <v-btn
                    block
                    color="warning"
                    @click="backToRoot"
                    >
                    Back to URL
                  </v-btn>
                </v-col>
              </v-row>
           </v-form>
          </v-card>
        </v-col>
      </v-row>
      <p>{{this.info}}</p>
    </v-container>
</template>
<script>
 // axiosを読み込む
  import axios from 'axios';
  import { mapGetters } from 'vuex';

export default {
  data: function () {
    return {
      message: "Log in",
      tab: null,
      items: [
        'web', 'shopping', 'videos', 'images', 'news',
      ],
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      info: '',
      testHeaderSize: 0
    }
  },

   mounted: function(){
            console.log('mounted');
            axios
            .get('http://localhost:3000/api/v1/user_page/' , {
              headers: { "Content-Type": "application/json" },
               email: this.email,
              
            })
            .then(response => {
       
              this.info = response.data;
              this.testHeaderSize = response.data.testFormHeader.length
              for (var key in response.data.testForms) {
                  this.items.push(response.data.testForms[key]);
              }

            })
            .catch      
  },
  computed: {
    ...mapGetters([
      'getUserId',
      'getUserName',
      'getEmail'
    ]),
  
  },
  
  methods: {
      backToRoot () {
          this.$router.push('/');
      }
  }
}
</script>
<style scoped>
  .profile {
    background: url("../../../../assets/images/dam.jpg");
    background-size: cover;
    background-position: center center;
  
  }
  .widget {
    display: block;
    position: relative;
    margin-bottom: 40px;
    padding: 15px 20px;
    background: #fff;
    border-radius: .45rem;
    -webkit-box-shadow: var(--widget-shadow);
    box-shadow: var(--widget-shadow);
  }
  .text-white {
    color: #fff!important;
  }
  .text-black {
    color: rgb(0, 0, 0)!important;
  }
  .widget-top-overflow, .widget-top-overflow>img {
    border-top-left-radius: .5rem;
    border-top-right-radius: .5rem;
  }
  .widget-top-overflow {
    margin-top: -30px;
    overflow: hidden;
  }
  .widget-middle-overflow, .widget-top-overflow {
    position: relative;
    margin: 0 -20px;
  }
  .widget-top-overflow {
      margin-top: -15px;
  }
  *, :after, :before {
      -webkit-box-sizing: border-box;
      box-sizing: border-box;
  }
  .overflow-hidden {
    overflow: hidden;
  }
  .height-250 {
    height: 250px;
  }
  .img-fluid, .img-thumbnail {
    max-width: 100%;
    height: auto;
  }
  img, svg {
    vertical-align: middle;
  }
  img {
    border-style: none;
  }
  .btn:not(:disabled):not(.disabled) {
    cursor: pointer;
  }
  .btn-gray:not(.active), .btn-inverse:not(.active), .btn:not(.active) {
    -webkit-box-shadow: none!important;
    box-shadow: none!important;
  }
  .widget-top-overflow>.btn {
    position: absolute;
    top: 0;
    right: 0;
    z-index: 1;
    margin-right: 20px;
  }

  .btn, .dropdown-item, a {
    cursor: pointer;
    -webkit-transition: color .1s ease-in-out,background-color .1s ease-in-out,border-color .1s ease-in-out;
    transition: color .1s ease-in-out,background-color .1s ease-in-out,border-color .1s ease-in-out;
    font-family: Montserrat,sans-serif;
  }

  .btn-outline {
    color: #fff;
    background-color: transparent;
    border-color: #fff;
    -webkit-box-shadow: inset 0 1px 0 hsla(0,0%,100%,.15), 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 0 hsla(0,0%,100%,.15), 0 1px 1px rgba(0,0,0,.075);
  }
  .btn {
    background-image: none;
  }
  .mb-2, .my-2 {
    margin-bottom: .5rem!important;
  }
  .btn-group-sm>.btn, .btn-sm {
    padding: .4rem .8rem;
    font-size: .875rem;
    line-height: 1.5;
    border-radius: .45rem;
  }
  .btn {
    display: inline-block;
    font-weight: 400;
    color: #29323a;
    text-align: center;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-color: transparent;
    border: 1px solid transparent;
    padding: .375rem 1rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .5rem;
    -webkit-transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
  }
  a {
    color: #1a86d0;
    text-decoration: none;
    background-color: transparent;
  }
  .profileAvatar {
    border: 3px solid #fff;
  }
  .thumb-lg img, .thumb-sm img, .thumb-xl img, .thumb-xs img, .thumb img {
    height: auto;
    max-width: 75%;
    vertical-align: middle;
  }
  .rounded-circle {
    border-radius: 50%!important;
  }
  .text-center {
    text-align: center!important;
  }
  .profileContactContainer {
    margin-top: -75px;
  }
  .thumb, .thumb-lg, .thumb-sm, .thumb-xl, .thumb-xs {
    position: relative;
    display: inline-block;
    text-align: center;
  }
  h1, h2, h3, h4, h5, h6 {
      margin-top: 0;
      margin-bottom: .5rem;
  }
  .h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    margin-bottom: .5rem;
    font-weight: 500;
    line-height: 1.2;
  }
  .fw-normal {
    font-weight: 400;
  }
  .h5, h5 {
    font-size: 1.25rem;
  }
  .fw-semi-bold {
    font-weight: 600;
  }
  .btn-info, .btn-success, .btn-warning {
    color: #fff;
  }
  .btn {
    background-image: none;
  }
  .mb-3, .my-3 {
    margin-bottom: 1rem!important;
  }
  .btn-success {
    color: #fff;
    background-color: #21ae8c;
    border-color: #21ae8c;
    -webkit-box-shadow: inset 0 1px 0 hsla(0,0%,100%,.15), 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 0 hsla(0,0%,100%,.15), 
  }
  .btn-group-sm>.btn, .btn-sm {
    padding: .4rem .8rem;
    font-size: .875rem;
    line-height: 1.5;
    border-radius: .45rem;
  }
  .profileContacts {
    padding-left: 0;
    list-style: none;
    display: inline-block;
    text-align: left;
  }
  .profileContacts>li>a {
    color: #949da5; 
    text-decoration: none;
  }
  .mr-2, .mx-2 {
    margin-right: .5rem!important;
  }
  .fa-fw {
    width: 1.28571429em;
    text-align: center;
  }
  .fa-lg {
    font-size: 1.33333333em;
    line-height: .75em;
    vertical-align: -15%;
  }
  .fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }
  .stats-row {
    margin-bottom: 1.25rem;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
  }
  .mt-3, .my-3 {
    margin-top: 1rem!important;
  }
  .profileStatValue {
    font-size: 28px;
    font-weight: 300!important;
    margin-bottom: 0;
  } 
  .text-right {
    text-align: right!important;
  }
  .stats-row {
    margin-bottom: 1.25rem;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
  }
  .stat-item .name {
    margin-bottom: .25rem;
    font-size: .875rem;
  }
  p {
    margin-top: 0;
    margin-bottom: 1rem;
  }
  .badge-danger, .badge-info, .badge-success, .badge-warning {
    color: #fff;
  }
  .badge-primary {
    color: #fff;
    background-color: #005792;
  }
  .badge {
    padding: 4px 12px;
    font-weight: 600;
    font-size: 14px;
    line-height: 19px;
    display: inline-block;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
  }
  .rounded-0 {
    border-radius: 0!important;
  }
  .badge-info {
    color: #fff;
    background-color: #1a86d0;
  }
  .badge-default {
    color: #29323a;
    background-color: #d7dfe6;
  }
  .ml-2, .mx-2 {
    margin-left: .5rem!important;
  }
  .ml-3, .mx-3 {
    margin-left: 1rem!important;
  }
  .lead {
    font-size: 1.25rem;
    font-weight: 300;
  }
  .text-muted {
    color: #798892!important;
  }
  .mt-xlg {
    margin-top: 40px;
  }
  .fw-semi-bold {
    font-weight: 600;
  }
  .page-title {
    margin: 0 0 calc(1rem + 6px);
  }
  .h1, h1 {
      font-size: 2.5rem;
  }
  .event {
    background: #fff;
    border-radius: .5rem;
    padding: 20px 20px 0;
    position: relative;
    margin-bottom: 1rem;
    -webkit-box-shadow: var(--widget-shadow);
    box-shadow: var(--widget-shadow);
  }
  .eventAvatar {
    float: left;
    margin-right: 1rem;
  }
  .eventTitle {
    margin-bottom: 2px;
    font-weight: 600;
  }
  .eventTimestamp {
    color: #798892;
  }
  .eventFooter {
    background-color: #f8f9fa;
    margin: 20px -20px 0;
    padding: 10px 20px;
  }
  .post-comments .comment-body {
    overflow: auto;
  }
  .form-control {
    display: block;
    width: 100%;
    height: calc(1.5em + .75rem + 2px);
    padding: .375rem 1rem;
    font-size: 1rem;
    font-weight: 300;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #c1ccd3;
    border-radius: .5rem;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
    transition: border-color .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
  }
</style>