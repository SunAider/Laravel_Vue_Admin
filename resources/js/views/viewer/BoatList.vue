<template>
  <div id="Wrapper" class="list container-fluid">
    <MHeader />
    <ONavbar />

    <main class="main">
      <nav class="main-navi" aria-label="breadcrumb">
        <ol class="main-navi-breadcrumbs breadcrumb">
          <li class="main-navi-breadcrumbs-item breadcrumb-item">
            <router-link :to="ROUTE.VIEWER.HOME">遊漁船サーチ</router-link>
          </li>
          <li class="main-navi-breadcrumbs-item breadcrumb-item active" aria-current="page">
            <a :href="'/boat/' + prefectureDetail.url_param">
              {{ prefectureDetail.prefecture_name }}
            </a>
          </li>
          <li
            v-if="copy_cityParam !== 'all'"
            class="main-navi-breadcrumbs-item breadcrumb-item active"
            aria-current="page"
          >
            <a :href="'/boat/' + prefectureParam + '/' + copy_cityParam">
              {{ cityDetail.city_name }}
            </a>
          </li>
          <li
            v-if="copy_portParam !== 'all'"
            class="main-navi-breadcrumbs-item breadcrumb-item active"
            aria-current="page"
          >
            <a :href="'/boat/' + prefectureParam + '/' + copy_cityParam + '/' + copy_portParam">
              {{ portDetail.port_name }}
            </a>
          </li>
        </ol>
      </nav>

      <section class="ex-search">
        <h2 class="ex-search-headline">
          <span>
            {{ prefectureDetail.prefecture_name }}
            <span v-if="copy_cityParam !== 'all'">{{ cityDetail.city_name }}</span
            >のオススメ遊漁船一覧</span
          >
        </h2>

        <ASelectArea
          v-if="prefectureDetail.cities && copy_cityParam === 'all'"
          :id="'AreaChoiceTop'"
          :label="`${prefectureDetail.prefecture_name}のエリアで絞り込む`"
          :city-list="prefectureDetail.cities"
          :is-port="false"
          @onList="onSearchList"
        />

        <ASelectArea
          v-if="cityDetail.ports && copy_cityParam !== 'all'"
          :id="'AreaChoiceTop'"
          :label="`${prefectureDetail.prefecture_name} ${cityDetail.city_name}のエリアで絞り込む`"
          :city-list="cityDetail.ports"
          :is-port="true"
          @onList="onSearchList"
        />
      </section>

      <!------------------>
      <!-- 船一覧表示箇所 -->
      <!------------------>
      <!-- 有料会員 -->
      <section v-if="boatIndexDataPaidMember" class="main-boat ex-recommend">
        <MRecommend :paid-members-data="boatIndexDataPaidMember" @onDetail="onDetail" />
      </section>

      <!-- 無料会員 -->
      <section v-if="boatIndexDataFreeMember" class="main-boat">
        <div
          v-for="(item, index) in boatIndexDataFreeMember"
          :key="index"
          class="main-boat-free"
          @click="onDetail(item.id)"
        >
          <div class="main-boat-free-summary">
            <dl>
              <dt class="main-boat-free-summary-name">{{ item.boat_name }}</dt>
              <dd class="main-boat-free-summary-port">{{ item.port_name }}</dd>
              <dd class="main-boat-free-summary-review">{{ item.review }}</dd>
            </dl>
          </div>
          <div class="main-boat-free-information">
            <div class="main-boat-free-information-items container-fluid">
              <dl class="main-boat-free-information-item row">
                <dt class="col-3">業種</dt>
                <dd class="col-9">{{ item.operation_names }}</dd>
              </dl>
              <dl class="main-boat-free-information-item row">
                <dt class="col-3">所在地</dt>
                <dd class="col-9">
                  〒{{ item.zip_code }}<br />{{ item.prefecture_name }} {{ item.city_name }}
                  {{ item.address }}
                </dd>
              </dl>
              <dl class="main-boat-free-information-item row">
                <dt class="col-3">釣り方</dt>
                <dd class="col-9">{{ item.fishing_point }}</dd>
              </dl>
            </div>
          </div>
          <button class="main-boat-free-detail" @click="$emit('onDetail', item.id)">
            詳細を見る
          </button>
        </div>
      </section>

      <!-- 非会員 -->
      <section v-if="boatIndexDataGeneral" class="main-boat container-fluid">
        <div class="main-boat-other row">
          <div
            v-for="(item, index) in boatIndexDataGeneral"
            :key="index"
            class="main-boat-other-item col-6"
            @click="onDetail(item.id)"
          >
            <dl class="main-boat-other-item-inner">
              <dt class="main-boat-other-item-name">{{ item.boat_name }}</dt>
              <dd class="main-boat-other-item-address">
                〒{{ item.zip_code }}<br />{{ item.prefecture_name }} {{ item.city_name }}
                {{ item.address }}
              </dd>
            </dl>
          </div>
        </div>
      </section>

      <!-- 該当するデータがないとき -->
      <section v-if="boatIndexData.length === 0">
        <div class="d-flex justify-content-center mb-5 font-weight-bold">
          該当するデータがありません。
        </div>
      </section>

      <section class="main-condition">
        <h3 class="main-condition-headline">
          <span
            >{{ prefectureDetail.prefecture_name }}
            <span v-if="copy_cityParam !== 'all'">{{ cityDetail.city_name }}</span
            >の遊漁船事情</span
          >
        </h3>
        <!-- 都道府県選択中であれば都道府県コメントを表示 -->
        <p v-if="copy_cityParam === 'all'" class="main-condition-explain">
          {{ prefectureDetail.comment }}
        </p>
        <!-- 市町村選択中であれば市町村コメントを表示 -->
        <p v-if="copy_cityParam !== 'all'" class="main-condition-explain">
          {{ cityDetail.comment }}
        </p>
      </section>

      <section class="ex-search ex-bottom">
        <ASelectArea
          v-if="prefectureDetail.cities && copy_cityParam === 'all'"
          :id="'AreaChoiceBottom'"
          :label="`${prefectureDetail.prefecture_name}のエリアで絞り込む`"
          :city-list="prefectureDetail.cities"
          :is-port="false"
          @onList="onSearchList"
        />

        <ASelectArea
          v-if="cityDetail.ports && copy_cityParam !== 'all'"
          :id="'AreaChoiceBottom'"
          :label="`${prefectureDetail.prefecture_name} ${cityDetail.city_name}のエリアで絞り込む`"
          :city-list="cityDetail.ports"
          :is-port="true"
          @onList="onSearchList"
        />
      </section>
    </main>
    <MFooter />
  </div>
</template>

<script>
import moment from 'moment'

import MHeader from '@/views/viewer/components/MHeader.vue'
import ONavbar from '@/views/viewer/components/ONavbar.vue'
import MFooter from '@/views/viewer/components/MFooter.vue'
import MRecommend from '@/views/viewer/components/MRecommend.vue'
import ASelectArea from '@/views/viewer/components/ASelectArea.vue'

// const
import ROUTE from '@/consts/route'
import HTTP_STATUS from '@/consts/httpStatus'
import MEMBER_TYPE from '@/consts/memberType'

import { RepositoryFactory } from '@/repositories/repositoryFactory'

const cityRepository = RepositoryFactory.get('cities')
const boatRepository = RepositoryFactory.get('boats')
const prefectureRepository = RepositoryFactory.get('prefectures')

export default {
  components: {
    MHeader,
    ONavbar,
    MFooter,
    MRecommend,
    ASelectArea,
  },

  props: {
    prefectureParam: {
      type: String,
      required: true,
      default: '',
    },

    cityParam: {
      type: String,
      default: '',
    },

    portParam: {
      type: String,
      default: '',
    },
  },

  data: () => ({
    recommends: [
      {
        boat_name: '瀬渡し船ニュー大漁丸',
        port_name: '安瀬港',
        review: '★★★★☆',
        operation_names: '〇〇〇〇〇〇',
        address: '〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇',
        fishing_point: '〇〇〇〇〇〇〇〇〇',
        boat_img_1: '/images/dammy/photo_boat.jpg',
        phone: '0120-777-777',
        comment:
          '本文（自由入力）今日は干潮前30分から良型が集中したらしく30cmオーバー数釣でした。今日は干潮前30分から良型が集中し',
        url: '#',
      },
      {
        boat_name: '瀬渡し船ニュー大漁丸',
        port_name: '安瀬港',
        review: '★★★★☆',
        operation_names: '〇〇〇〇〇〇',
        address: '〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇',
        fishing_point: '〇〇〇〇〇〇〇〇〇',
        boat_img_1: '/images/dammy/photo_boat.jpg',
        phone: '0120-777-777',
        comment:
          '本文（自由入力）今日は干潮前30分から良型が集中したらしく30cmオーバー数釣でした。今日は干潮前30分から良型が集中し',
        url: '#',
      },
    ],
    frees: [
      {
        boat_name: '瀬渡し船ニュー大漁丸',
        port_name: '安瀬港',
        review: '★★★★☆',
        operation_names: '〇〇〇〇〇〇',
        address: '〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇',
        fishing_point: '〇〇〇〇〇〇〇〇〇',
        boat_img_1: '/images/dammy/photo_boat.jpg',
        phone: '0120-777-777',
        comment:
          '本文（自由入力）今日は干潮前30分から良型が集中したらしく30cmオーバー数釣でした。今日は干潮前30分から良型が集中し',
        url: '#',
      },
      {
        boat_name: '瀬渡し船ニュー大漁丸',
        port_name: '安瀬港',
        review: '★★★★☆',
        operation_names: '〇〇〇〇〇〇',
        address: '〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇',
        fishing_point: '〇〇〇〇〇〇〇〇〇',
        boat_img_1: '/images/dammy/photo_boat.jpg',
        phone: '0120-777-777',
        comment:
          '本文（自由入力）今日は干潮前30分から良型が集中したらしく30cmオーバー数釣でした。今日は干潮前30分から良型が集中し',
        url: '#',
      },
    ],
    others: [
      {
        boat_name: '瀬渡し船ニュー大漁丸',
        port_name: '安瀬港',
        review: '★★★★☆',
        operation_names: '〇〇〇〇〇〇',
        address: '〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇',
        fishing_point: '〇〇〇〇〇〇〇〇〇',
        boat_img_1: '/images/dammy/photo_boat.jpg',
        phone: '0120-777-777',
        comment:
          '本文（自由入力）今日は干潮前30分から良型が集中したらしく30cmオーバー数釣でした。今日は干潮前30分から良型が集中し',
        url: '#',
      },
      {
        boat_name: '瀬渡し船ニュー大漁丸',
        port_name: '安瀬港',
        review: '★★★★☆',
        operation_names: '〇〇〇〇〇〇',
        address: '〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇',
        fishing_point: '〇〇〇〇〇〇〇〇〇',
        boat_img_1: '/images/dammy/photo_boat.jpg',
        phone: '0120-777-777',
        comment:
          '本文（自由入力）今日は干潮前30分から良型が集中したらしく30cmオーバー数釣でした。今日は干潮前30分から良型が集中し',
        url: '#',
      },
      {
        boat_name: '瀬渡し船ニュー大漁丸',
        port_name: '安瀬港',
        review: '★★★★☆',
        operation_names: '〇〇〇〇〇〇',
        address: '〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇',
        fishing_point: '〇〇〇〇〇〇〇〇〇',
        boat_img_1: '/images/dammy/photo_boat.jpg',
        phone: '0120-777-777',
        comment:
          '本文（自由入力）今日は干潮前30分から良型が集中したらしく30cmオーバー数釣でした。今日は干潮前30分から良型が集中し',
        url: '#',
      },
      {
        boat_name: '瀬渡し船ニュー大漁丸',
        port_name: '安瀬港',
        review: '★★★★☆',
        operation_names: '〇〇〇〇〇〇',
        address: '〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇',
        fishing_point: '〇〇〇〇〇〇〇〇〇',
        boat_img_1: '/images/dammy/photo_boat.jpg',
        phone: '0120-777-777',
        comment:
          '本文（自由入力）今日は干潮前30分から良型が集中したらしく30cmオーバー数釣でした。今日は干潮前30分から良型が集中し',
        url: '#',
      },
    ],
    // BUTTON,
    ROUTE,
    page: 1,
    sortKey: 'id',
    isAsc: true,
    paginationData: {},
    boatIndexData: [],
    boatIndexDataPaidMember: [],
    boatIndexDataFreeMember: [],
    boatIndexDataGeneral: [],
    prefectureDetail: {},
    cityDetail: {},
    portDetail: {},
    copy_cityParam: '',
    copy_portParam: '',
  }),

  watch: {
    prefectureParam: {
      async handler(data) {
        await this.fetchAreaDetail(data)
      },
    },
    cityParam: {
      async handler(data) {
        this.copy_cityParam = this.cityParam
        if (this.cityParam === '') this.copy_cityParam = 'all'

        await this.fetchCityShowViewer(data)
        await this.fetchBoatIndex()
      },
    },
    portParam: {
      async handler() {
        this.copy_portParam = this.portParam
        if (this.portParam === '') this.copy_portParam = 'all'

        if (this.copy_portParam !== 'all') {
          const arrayPorts = this.cityDetail.ports.filter(d => d.id === Number(this.copy_portParam))
          if (arrayPorts.length) this.portDetail = { ...arrayPorts[0] }
        }
        await this.fetchBoatIndex()
      },
    },
  },

  async created() {
    this.copy_cityParam = this.cityParam
    this.copy_portParam = this.portParam

    if (this.cityParam === '') this.copy_cityParam = 'all'
    if (this.portParam === '') this.copy_portParam = 'all'

    this.showLoader()
    await this.fetchAreaDetail(this.prefectureParam)
    await this.fetchCityShowViewer(this.copy_cityParam)
    await this.fetchBoatIndex()
    this.hideLoader()
  },

  methods: {
    /*-------------------------------------------*/
    /* 一覧取得
    /*-------------------------------------------*/
    async fetchBoatIndex() {
      const orderBy = this.isAsc ? 'asc' : 'desc'

      await boatRepository
        .viewerIndex(
          this.page,
          this.sortKey,
          orderBy,
          this.prefectureParam,
          this.copy_cityParam,
          this.copy_portParam
        )
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.paginationData = res.data
          this.boatIndexData = res.data.data
          this.boatIndexData.forEach(x => {
            if (x.created_at) x.created_at = moment(x.created_at).format('YYYY-MM-DD')
            if (x.updated_at) x.updated_at = moment(x.updated_at).format('YYYY-MM-DD')
          })
          this.boatIndexDataPaidMember = this.boatIndexData.filter(
            x => x.member_type_id === MEMBER_TYPE.PAID_MEMBER
          )
          this.boatIndexDataFreeMember = this.boatIndexData.filter(
            x => x.member_type_id === MEMBER_TYPE.FREE_MEMBER
          )
          this.boatIndexDataGeneral = this.boatIndexData.filter(
            x => x.member_type_id === MEMBER_TYPE.GENERAL
          )
        })
        .catch(() => {
          this.$toast.errorToast()
        })
    },
    /*-------------------------------------------*/
    /* 都道府県, 市町村 情報取得
    /*-------------------------------------------*/
    // 都道府県IDのpropsが渡ってきてる場合
    async fetchAreaDetail(prefectureParam) {
      if (this.prefectureParam) {
        await prefectureRepository
          .fetchPrefectureWithCityViewer(prefectureParam)
          .then(res => {
            if (res.status !== HTTP_STATUS.OK) {
              this.$toast.errorToast()
              return
            }
            this.prefectureDetail = res.data
          })
          .catch(() => {
            this.$toast.errorToast()
          })
      }
    },

    // 市町村IDのpropsが渡ってきてる場合
    async fetchCityShowViewer(cityParam) {
      if (this.copy_cityParam !== 'all') {
        await cityRepository
          .fetchCityShowViewer(cityParam)
          .then(res => {
            if (res.status !== HTTP_STATUS.OK) {
              this.$toast.errorToast()
              return
            }
            this.cityDetail = res.data

            if (this.copy_portParam !== 'all') {
              const arrayPorts = this.cityDetail.ports.filter(
                d => d.id === Number(this.copy_portParam)
              )
              if (arrayPorts.length) this.portDetail = { ...arrayPorts[0] }
            }
          })
          .catch(() => {
            this.$toast.errorToast()
          })
      }
    },
    /*-------------------------------------------*/
    /* その他
    /*-------------------------------------------*/
    onDetail(id) {
      const nLength = this.boatIndexData.length
      for (let i = 0; i < nLength; i += 1) {
        const boatData = this.boatIndexData[i]
        if (boatData.id === id) {
          window.location.href = `/boat/${boatData.prefecture_url_param}/${boatData.city_url_param}/${boatData.port_id}/${boatData.id}`
          break
        }
      }
    },
    onSearchList(cityParam, isPort) {
      if (isPort) {
        window.location.href = `/boat/${this.prefectureParam}/${
          this.copy_cityParam
        }/${cityParam.toString()}`
      } else {
        window.location.href = `/boat/${this.prefectureParam}/${cityParam}`
      }
    },
  },
}
</script>

<style lang="scss" src="@/../sass/viewer/common.scss"></style>
<style lang="scss" src="@/../sass/viewer/extra.scss"></style>
<style lang="scss" src="@/../sass/viewer/boatList.scss"></style>
