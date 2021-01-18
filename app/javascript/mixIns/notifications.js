import NotificationsTag from '../packs/components/shared/notifications.vue';

export default {
  data () {
    return {
      notifications: []
    }
  },
  
  methods: {
    setNotifications (response) {
        response.data.notifications.map(element => {
            let item = {
              image: 'http://localhost:3000/api/v1/user_photo/' + element.user_id,
              user_id: element.user_id,
              message: element.message,
              nickname: element.nickname,
              created_at: element.created_at
            }
            this.notifications.push(item)
        })
    }
  },
  components: {
    notificationsTag: NotificationsTag
  }

}