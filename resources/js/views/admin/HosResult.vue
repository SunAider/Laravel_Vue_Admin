<template>
  <MBaseList
    title="成果確認"
    :is-need-register-btn="false"
    :is-need-csv-export="true"
    :is-need-sub-csv-export="true"
    :pagination-data="paginationData"
    @getPaginationResults="getPaginationResults"
    @onCsvExport="onCsvExport"
    @onSubCsvExport="onSubCsvExport"
  >
    <!-- <template #breadcrumb> </template> -->
    <template #content>
      <div class="mb-4">
        <input v-model="startDateTime" type="datetime-local" name="startDTInput" />
        ~~~~~~~
        <input v-model="endDateTime" type="datetime-local" name="endDTInput" />
        <!-- <datepicker
          v-model="model.startDate"
          name="startDate"
          :format="DatePickerFormat"
        ></datepicker> -->
      </div>
      <div class="mb-4">
        <!-- <datepicker v-model="model.endDate" name="endDate" :format="DatePickerFormat"></datepicker> -->
        <!-- </datepicker> -->
      </div>

      <div class="table-wrapper">
        <table ref="table" class="table table-hover">
          <thead>
            <tr>
              <th scope="col" class="sort-header">No</th>
              <th scope="col" class="sort-header" @click="onSort('tag_id')">病院のタグ名</th>
              <th scope="col" class="sort-header">
                PC_CLICK
              </th>
              <th scope="col" class="sort-header">
                PC_IMP
              </th>
              <th scope="col" class="sort-header">
                PC_PV
              </th>
              <th scope="col" class="sort-header">
                SP_CLICK
              </th>
              <th scope="col" class="sort-header">
                SP_IMP
              </th>
              <th scope="col" class="sort-header">
                SP_PV
              </th>
            </tr>
          </thead>
          <tbody>
            <!-- <div v-if="!hosResults.length"> -->
            <tr v-for="(hosResult, i) in hosResults" :key="i">
              <td class="align-middle py-1 pointer">
                {{ i + 1 }}
              </td>
              <td class="align-middle py-1 pointer">
                {{ hosResult.tag_id }}
              </td>
              <td class="align-middle py-1 pointer">
                {{ hosResult.pcNum1 }}
              </td>
              <td class="align-middle py-1 pointer">
                {{ hosResult.pcNum2 }}
              </td>
              <td class="align-middle py-1 pointer">
                {{ hosResult.pcNum3 }}
              </td>
              <td class="align-middle py-1 pointer">
                {{ hosResult.spNum3 }}
              </td>
              <td class="align-middle py-1 pointer">
                {{ hosResult.spNum1 }}
              </td>
              <td class="align-middle py-1 pointer">
                {{ hosResult.spNum2 }}
              </td>
            </tr>
            <!-- </div> -->
          </tbody>
        </table>
      </div>
    </template>
  </MBaseList>
</template>

<script>
// import moment from 'moment'

// import AButton from '@/views/components/AButton.vue'
import MBaseList from '@/views/admin/components/MBaseList.vue'
import BUTTON from '@/consts/button'
// import ROUTE from '@/consts/route'
import HTTP_STATUS from '@/consts/httpStatus'
import { RepositoryFactory } from '@/repositories/repositoryFactory'
// import Datepicker from 'vuejs-datepicker'
import moment from 'moment'

const hosResultRepository = RepositoryFactory.get('hosresults')

export default {
  components: {
    MBaseList,
    // Datepicker,
  },

  data: () => ({
    BUTTON,
    page: 1,
    keyword: '',
    // sortKey: 'id',
    sortKey: 'id',
    isAsc: false,
    paginationData: {},
    hosResults: [],
    hosResultsSubCSV: [],
    model: {
      startDate: `${new Date().getFullYear()}-${new Date().getMonth() + 1}-01`,
      endDate: `${new Date().getFullYear()}-${new Date().getMonth() + 1}-${new Date().getDate()}`,
    },
    DatePickerFormat: 'yyyy-MM-dd',
    startDateTime: '',
    endDateTime: '',
  }),

  watch: {
    model: {
      handler(val) {
        console.log('val', val)
      },
      deep: true,
      immediate: false,
    },
    startDateTime: {
      handler(val) {
        console.log('startDateTime:', moment(val).format('YYYY-MM-DD HH:mm'))
        this.fetchHos()
      },
    },
    endDateTime: {
      handler(val) {
        console.log('endDateTime:', moment(val).format('YYYY-MM-DD HH:mm'))
        this.fetchHos()
      },
    },
  },

  mounted() {
    this.showLoader()
    this.startDateTime = moment(`${this.model.startDate} 00:00:00`).format('YYYY-MM-DD HH:mm')
    this.endDateTime = moment(`${this.model.endDate} 23:59:59`).format('YYYY-MM-DD HH:mm')
    this.fetchHos()
    this.hideLoader()
  },
  methods: {
    //
    async fetchHos() {
      const orderBy = this.isAsc ? 'asc' : 'desc'
      await hosResultRepository
        .indexWithHosResult(this.page, this.startDateTime, this.endDateTime, this.sortKey, orderBy)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.hosResults = res.data
          // console.log('axios result', this.hosResults)
        })
        .catch(async err => {
          if (err.response) {
            await this.$errHandling.adminCatch(err.response.status)
            return
          }
          this.$toast.errorToast()
        })
    },
    async fetchHosSubCSV() {
      const orderBy = this.isAsc ? 'asc' : 'desc'
      await hosResultRepository
        .indexWithHosResultCSV(this.page, this.startDateTime, this.endDateTime, this.sortKey, orderBy)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.hosResultsSubCSV = res.data 
          return res.data
          // console.log('axios result', this.hosResults)
        })
        .catch(async err => {
          if (err.response) {
            await this.$errHandling.adminCatch(err.response.status)
            return
          }
          this.$toast.errorToast()
        })
    },
    async onSort(key) {
      this.isAsc = this.sortKey === key ? !this.isAsc : true
      this.sortKey = key

      this.showLoader()
      await this.fetchHos()
      this.hideLoader()
    },
    async getPaginationResults(page) {
      this.page = page
      this.showLoader()
      // await this.fetchPrefectureIndex()
      this.hideLoader()
    },
    downloadCSVFile(csv, filename) {
      const csvFile = new Blob([csv], { type: ' text/csv' })
      const downloadLink = document.createElement('a')
      downloadLink.download = filename
      downloadLink.href = window.URL.createObjectURL(csvFile)
      downloadLink.style.display = 'none'
      document.body.appendChild(downloadLink)
      downloadLink.click()
      console.log(csvFile)
    },
    htmlToCSV(html, filename) {
      const data = []
      const rows = document.querySelectorAll('table tr')

      for (let i = 0; i < rows.length; i += 1) {
        const row = []
        const cols = rows[i].querySelectorAll('td, th')

        for (let j = 0; j < cols.length; j += 1) {
          row.push(cols[j].innerText)
        }

        data.push(row.join(','))
      }

      this.downloadCSVFile(data.join('\n'), filename)
    },
    onCsvExport() {
      console.log('CSV export ready')
      const html = document.querySelector('table').outerHTML
      this.htmlToCSV(html, 'report.csv')
    },
    async onSubCsvExport() {
      await this.fetchHosSubCSV()
      var array = this.hosResultsSubCSV
      var str = 'Tag_Name, Date/Time, Type' + '\r\n';
      // console.log("array length", array.length)
      for (var i = 0; i < array.length; i++) { 
        let line = ''
        let click_type = ''
        switch (array[i].click_type) {
          case 0:
            click_type = "PC_PV"
            break
          case 1:
            click_type = "PC_IMP"
            break
          case 2:
            click_type = "PC_CLICK"
            break
          case 3:
            click_type = "SP_IMP"
            break
          case 4:
            click_type = "SP_CLICK"
            break
          case 5:
            click_type = "SP_PV"
            break
        }
        line = array[i].tag_id + "," + array[i].click_date + "," + click_type;
        // console.log("array line", line)
        str += line + '\r\n';
      }
      var blob = new Blob([str], { type: 'text/csv;charset=utf-8;' });
      var link = document.createElement('a');
      var url = URL.createObjectURL(blob);
      link.setAttribute('href', url);
      link.setAttribute('download', 'csvfilename.csv');
      link.style.visibility = 'hidden';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    },
  },
}
</script>
