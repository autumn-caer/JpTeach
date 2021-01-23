<template>
    <v-row>
        <v-col cols="12" sm="4" md="4" lg="4">
            <v-combobox
            v-model="filterType"
            :items="comboBoxes"
            label="Combobox"
            outlined
            dense
            background-color="white"
            @input ="filterChange"
            ></v-combobox>
        </v-col>
        <v-col cols="12" sm="8" md="8" lg="8" v-show="filterType == this.getHeaderName">
        <v-text-field
            :search="search"
            append-icon="mdi-magnify"
            label="Search"
            single-line
            hide-details
            background-color="white"
            class ="py-0 px-3"
            @input="statusChange"
        ></v-text-field>
        </v-col>
        <v-col cols="12" sm="8" md="8" lg="8" v-show="filterType == this.getTestTypeName">
            <v-combobox
            :items="testTypeList"
            label="testType"
            outlined
            multiple
            dense
            background-color="white"
            @change="statusChange"
            ></v-combobox>
        </v-col>
        <v-col cols="12" sm="8" md="8" lg="8" v-show="filterType == this.getUserIdName">
            <v-combobox
            v-model="selecteditem"
            :items="userIdList"
            label="Combobox"
            outlined
            multiple
            dense
            background-color="white"
            item-text="name" item-value="id" return-object
            @change="userObjStatusChange"
            ></v-combobox>
        </v-col>
        <v-col cols="12" sm="4" md="4" lg="4" v-show="filterType == this.getCreatedAtName">
        <v-text-field v-model="createdTime" class ="py-0 px-3 white" single-line>
            <template v-slot:append-outer>
            <date-picker v-model="createdTime" @input="timeChange"/>
            </template>
        </v-text-field>
        </v-col>
        <v-col cols="12" sm="4" md="4" lg="4" v-show="filterType == getCreatedAtName">
            <v-combobox
            v-model="createdTimeType"
            :items="dateCondtionList"
            label="created_filter"
            outlined
            dense
            background-color="white"
            @change="statusChange"
            ></v-combobox>
        </v-col>
        <v-col cols="12" sm="8" md="8" lg="8" v-show="filterType == getIdname">
            <v-combobox
            :items="testFormIdList"
            label="id_filter"
            outlined
            dense
            background-color="white"
            @change="statusChange"
            ></v-combobox>
        </v-col>
    </v-row>
</template>
<script>
import Config from '../../../const/config';
import DatePicker from './date_picker.vue';

export default {
  props: ['testTypeList','userIdList', 'testFormIdList','pageSize'],

  data () {
    return {
      selecteditem: null,
      filterType: Config.HEADER_NAME.name,
      createdTime: this.$moment().format("YYYY-MM-DD"),
      createdTimeType: Config.SAME_DAY.name,
      comboBoxes: Config.filterTypes,
      dateCondtionList: Config.dateCondtionList,
      value: null
    }
  },
  methods: {
      statusChange(newValue){
          this.$emit('input', newValue, this.filterType, this.createdTime) 
      },
      userObjStatusChange(){
          let rtnArr = []
          this.selecteditem.forEach(element =>{
             rtnArr.push(element.id)
          });
          this.$emit('input', rtnArr, this.filterType, this.createdTime) 
      },
      timeChange(newValue) {
          this.$emit('input', this.createdTimeType, this.filterType, newValue) 
      },
      filterChange() {
          this.$emit('input', null ,this.filterType) 
      }
  },
  computed: {
    getHeaderName() {
        return Config.HEADER_NAME.name;
    },
    getTestTypeName() {
        return Config.TEST_TYPE.name
    },
    getUserIdName() {
        return Config.USER_ID.name
    },
    getCreatedAtName() {
        return Config.CREATED_AT.name
    },
    getIdname() {
        return Config.ID.name
    },
  },
  components: {
      datePicker: DatePicker
  }
}
</script>
<style scoped>
.v-input__slot {
    background-color:#FFFFFF;
}
</style>