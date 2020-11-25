import DatePicker from '../packs/components/shared/date_picker.vue';
import Config from '../const/config'

export default {
  data () {
    return {
      page: 1,
      length: 0,
      search: '',
      filterType: '',
      createdTime: '',
      createdTimeType: '',
      testType: [],
      userId: [],
      items: [],
      displayItems: [],
      keepFilteritems: [],
      testFormId: '',
      comboBoxes: Config.filterTypes,
      testTypeList:[],
      userIdList:[],
      testFormIdList: [],
      dateCondtionList: Config.dateCondtionList
    }
  },

  methods: {
    isAfter: function(start, end) {
      return this.$moment(start).isAfter(end);
    },
    isSame: function(start, end) {
      return this.$moment(start).isSame(end);
    },
    isBefore: function(start, end) {
      return this.$moment(start).isBefore(end);
    },
    filterChange(newValue,filteType,createdTimeType){
     // alert('検索値： ' + newValue  +  'フィルタータイプ: ' + filteType + '登録時間 ;' + createdTimeType);
      this.filterType = filteType
      this.page = 1;

      switch (this.filterType) {
        case Config.HEADER_NAME.name:
          
          this.search =  newValue
          
          break;
        case Config.TEST_TYPE.name:
          if (newValue) {
            this.testType = newValue
          }
          break;
        case Config.USER_ID.name:
          if (newValue) {
            this.userId =  newValue
          }
          break;
        case Config.CREATED_AT.name:
          if (newValue) {
            this.createdTime = createdTimeType
            this.createdTimeType = newValue
          }
          break;
        case Config.ID.name:
          if (newValue) {
            this.testFormId = newValue
          }
          break;
          default:
      }
  　}
  },
    
  computed: {
    getToday() {
     return this.$moment().format("YYYY/MM/DD")
   },
   getCreateAt() {
     return this.$moment(this.createdTime).format("YYYY/MM/DD")
   },

   filterItems() {
     let tmpList = []
     switch (this.filterType) {
        case Config.HEADER_NAME.name:
          if (this.search) {
            tmpList = this.items.filter(item => item.header_name.indexOf(this.search) != - 1);
          } else {
            tmpList = this.items
          }
          break;
        case Config.TEST_TYPE.name:
          if (this.testType.length){
            tmpList = this.items.filter(item => this.testType.indexOf(item.test_type) >= 0);
          } else {
            tmpList = this.items
          }
          break;
        case Config.USER_ID.name:
          if (this.userId.length){
            tmpList = this.items.filter(item => this.userId.indexOf(item.user_id) >= 0);
          } else {
            tmpList = this.items
          }
          break;
        case Config.CREATED_AT.name:
          if (this.createdTimeType == Config.SAME_DAY.name)   {
            tmpList = this.items.filter(item => this.isSame(this.$moment(item.created_at).format("YYYY/MM/DD"), this.getCreateAt));
          } else if(this.createdTimeType == Config.BEFORE_DAY.name) {
            tmpList = this.items.filter(item => this.isBefore(this.$moment(item.created_at).format("YYYY/MM/DD"), this.getCreateAt));
          } else {
            tmpList = this.items.filter(item => this.isAfter(this.$moment(item.created_at).format("YYYY/MM/DD"), this.getCreateAt));
          }
          break;
        case Config.ID.name:
          if (this.testFormId){
            tmpList = this.items.filter(item => this.testFormId ==  item.id);
          } else {
            tmpList = this.items
          }
          break;
        default:
          break;
     }

     this.displayItems = tmpList.slice(this.pageSize*(this.page -1), this.pageSize*(this.page));
     this.length = Math.ceil(tmpList.length/this.pageSize);
     this.keepFilteritems = tmpList
     return this.displayItems
   },
 },
    components: {
      datePicker: DatePicker
    }
}