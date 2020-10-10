<template>
  <v-radio :label="optionLabel" :value="optionValue" :on-icon="setAnswerRadio" :readonly="checkReadOnly" color="brown darken-3"></v-radio>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
  import Config from '../../../../const/config'
  export default {
    data() {
      return {

      }
    },
    props: {
      optionLabel: {
        type: String,
        default: "test"
      },
      optionValue: {
        type: String,
        default: "test"
      },
    },
    methods: {
      checkAnswer(kbn) {
        return kbn === Config.CORRECT
      }
    },
    computed: {
      setAnswerRadio() {
        if (this.mode === Config.MODE_CHECK) {
          return  "mdi-checkbox-marked-circle"
        }
        return "$radioOn"
      },
      checkReadOnly() {
        if (this.mode === Config.MODE_CHECK) {
          return  true
        }
        return false
      },
      getOptionLabel() {
        return function(option) {
          return option.label
        }
      },
      getOptionDisplayOrder() {
        return function(option) {
          return option.display_order
        }
      }
     }
  }
</script>