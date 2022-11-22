import Vue from 'vue'
import VueRouter from 'vue-router'
// import VueGtag from 'vue-gtag'

import ROUTE from '@/consts/route'

import util from '@/functions/util'
import store from '@/store'
import HTTP_STATUS from '@/consts/httpStatus'

// ADMIN
import Admin from '@/views/admin/Admin.vue'
import AdminLogin from '@/views/admin/Login.vue'
import AdminLenderList from '@/views/admin/LenderList.vue'
import AdminLenderDetail from '@/views/admin/LenderDetail.vue'
import AdminPrefectureList from '@/views/admin/PrefectureList.vue'
import AdminPrefectureDetail from '@/views/admin/PrefectureDetail.vue'
import AdminCityList from '@/views/admin/CityList.vue'
import AdminCityDetail from '@/views/admin/CityDetail.vue'
import AdminPortList from '@/views/admin/PortList.vue'
import AdminPortDetail from '@/views/admin/PortDetail.vue'

// LENDER
import Lender from '@/views/lender/Lender.vue'
import LenderLogin from '@/views/lender/Login.vue'
import LenderMyPage from '@/views/lender/MyPage.vue'
import LenderBasicInfo from '@/views/lender/BasicInfo.vue'
import LenderPostList from '@/views/lender/PostList.vue'
import LenderPostDetail from '@/views/lender/PostDetail.vue'

// Tag
import TagManage from '@/views/admin/TagManage.vue'
import TagManageDetail from '@/views/admin/TagManageDetail.vue'
import TimeManage from '@/views/admin/TimeManage.vue'
import TimeManageDetail from '@/views/admin/TimeManageDetail.vue'
import HosResult from '@/views/admin/HosResult.vue'
// ERROR
import NotFound from '@/views/error/NotFound.vue'

Vue.use(VueRouter)

const routes = [
  { path: '*', component: NotFound },
  /*-------------------------------------------*/
  /*  VIEWER
  /*-------------------------------------------*/
  {
    path: '/',
    redirect: '/admin',
  },
  /*-------------------------------------------*/
  /*  ADMIN
  /*-------------------------------------------*/
  {
    path: '/admin',
    component: Admin,
    children: [
      {
        path: '/',
        redirect: ROUTE.ADMIN.LOGIN.path,
      },
      {
        path: ROUTE.ADMIN.LOGIN.path,
        component: AdminLogin,
        name: ROUTE.ADMIN.LOGIN.name,
        meta: { loginPage: true },
      },
      // Hospital
      {
        path: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.path,
        component: TagManage,
        name: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.name,
        meta: { adminAuth: true },
      },
      {
        path: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.DETAIL.path,
        component: TagManageDetail,
        name: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.DETAIL.name,
        meta: { adminAuth: true, isNeedRegisterBtn: false },
        props: true,
      },
      {
        path: ROUTE.ADMIN.HOSPITAL.TIMEMANAGE.path,
        component: TimeManage,
        name: ROUTE.ADMIN.HOSPITAL.TIMEMANAGE.name,
        meta: { adminAuth: true },
        props: true,
      },
      {
        path: ROUTE.ADMIN.HOSPITAL.TIMEMANAGE.DETAIL.path,
        component: TimeManageDetail,
        name: ROUTE.ADMIN.HOSPITAL.TIMEMANAGE.DETAIL.name,
        meta: { adminAuth: true },
        props: true,
      },
      // Register Hospital
      {
        path: ROUTE.ADMIN.HOSPITAL.RESULT.path,
        component: HosResult,
        name: ROUTE.ADMIN.HOSPITAL.RESULT.name,
        meta: { adminAuth: true },
        props: true,
      },
      // Fish
      {
        path: ROUTE.ADMIN.LENDER.LIST.path,
        component: AdminLenderList,
        name: ROUTE.ADMIN.LENDER.LIST.name,
        meta: { adminAuth: true },
        props: true,
      },
      {
        path: ROUTE.ADMIN.LENDER.DETAIL.path,
        component: AdminLenderDetail,
        name: ROUTE.ADMIN.LENDER.DETAIL.name,
        meta: { adminAuth: true },
        props: true,
      },
      {
        path: ROUTE.ADMIN.PREFECTURE.LIST.path,
        component: AdminPrefectureList,
        name: ROUTE.ADMIN.PREFECTURE.LIST.name,
        meta: { adminAuth: true },
        props: true,
      },
      {
        path: ROUTE.ADMIN.PREFECTURE.DETAIL.path,
        component: AdminPrefectureDetail,
        name: ROUTE.ADMIN.PREFECTURE.DETAIL.name,
        meta: { adminAuth: true },
        props: true,
      },
      {
        path: ROUTE.ADMIN.CITY.LIST.path,
        component: AdminCityList,
        name: ROUTE.ADMIN.CITY.LIST.name,
        meta: { adminAuth: true },
        props: true,
      },
      {
        path: ROUTE.ADMIN.CITY.DETAIL.path,
        component: AdminCityDetail,
        name: ROUTE.ADMIN.CITY.DETAIL.name,
        meta: { adminAuth: true },
        props: true,
      },
      {
        path: ROUTE.ADMIN.PORT.LIST.path,
        component: AdminPortList,
        name: ROUTE.ADMIN.PORT.LIST.name,
        meta: { adminAuth: true },
        props: true,
      },
      {
        path: ROUTE.ADMIN.PORT.DETAIL.path,
        component: AdminPortDetail,
        name: ROUTE.ADMIN.PORT.DETAIL.name,
        meta: { adminAuth: true },
        props: true,
      },
    ],
  },
  /*-------------------------------------------*/
  /*  LENDER
  /*-------------------------------------------*/
  {
    path: '/lender',
    component: Lender,
    children: [
      // {
      //   path: '/',
      //   redirect: ROUTE.LENDER.MY_PAGE.path,
      // },
      {
        path: ROUTE.LENDER.LOGIN.path,
        component: LenderLogin,
        name: ROUTE.LENDER.LOGIN.name,
        meta: { loginPage: true },
      },
      {
        path: ROUTE.LENDER.MY_PAGE.path,
        component: LenderMyPage,
        name: ROUTE.LENDER.MY_PAGE.name,
        meta: { lenderAuth: true },
      },
      {
        path: ROUTE.LENDER.BASIC_INFO.path,
        component: LenderBasicInfo,
        name: ROUTE.LENDER.BASIC_INFO.name,
        meta: { lenderAuth: true },
      },
      {
        path: ROUTE.LENDER.POST.LIST.path,
        component: LenderPostList,
        name: ROUTE.LENDER.POST.LIST.name,
        meta: { lenderAuth: true },
      },
      {
        path: ROUTE.LENDER.POST.DETAIL.path,
        component: LenderPostDetail,
        name: ROUTE.LENDER.POST.DETAIL.name,
        meta: { lenderAuth: true },
        props: true,
      },
    ],
  },
]

const routePush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return routePush.call(this, location).catch(() => {})
}

const router = new VueRouter({
  // history: URLに#がつかない形式
  mode: 'history',
  scrollBehavior() {
    // ルートナビゲーションに対してページスクロールをトップにする
    return { x: 0, y: 0 }
  },
  base: process.env.BASE_URL,
  routes,
})

// vue.routerの機能を使用
// to:遷移しようとしているページ from:どこからきているか
// Tokenを保持していなければログイン画面へ遷移
// 権限のないページは404へ飛ばす（権限設定 meta）
router.beforeEach(async (to, from, next) => {
  const idToken = util.getCookie('access-token')
  // 管理者用ページ
  if (to.matched.some(record => record.meta.adminAuth)) {
    store.commit('userModule/SET_IS_LOGIN_PAGE', false)
    if (idToken) {
      await store
        .dispatch('userModule/fetchLoginUser')
        .then(() => {})
        .catch(async e => {
          // console.log("BB", e)
          // console.log(e.status)
          // console.log(HTTP_STATUS.UNAUTHORIZED)
          if (e.status === HTTP_STATUS.UNAUTHORIZED) {
            await store.commit('userModule/SET_ADMIN_USER', null)
            next({
              path: ROUTE.ADMIN.LOGIN.path,
            })
          }
        })
    }
    if (!idToken) {
      await store.commit('userModule/SET_ADMIN_USER', null)
      next({
        path: ROUTE.ADMIN.LOGIN.path,
      })
    }
    next()
  }
  // 貸舟業者用ページ
  if (to.matched.some(record => record.meta.lenderAuth)) {
    store.commit('userModule/SET_IS_LOGIN_PAGE', false)
    console.log('lenderAuthページ')
    if (idToken) {
      await store
        .dispatch('userModule/fetchLoginUser')
        .then(() => {})
        .catch(async e => {
          if (e.response.status === HTTP_STATUS.UNAUTHORIZED) {
            await store.commit('userModule/SET_LENDER_USER', null)
            next({
              path: ROUTE.LENDER.LOGIN.path,
            })
          }
        })
    }
    if (!idToken) {
      await store.commit('userModule/SET_LENDER_USER', null)
      next({
        path: ROUTE.LENDER.LOGIN.path,
      })
    }
    next()
  }
  // 閲覧者用ページ
  if (to.matched.some(record => record.meta.viewerAuth)) {
    store.commit('userModule/SET_IS_LOGIN_PAGE', false)
    if (!store.footerRegionList) {
      await store
        .dispatch('footerModule/fetchRegionWithPrefectureList')
        .then(() => {})
        .catch(async e => {
          console.log(e)
        })
    }
  }
  // ログインページ
  if (to.matched.some(record => record.meta.loginPage)) {
    store.commit('userModule/SET_IS_LOGIN_PAGE', true)
    if (idToken) {
      if (to.name === ROUTE.ADMIN.LOGIN.name) {
        next({
          path: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.path,
        })
      }
      if (to.name === ROUTE.LENDER.LOGIN.name) {
        next({
          path: ROUTE.LENDER.MY_PAGE.path,
        })
      }
    }
  }
  next()
})

export default router
