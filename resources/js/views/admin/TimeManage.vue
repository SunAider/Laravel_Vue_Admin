<template>
  <MBaseList
    title="病院の時間帯管理"
    :pagination-data="paginationData"
    @onRegister="onRegister"
    @getPaginationResults="getPaginationResults"
  >
    <template #breadcrumb></template>
    <template #content>
      <div class="form-check" style="float:right">
        <input
          id="closeAll"
          class="form-check-input appearance-none h-4 w-4 border border-gray-300 rounded-sm bg-white checked:bg-blue-600 checked:border-blue-600 focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer"
          type="checkbox"
          :checked="initCloseAllState"
          @change="onChangChk($event.target.checked)"
        />
        <label class="form-check-label inline-block text-gray-800" for="closeAll">
          すべてのバナーを閉じる
        </label>
      </div>
      <div class="table-wrapper" style="width:100%">
        <table ref="table" class="table table-hover">
          <thead>
            <tr>
              <th scope="col" class="sort-header">No</th>
              <th scope="col" class="sort-header" @click="onSort('tagId')">病院のタグ名</th>
              <th scope="col" class="sort-header" @click="onSort('name')">病院名</th>
              <th scope="col" class="sort-header" @click="onSort('tagId')">時間帯</th>
              <th scope="col" class="sort-header">アクション</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(time, i) in timeIndexData" :key="i" >
              <td class="align-middle py-1 pointer">
                {{ i + 1 }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(time.id)">
                {{ time.tag_id }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(time.id)">
                {{ time.hos_name }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(time.id)">
                {{ time.time }}
              </td>
              <td class="d-flex justify-content-around align-middle py-1">
                <AButton
                  label="詳細"
                  width="96px"
                  class="ml-2"
                  :color="BUTTON.COLOR.MAIN_DARK"
                  @onClick="onDetail(time.id)"
                />
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </template>
  </MBaseList>
</template>

<script>
import AButton from '@/views/components/AButton.vue'
import MBaseList from '@/views/admin/components/MBaseList.vue'

import BUTTON from '@/consts/button'
import ROUTE from '@/consts/route'
import HTTP_STATUS from '@/consts/httpStatus'

import { RepositoryFactory } from '@/repositories/repositoryFactory'

const timeRepository = RepositoryFactory.get('time')

export default {
  components: {
    AButton,
    MBaseList,
  },

  data: () => ({
    BUTTON,
    page: 1,
    keyword: '',
    // sortKey: 'id',
    sortKey: 'created_at',
    isAsc: false,
    paginationData: {},
    timeIndexData: [],
    initCloseAllState: false,
  }),

  created() {
    this.showLoader()
    this.fetchTime()
    this.hideLoader()
    this.getChk()
  },

  methods: {
    // 時間帯一覧取得
    async fetchTime() {
      const orderBy = this.isAsc ? 'asc' : 'desc'
      await timeRepository
        .indexWithTime(this.page, this.keyword, this.sortKey, orderBy)
        .then(res => {console.log("timeArray:", res);
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.timeIndexData = res.data
        })
        .catch(async err => {
          if (err.response) {
            await this.$errHandling.adminCatch(err.response.status)
            return
          }
          this.$toast.errorToast()
        })
    },

    onRegister() {
      this.$router.push({
        name: ROUTE.ADMIN.HOSPITAL.TIMEMANAGE.DETAIL.name,
        params: { id: 'new' },
      })
    },
    onDetail(id) {
      this.$router.push({
        name: ROUTE.ADMIN.HOSPITAL.TIMEMANAGE.DETAIL.name,
        params: { id },
      })
    },
    async getChk() {
      await timeRepository
        .getAllCloseOption()
        .then(res => {
          // console.log('resdata', res)
          if (res.data === 0) this.initCloseAllState = false
          else this.initCloseAllState = true
        })
        .catch(async err => {
          if (err.response) {
            await this.$errHandling.adminCatch(err.response.status)
          }
          this.$toast.errorToast()
        })
    },
    async onChangChk(e) {
      await timeRepository
        .setAllCloseOption(e)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
          }
        })
        .catch(async err => {
          if (err.response) {
            await this.$errHandling.adminCatch(err.response.status)
          }
          this.$toast.errorToast()
        })
    },
    /*-------------------------------------------*/
    /* 一覧共通
    /*-------------------------------------------*/
    async getPaginationResults(page) {
      this.page = page
      this.showLoader()
      // await this.fetchPrefectureIndex()
      this.hideLoader()
    },

    async onSort(key) {
      this.isAsc = this.sortKey === key ? !this.isAsc : true
      this.sortKey = key

      this.showLoader()
      // await this.fetchLenderWithBoatIndex()
      this.hideLoader()
    },
  },
}
</script>
