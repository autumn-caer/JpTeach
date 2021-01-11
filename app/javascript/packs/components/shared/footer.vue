<template>
    <v-footer
      color="primary lighten-1" inset
      class="floating"
    >
      <v-row
        justify="center"
        no-gutters
      >
        <v-btn
          v-for="link in links"
          :key="link"
          color="white"
          text
          rounded
          class="my-2"
        >
          {{ link }}
        </v-btn>
        <v-col
          class="primary lighten-2 py-4 text-center white--text"
          cols="12"
        >
          {{ new Date().getFullYear() }} — <strong>Vuetify</strong>
        </v-col>
      </v-row>
    </v-footer>
</template>
<script>
export default {
  data: function () {
    return {
      links: [
      'Home',
      'About Us',
      'Team',
      'Services',
      'Blog',
      ],
      selected: 1
    }
  },

}
</script>
<style scoped>
.floating {
  z-index: 4;
}

</style>