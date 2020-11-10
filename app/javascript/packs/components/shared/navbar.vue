<template>
  <v-card
    min-height="700"
    class="green lighten-2 px-3"
    dark
    permanent>
      <v-list class="green lighten-2">
      <v-list-item
          v-for="item in items"
          :key="item.title"
          link
      >
        <v-list-item-icon>
          <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
          </v-list-item>
      </v-list>
  </v-card>
</template>
<script>
  export default {
    data() {
      return {
        items: [
            { title: 'Dashboard', icon: 'mdi-view-dashboard' },
            { title: 'Account', icon: 'mdi-account-box' },
            { title: 'Admin', icon: 'mdi-gavel' },
        ],
    }
    },
  }
</script>