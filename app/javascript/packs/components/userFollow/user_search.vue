<template>
  <v-container fluid>
    <v-row>
      <v-col lg="3" md="3" sm="3" cols="12" style="background-color:white;">
        <p>left</p>
      </v-col>
      <v-col lg="5" md="5" sm="5" cols="12">
        <v-card
          min-height="700"
          class=""
        >
          <v-system-bar></v-system-bar>
          <v-toolbar
            flat
            color="transparent"
          >
            <v-btn icon>
              <v-icon>mdi-arrow-left</v-icon>
            </v-btn>
            <v-text-field
              v-model="search"
              append-icon="mdi-magnify"
              label="Search News"
              single-line
            ></v-text-field>
          </v-toolbar>
        <v-card-text class="py-0">
          <v-chip
            v-for="(keyword, i) in keywords"
            :key="i"
            class="mr-2"
          >
            {{ keyword }}
          </v-chip>
        </v-card-text>
        <v-list three-line>
          <v-list-item
            v-for="(item, i) in searching"
            :key="i"
            ripple
            @click="() => {}"
          >
            <v-img
              :src="item.image"
              class="mr-4"
              max-width="64"
              min-width="64"
            ></v-img>
    
            <v-list-item-content>
              <span
                class="text-uppercase font-weight-regular caption"
                v-text="item.category"
              ></span>
    
              <div v-text="item.title"></div>
                    <v-card-actions>
                      <v-spacer></v-spacer>
    
                      <v-btn icon>
                        <v-icon>mdi-heart</v-icon>
                      </v-btn>
      
                      <v-btn icon>
                        <v-icon>mdi-bookmark</v-icon>
                      </v-btn>
      
                      <v-btn icon>
                        <v-icon>mdi-share-variant</v-icon>
                      </v-btn>
                    </v-card-actions>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-card>
      </v-col>
       <v-col lg="4" md="4" sm="4" cols="12" style="background-color:white;">
         <p>right</p>
      </v-col>
    </v-row>
    <p> info  : {{this.info}}</p>
  </v-container>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
  import Config from '../../../const/config';
  
  export default {
    
    data: () => ({
      info: '',
      items: [
        {
          image: 'https://cdn-images-1.medium.com/max/1024/1*9C9hLji68wV373tk8okLYA.jpeg',
          title: 'TBI’s 5 Best: SF Mocktails to Finish Dry January Strong',
          category: 'Travel',
          keyword: 'Drinks',
        },
        {
          image: 'https://cdn-images-1.medium.com/max/1024/1*BBNtYUieAqHoXKjiJ2mMjQ.png',
          title: 'PWAs on iOS 12.2 beta: the good, the bad, and the “not sure yet if good”',
          category: 'Technology',
          keyword: 'Phones',
        },
        {
          image: 'https://cdn-images-1.medium.com/max/1024/1*rTEtei1UEmNqbq6evRsExw.jpeg',
          title: 'How to Get Media Mentions for Your Business',
          category: 'Media',
          keyword: 'Social',
        },
        {
          image: 'https://cdn-images-1.medium.com/max/1024/1*FD2nkJewVeQnGf0ommQfrw.jpeg',
          title: 'The Pitfalls Of Outsourcing Self-Awareness To Artificial Intelligence',
          category: 'Technology',
          keyword: 'Military',
        },
        {
          image: 'https://cdn-images-1.medium.com/max/1024/1*eogFpsVgNzXQLCVgFzT_-A.jpeg',
          title: 'Degrees of Freedom and Sudoko',
          category: 'Travel',
          keyword: 'Social',
        },
      ],
      search: '',
    }),

    computed: {
      keywords () {
        if (!this.search) return []

        const keywords = []

        for (const search of this.searching) {
          keywords.push(search.keyword)
        }

        return keywords
      },
      searching () {
        if (!this.search) return this.items

        const search = this.search.toLowerCase()

        return this.items.filter(item => {
          const text = item.title.toLowerCase()
          return text.indexOf(search) > -1
        })
      },
    },
    mounted: function(){
          console.log('testlist mounted');
          axios
          .get('http://localhost:3000/api/v1/user_search', {
              
          })
          .then(response => {
            this.info = response.data;
            response.data.users.map(element => {
              
              let item = {
                image: 'https://cdn-images-1.medium.com/max/1024/1*eogFpsVgNzXQLCVgFzT_-A.jpeg',
                title: element.name,
                category: element.name,
                keyword: element.name,
              };
              
              this.items.push(item)})

          })
          .catch      
      },
    methods: {

    },
  }
</script>