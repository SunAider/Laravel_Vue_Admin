<template>
  <MBaseList
    title="病院 詳細"
    :pagination-data="paginationData"
    @onRegister="onRegister"
    @getPaginationResults="getPaginationResults"
  >
    <template #breadcrumb> </template>
    <template #content>
      <div class="table-wrapper">
        <table ref="table" class="table table-hover">
          <thead>
            <tr>
              <th scope="col" class="sort-header">No</th>
              <th scope="col" class="sort-header" @click="onSort('name')">病院 詳細</th>
              <th scope="col" class="sort-header" @click="onSort('tagId')">
                病院名
              </th>
              <th scope="col" class="sort-header" @click="onSort('postNum')">
                郵便番号
              </th>
              <th scope="col" class="sort-header" @click="onSort('addr')">
                住所
              </th>
              <th scope="col" class="sort-header">
                電話番号
              </th>
              <th scope="col" class="sort-header">
                担当者名
              </th>
              <th scope="col" class="sort-header">
                説 明
              </th>
              <th scope="col" class="sort-header" @click="onSort('beginDate')">
                運用開始日
              </th>
              <th scope="col" class="sort-header">アクション</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(hos, i) in hosIndexData" :key="i">
              <td class="align-middle py-1 pointer">
                {{ i + 1 }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(hos.id)">
                {{ hos.tag_id }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(hos.id)">
                {{ hos.hos_name }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(hos.id)">
                {{ hos.postNum }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(hos.id)">
                {{ hos.addr }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(hos.id)">
                {{ hos.tel }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(hos.id)">
                {{ hos.checker }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(hos.id)">
                {{ hos.desp }}
              </td>
              <td class="align-middle py-1 pointer" @click="onDetail(hos.id)">
                {{ hos.beginDate }}
              </td>
              <td class="d-flex justify-content-around align-middle py-1">
                <AButton
                  label="詳細"
                  width="96px"
                  class="ml-2"
                  :color="BUTTON.COLOR.MAIN_DARK"
                  @onClick="onDetail(hos.id)"
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
import MBaseList from '@/views/admin/components/MBaseList.vue'

import BUTTON from '@/consts/button'
import ROUTE from '@/consts/route'
import HTTP_STATUS from '@/consts/httpStatus'

import { RepositoryFactory } from '@/repositories/repositoryFactory'

const hosTagRepository = RepositoryFactory.get('hospitals')

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
    lenderIndexData: [],
    hosIndexData: [],
  }),

  created() {
    this.showLoader()
    this.fetchHos()
    this.hideLoader()
  },

  methods: {
    //
    async fetchHos() {
      const orderBy = this.isAsc ? 'asc' : 'desc'
      await hosTagRepository
        .indexWithHos(this.page, this.keyword, this.sortKey, orderBy)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.hosIndexData = res.data
          this.hosIndexData.forEach(x => {
            if (x.created_at) x.created_at = moment(x.created_at).format('YYYY-MM-DD')
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
    //
    onRegister() {
      this.$router.push({
        name: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.DETAIL.name,
        params: { id: 'new' },
      })
    },
    //
    onDetail(id) {
      this.$router.push({
        name: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.DETAIL.name,
        params: { id },
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
