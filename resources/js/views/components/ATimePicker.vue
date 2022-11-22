<template>
  <div class="form-outline">
    <label v-if="label" class="form-label pad-bot-20" :for="id"
      >{{ label }}<span v-if="required" class="text-danger ml-2 required-info">※</span></label
    >
    <p v-for="(day, i) in timesArray" :key="i">
      <label>時間 {{ i + 1 }}: </label>
      <vue-timepicker v-model="day.start_time" placeholder="開始時間"></vue-timepicker>
      <span> ~ </span>
      <vue-timepicker v-model="day.end_time" placeholder="締め切り"></vue-timepicker>
      &nbsp;&nbsp;&nbsp;
      <i class="dele-icon vsm--icon fa fa-times-circle" @click="$emit('onClick', i)">取消</i>
    </p>
  </div>
</template>

<script>
import moment from 'moment'

import VueTimepicker from 'vue2-timepicker/src/vue-timepicker.vue'
import { ja } from 'vuejs-datepicker/dist/locale'

export default {
  components: {
    VueTimepicker,
  },

  props: {
    id: {
      type: String,
      required: true,
      default: '',
    },
    value: {
      type: String,
      required: false,
      default: '',
    },
    disabled: {
      type: Boolean,
      required: false,
      default: false,
    },
    label: {
      type: String,
      required: false,
      default: '',
    },
    required: {
      type: Boolean,
      required: false,
      default: false,
    },
    isClearButton: {
      type: Boolean,
      required: false,
      default: false,
    },
    placeholder: {
      type: String,
      required: false,
      default: '',
    },
    timesArray: {
      type: Array,
      required: false,
      default: () => [{}],
    },
    index: {
      type: Number,
      required: false,
      default: null,
    },
  },

  data: () => ({
    firstLoad: true,
  }),
  computed: {
    ja() {
      return ja
    },
  },

  watch: {
    selectDate: {
      handler(date) {
        this.selectedDate = date
      },
      immediate: true,
    },
  },

  methods: {
    changeDate(val) {
      this.$emit('changeDate', moment(val).format('YYYY-MM-DD'), this.index)
    },
  },
}
</script>

<style>
.form-date_picker {
  padding: 0.375rem 0.75rem;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
}
.form-date_picker:disabled {
  background-color: #f9f9f9;
}
.vdp-datepicker__clear-button {
  margin-left: -20px;
  margin-right: 6px;
}
.pad-bot-20 {
  padding-bottom: 20px;
}
.dele-icon {
  cursor: pointer;
}
.dele-icon:hover {
  color: rgb(236, 25, 10);
  cursor: pointer;
}
</style>
