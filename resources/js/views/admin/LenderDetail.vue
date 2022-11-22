<template>
  <div>
    <MBaseDetail
      :title="pageTitle"
      :is-editing="isEditing"
      :is-new="isNew"
      :is-display-back-btn="false"
      :is-display-delete-btn="true"
      :is-display-change-password-btn="false"
      @onEdit="onEdit"
      @onSave="onSave"
      @onBackList="onBackList"
      @onCancel="onCancelEdit"
      @onDelete="onOpenModal('delete-modal')"
    >
      <template #breadcrumb>
        <MBreadcrumb :breadcrumb-data="breadcrumbData"></MBreadcrumb>
      </template>

      <template #content>
        <main id="Wrapper" class="lender basic">
          <div class="main lender-inner">
            <div class="main-form">
              <div class="main-form-element">
                <AInputForm
                  id="email"
                  v-model="form.user.email"
                  :required="true"
                  label="メールアドレス"
                  :disabled="!isNew && !isEditing"
                  placeholder="example@example.com"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`user.email`]" class="error-message">{{
                  errors[`user.email`][0]
                }}</span>
              </div>

              <div v-if="isNew" class="main-form-element">
                <AInputForm
                  id="password"
                  v-model="form.user.password"
                  :required="true"
                  label="パスワード"
                  :disabled="!isNew && !isEditing"
                  placeholder="example1234"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`user.password`]" class="error-message">{{
                  errors[`user.password`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <AInputForm
                  id="name"
                  v-model="form.user.name"
                  :required="true"
                  label="ユーザー名"
                  :disabled="!isNew && !isEditing"
                  placeholder="山田太郎"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`user.name`]" class="error-message">{{
                  errors[`user.name`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <AInputForm
                  id="name"
                  v-model="form.user.name_kana"
                  :required="true"
                  label="ユーザー名（ふりがな）"
                  :disabled="!isNew && !isEditing"
                  placeholder="やまだたろう"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`user.name_kana`]" class="error-message">{{
                  errors[`user.name_kana`][0]
                }}</span>
              </div>

                            

              <div v-if="!isNew" class="main-form-element ex-separate">
                <div>パスワード変更</div>
                <div class="ex-">
                  <AButton
                    label="パスワードを変更する"
                    :disabled="!isNew && !isEditing"
                    class-name="ex-button ex-confirm"
                    @onClick="onOpenChangePasswordModal"
                  />
                </div>
              </div>

            </div>
          </div>
        </main>
        <MPasswordChangeModal
          :password-valid-error-message="passwordValidErrorMessage"
          @onCancel="onChangePasswordCancel"
          @onChange="onChangePassword"
        />
      </template>
    </MBaseDetail>
    <MDeleteModal
      :target-name="form.name"
      @onCancel="onCloseModal('delete-modal')"
      @onDelete="deleteLender"
    />
  </div>
</template>

<script>
import { mapState } from 'vuex'

// component
import AButton from '@/views/components/AButton.vue'
import ADropdown from '@/views/components/ADropdown.vue'
import AInputForm from '@/views/components/AInputForm.vue'
import AFileUpImages from '@/views/components/AFileUpImages.vue'
import ATextArea from '@/views/components/ATextArea.vue'
import ACheckBox from '@/views/components/ACheckBox.vue'
import MCollapse from '@/views/components/MCollapse.vue'
import MPasswordChangeModal from '@/views/components/MPasswordChangeModal.vue'
import MDeleteModal from '@/views/components/MDeleteModal.vue'
import MBaseDetail from '@/views/admin/components/MBaseDetail.vue'
import MBreadcrumb from '@/views/admin/components/MBreadcrumb.vue'

// const
import BUTTON from '@/consts/button'
import HTTP_STATUS from '@/consts/httpStatus'
import ROUTE from '@/consts/route'
import ROLE from '@/consts/role'
import SEASON from '@/consts/season'
import TOAST from '@/consts/toast'

// repository
import { RepositoryFactory } from '@/repositories/repositoryFactory'

// const boatRepository = RepositoryFactory.get('boats')
const facilityRepository = RepositoryFactory.get('facilities')
const fishingOptionRepository = RepositoryFactory.get('fishingOptions')
const lenderRepository = RepositoryFactory.get('lenders')
const memberTypeRepository = RepositoryFactory.get('memberTypes')
const operationRepository = RepositoryFactory.get('operations')
const paymentOptionRepository = RepositoryFactory.get('paymentOptions')
const prefectureRepository = RepositoryFactory.get('prefectures')
const targetRepository = RepositoryFactory.get('targets')
const userRepository = RepositoryFactory.get('users')

export default {
  components: {
    AButton,
    ADropdown,
    AInputForm,
    AFileUpImages,
    ATextArea,
    ACheckBox,
    MCollapse,
    MPasswordChangeModal,
    MDeleteModal,
    MBaseDetail,
    MBreadcrumb,
  },
  props: {
    id: {
      type: null,
      required: true,
      default: null,
    },
  },

  data: () => ({
    ROLE,
    pageTitle: 'ユーザー 詳細',
    memberTypeList: [],
    /*
    /* 以下Basic infoと共通
    */
    BUTTON,
    isNew: false,
    isEditing: false,
    form: {
      user: {},
      phone: '',
    },   
    
    errors: {},
    passwordValidErrorMessage: '',
  }),

  // ＊BasicInfoと共通
  computed: {
    ...mapState('userModule', ['adminUser']),
  },

  watch: {
   
    // * 共通処理 管理者画面 ＊BasicInfoと共通ではない
    $route: {
      async handler() {
        this.isNew = this.id === 'new'
        if (this.isNew) this.isEditing = true
      },
      immediate: true,
    },
    isEditing: {
      async handler() {
        if (this.isNew && this.isEditing) {
          this.pageTitle = 'ユーザー 新規登録'
          this.setBreadcrumbData()
        }
        if (!this.isNew && this.isEditing) {
          this.pageTitle = 'ユーザー 編集'
          this.setBreadcrumbData()
        }
        if (!this.isNew && !this.isEditing) {
          this.pageTitle = 'ユーザー 詳細'
          this.setBreadcrumbData()
        }
      },
      immediate: true,
    },
  },

  async created() {
    // this.showLoader()
    this.setBreadcrumbData()   
    if (this.id !== 'new')  await this.fetchAdminDetail() 
  },

  methods: {
    /*-------------------------------------------*/
    /* 詳細取得処理 管理者画面
    /*-------------------------------------------*/
    async fetchAdminDetail() {
      this.showLoader()
      console.log("BBBBB", this.id)
      await lenderRepository
        .show(this.id)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.form.user = res.data
          console.log("BBBBB res", res.data)
          // 画像を画像リストへ格納
          // 船の画像
          
        })
        .catch(async err => {
          if (err.response) {
            await this.$errHandling.adminCatch(err.response.status)
            return
          }
          this.$toast.errorToast()
        })

      this.hideLoader()
    },
    /*-------------------------------------------*/
    /* 新規登録・更新処理 管理者画面
    /*-------------------------------------------*/
    onSave() {
      this.form.updated_user_id = this.adminUser.id

      this.showLoader()
      if (this.isNew) {
        this.form.user.role_id = ROLE.TYPE.subADMIN
        this.form.created_user_id = this.adminUser.id
        this.storeLenderWithRelatedData()
      } else {
        this.form.updated_user_id = this.adminUser.id
        this.form.boat_delete_image_list = this.boatDeleteImageList
        this.form.permission_delete_image_list = this.permissionDeleteImageList
        this.updateLenderWithRelatedData()
      }
    },
    // 新規登録処理
    async storeLenderWithRelatedData() {
      this.showLoader()

      console.log('保存直前a', this.form)

      lenderRepository
        .store(this.form)
        .then(res => {
          if (res.status !== HTTP_STATUS.CREATED) {
            this.$toast.errorToast()
          }

          // 新規登録完了後の処理
          this.$toast.successToast(TOAST.SUCCESS.CREATED)
          this.errors = {}
          this.isEditing = false
          this.$router.push({
            name: ROUTE.ADMIN.LENDER.LIST.name,
          })
        })
        .catch(async err => {
          if (err.response) {
            await this.$errHandling.adminCatch(err.response.status)
            this.errors = err.response.data.errors
            return
          }
          this.errors = err.response.data.errors
          this.$toast.errorToast()
        })
      this.hideLoader()
    },

    // 更新処理
    async updateLenderWithRelatedData() {
      this.showLoader()
      console.log("before update", this.id)
      // const sendData = {"user.email":this.form.email, "user.name": this.form.name, "user.name_kana": this.form.name_kana, "role_id": this.form.role_id}
      lenderRepository
        .update(this.id, this.form)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          // 更新完了後の処理
          this.$toast.successToast(TOAST.SUCCESS.UPDATED)
          this.errors = {}
          this.isEditing = false
        })
        .catch(async err => {
          if (err.response) {
            await this.$errHandling.adminCatch(err.response.status)
            this.errors = err.response.data.errors
            return
          }
          this.$toast.errorToast()
          this.errors = err.response.data.errors
        })
      this.hideLoader()
    },
    /*-------------------------------------------*/
    /* 削除登録・更新処理 管理者画面
    /*-------------------------------------------*/
    async deleteLender() {
      this.showLoader()
      await lenderRepository
        .delete(this.form.id)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.$toast.successToast(TOAST.SUCCESS.DELETED)
          this.isEditing = false
          this.errors = {}
          this.$router.push({ name: ROUTE.ADMIN.LENDER.LIST.name })
        })
        .catch(async err => {
          if (err.response) {
            await this.$errHandling.adminCatch(err.response.status)
            return
          }
          this.$toast.errorToast()
        })
      this.hideLoader()
    },
    /*-------------------------------------------*/
    /* モーダル
    /*-------------------------------------------*/
    onOpenChangePasswordModal() {
      this.$modal.show('password-change-modal')
    },
    onChangePasswordCancel() {
      this.$modal.hide('password-change-modal')
    },
    /*-------------------------------------------*/
    /* パスワード更新
    /*-------------------------------------------*/
    async onChangePassword(password) {
      this.showLoader()
      console.log("onchangePWD", this.form.user)
      await userRepository
        .changePassword(this.form.user.id, password)
        .then(res => {
          if (res.status !== HTTP_STATUS.NO_CONTENT) {
            this.$toast.errorToast()
            return
          }

          this.$modal.hide('password-change-modal')
          this.$toast.successToast(TOAST.SUCCESS.UPDATED_PASSWORD)
        })
        .catch(async err => {
          await this.$errHandling.lenderCatch(err.response.status)
          this.$toast.errorToast()
        })

      this.hideLoader()
    },
    /*-------------------------------------------*/
    /* 画像処理
    /*-------------------------------------------*/
  

    onEdit() {
      this.isEditing = true
    },
    onBackList() {
      this.$router.back()
      // this.$router.go(-1)
    },
    onOpenModal(modalName) {
      this.$modal.show(modalName)
    },
    onCloseModal(modalName) {
      this.$modal.hide(modalName)
    },
    // 呼び出しメソッドが異なるため完全に共通できない。
    onCancelEdit() {
      this.isEditing = false
      this.errors = {}
      if (this.isNew) {
        this.form = {}
      } else {
        this.fetchLenderWithBoatDetail()
      }
    },
    setBreadcrumbData() {
      this.breadcrumbData = [
        {
          title: 'ユーザー 一覧',
          link: { name: ROUTE.ADMIN.LENDER.LIST.name },
        },
        {
          title: this.pageTitle,
          link: '',
        },
      ]
    },
  },
}
</script>
<style lang="scss" scoped>
.title {
  font-size: 20px;
  font-weight: bolder;
  width: 100%;
  border-bottom: 3px solid $Main;
}
</style>
