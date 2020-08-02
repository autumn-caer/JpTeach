<template>
  <div>
    <v-sheet height="800">Hello, world! I'm a simple v-sheet
        <v-container fluid>
            <v-row dense>
                <v-col
                    v-for="card in cards"
                    :key="card.title"
                    :cols="card.flex"
                >
                    <v-card>
                        <v-img
                            :src="card.src"
                            class="white--text align-end"
                            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                            height="200px"
                        >
                        <v-card-title v-text="card.title"></v-card-title>
                        </v-img>
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
                    </v-card>
                </v-col>
            </v-row>
        </v-container>
    </v-sheet>
  </div>
</template>
<script>
import { mapGetters } from 'vuex';

export default {
  data: function () {
    return {
      cards: [
        { title: 'Favorite road trips', src: 'https://cdn.vuetifyjs.com/images/cards/road.jpg', flex: 3 },
        { title: 'Best airlines', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', flex: 3 },
        { title: 'sample01', src: 'https://picsum.photos/500/300?image=60', flex: 3 },
        { title: 'sample02', src: 'https://picsum.photos/500/300?image=61', flex: 3 },
        { title: 'sample03', src: 'https://picsum.photos/500/300?image=62', flex: 3 },
        { title: 'sample04', src: 'https://picsum.photos/500/300?image=63', flex: 3 },
        { title: 'sample05', src: 'https://picsum.photos/500/300?image=64', flex: 3 },
        { title: 'sample06', src: 'https://picsum.photos/500/300?image=65', flex: 3 },
        { title: 'sample07', src: 'https://picsum.photos/500/300?image=66', flex: 3 },
        { title: 'sample08', src: 'https://picsum.photos/500/300?image=67', flex: 3 },
        
      ]
    }
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


</style>