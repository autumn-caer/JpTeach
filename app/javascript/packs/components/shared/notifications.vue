<template>
  <section class="activities">
      <h2>Activities_test_change</h2>
        <section 
          v-for="(item, i) in notifications"
          :key="i"
          ripple
          class="event">
          <header>
                <v-list-item-avatar size="54px" style="display:inline-block;">
                  <img :src="item.image" alt="Avatar" >
                </v-list-item-avatar>
                <v-list-item-content style="display: inline-flex;">
                <v-list-item-title>
                    <a>{{item.nickname}}</a>
                  </v-list-item-title>
                  <v-list-item-title class="eventTimestamp">{{item.created_at}}</v-list-item-title>
                </v-list-item-content>
          </header>
            <div>
                {{item.message}}
            </div>
        </section>
    </section>
</template>
<script>

export default {
  props: ['notifications'],
  data () {
    return {
    }
  }
}
</script>
<style scoped>
  .event {
    background: #fff;
    border-radius: .5rem;
    padding: 20px 20px 0;
    position: relative;
    margin-bottom: 1rem;
    -webkit-box-shadow: var(--widget-shadow);
    box-shadow: var(--widget-shadow);
  }
  .eventTimestamp {
    color: #798892;
  }
</style>