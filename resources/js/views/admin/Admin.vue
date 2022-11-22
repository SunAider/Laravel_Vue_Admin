<template>
  <!-- !collapsed: サイドメニューが開いてる -->
  <!-- collapsed: サイドメニューが開いてない -->
  <div
    :class="[{ collapsed: !collapsed }]"
    :style="
      !collapsed
        ? 'padding-left: 350px;'
        : collapsed && !isLoginPage
        ? 'padding-left: 50px;'
        : 'padding-left: 0px'
    "
  >
    <!-- パス取得方法念のためにおいておく -->
    <!-- {{ thisPage }}/{{ this.$route.fullPath }} -->
    <sidebar-menu
      v-if="isAdminLogin"
      :menu="userRole==1?menu:submenu"
      :collapsed="collapsed"
      :show-one-child="true"
      @toggle-collapse="onToggleCollapse"
    />
    <ONavbar v-if="isAdminLogin" />

    <RouterView />
  </div>
</template>

<script>
import { mapGetters, mapActions, mapState } from 'vuex'

import { SidebarMenu } from 'vue-sidebar-menu'

import ONavbar from '@/views/admin/components/ONavbar.vue'

import ROUTE from '@/consts/route'
import ROLE from '@/consts/role'

export default {
  components: {
    SidebarMenu,
    ONavbar,
  },

  data: () => ({
    ROLE,
    ROUTE,
    collapsed: true,
    thisPage: null,
    menu: [
      {
        header: true,
        title: 'メインメニュー',
        hiddenOnCollapse: true,
      },
      {
        href: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.path,
        title: '病院 詳細',
        icon: 'fa fa-hospital',
      },
      {
        href: ROUTE.ADMIN.HOSPITAL.TIMEMANAGE.path,
        title: '病院の時間帯管理',
        icon: 'fa fa-globe-asia',
      },
      {
        href: ROUTE.ADMIN.HOSPITAL.RESULT.path,
        title: '成果確認',
        icon: 'fa fa-archway',
      },
      {
        href: ROUTE.ADMIN.LENDER.LIST.path,
        title: 'ユーザー一覧',
        icon: 'fa fa-user',
      },
    ],
    submenu: [
      {
        header: true,
        title: 'メインメニュー',
        hiddenOnCollapse: true,
      },
      {
        href: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.path,
        title: '病院 詳細',
        icon: 'fa fa-hospital',
      },
      {
        href: ROUTE.ADMIN.HOSPITAL.TIMEMANAGE.path,
        title: '病院の時間帯管理',
        icon: 'fa fa-globe-asia',
      },
      {
        href: ROUTE.ADMIN.HOSPITAL.RESULT.path,
        title: '成果確認',
        icon: 'fa fa-archway',
      },
      // {
      //   href: ROUTE.ADMIN.LENDER.LIST.path,
      //   title: 'ユーザー一覧',
      //   icon: 'fa fa-user',
      // },
    ],
  }),

  computed: {
    ...mapGetters('userModule', ['isLogin', 'isAdminLogin']),
    ...mapState('userModule', ['isLoginPage', 'userRole']),
  },

  methods: {
    ...mapActions('userModule', ['adminLogout']),

    onToggleCollapse(collapsed) {
      this.collapsed = collapsed
    },
    
  },
}
</script>
<style lang="scss" src="@/../sass/lender/extra.scss"></style>
<style lang="scss" src="@/../sass/lender/basicInfo.scss"></style>
<style lang="scss" src="@/../sass/lender/post.scss"></style>
<style lang="scss" src="@/../sass/lender/mypage.scss"></style>
<style lang="scss" src="@/../sass/lender/common.scss"></style>
