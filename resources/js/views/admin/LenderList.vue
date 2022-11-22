<template>
  <MBaseList
    title="ユーザー一覧"
    :pagination-data="paginationData"
    @onRegister="onRegister"
    @getPaginationResults="getPaginationResults"
  >
    <template #breadcrumb> </template>
    <!-- フェーズ2以降で使うので残しておく 2022/6/5 -->
    <!-- <template #search>
      <div class="my-3">
        <ASearchBox placeholder="貸船業者名," @search="onSearch"></ASearchBox>
      </div>
    </template> -->
    <template #content>
      <div class="table-wrapper">
        <table ref="table" class="table table-hover">
          <thead>
            <tr>
              <th scope="col" class="sort-header" >№</th>
              <th scope="col" style="display:none" class="sort-header" >ID</th>
              <th scope="col" class="sort-header" >ユーザー名</th>
              <!-- <th scope="col" class="sort-header" @click="onSort('boat_name')">船名</th>
              <th scope="col" class="sort-header" @click="onSort('prefecture_name')">都道府県</th>
              <th scope="col" class="sort-header" @click="onSort('city_name')">市町村</th>
              <th scope="col" class="sort-header" @click="onSort('port_name')">港</th> -->
              <th scope="col" class="sort-header" >
                ユーザー名(ふりがな)
              </th>
              <th scope="col" class="sort-header" >
                メールアドレス
              </th>
              <th scope="col" class="sort-header" >
                作成日
              </th>
              <th scope="col" class="sort-header">アクション</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(lender, i) in lenderIndexData" :key="i">
              <td class="align-middle py-1 pointer" @click="onDetail(lender.id)">
                {{ i+1 }}
              </td>              
              <td style="display:none" class="align-middle py-1 pointer !hidden" @click="onDetail(lender.id)">
                {{ lender.id }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(lender.id)">
                {{ lender.name }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(lender.id)">
                {{ lender.name_kana }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(lender.id)">
                {{ lender.email }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(lender.id)">
                {{ lender.created_at }}
              </td>
              <td class="d-flex justify-content-around align-middle py-1">
                <AButton
                  label="詳細"
                  width="96px"
                  class="ml-2"
                  :color="BUTTON.COLOR.MAIN_DARK"
                  @onClick="onDetail(lender.id)"
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
import moment from 'moment'

import AButton from '@/views/components/AButton.vue'
// import ASearchBox from '@/views/components/ASearchBox.vue' /フェーズ2以降で使うので残しておく 2022/6/5
import MBaseList from '@/views/admin/components/MBaseList.vue'

import BUTTON from '@/consts/button'
import ROUTE from '@/consts/route'
import HTTP_STATUS from '@/consts/httpStatus'

import { RepositoryFactory } from '@/repositories/repositoryFactory'

const lenderRepository = RepositoryFactory.get('lenders')

export default {
  components: {
    AButton,
    // ASearchBox, /フェーズ2以降で使うので残しておく 2022/6/5
    MBaseList,
  },

  data: () => ({
    BUTTON,
    page: 1,
    keyword: '',
    sortKey: 'id',
    isAsc: false,
    paginationData: {},
    lenderIndexData: [],
  }),

  created() {
    this.showLoader()
    this.fetchAdmin()
    this.hideLoader()
  },

  methods: {
    async fetchAdmin() {
      const orderBy = this.isAsc ? 'asc' : 'desc'
      await lenderRepository
        .index(this.page, this.keyword, this.sortKey, orderBy)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.paginationData = res.data
          this.lenderIndexData = res.data.data
          this.lenderIndexData.forEach(x => {
            if (x.created_at) x.created_at = moment(x.created_at).format('YYYY-MM-DD')
            if (x.updated_at) x.updated_at = moment(x.updated_at).format('YYYY-MM-DD')
          })
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
        name: ROUTE.ADMIN.LENDER.DETAIL.name,
        params: { id: 'new' },
      })
    },

    onDetail(id) {
      this.$router.push({
        name: ROUTE.ADMIN.LENDER.DETAIL.name,
        params: { id },
      })
    },
    /*-------------------------------------------*/
    /* 一覧共通
    /*-------------------------------------------*/
    async getPaginationResults(page) {
      this.page = page
      this.showLoader()
      await this.fetchLenderWithBoatIndex()
      this.hideLoader()
    },

    async onSort(key) {
      this.isAsc = this.sortKey === key ? !this.isAsc : true
      this.sortKey = key

      this.showLoader()
      await this.fetchLenderWithBoatIndex()
      this.hideLoader()
    },

    async onSearch(keyword) {
      this.keyword = keyword
      this.showLoader()
      await this.fetchLenderWithBoatIndex()
      this.hideLoader()
    },
  },
}
</script>
