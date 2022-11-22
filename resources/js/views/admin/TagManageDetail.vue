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
                  id="hos_name"
                  v-model="form.hos_name"
                  :required="true"
                  label="病院名"
                  :disabled="!isNew && !isEditing"
                  placeholder="XXX病院"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`hos_name`]" class="error-message">{{
                  errors[`hos_name`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <AInputForm
                  id="tag_id"
                  v-model="form.tag_id"
                  :required="true"
                  label="病院のタグ名"
                  :disabled="!isNew && !isEditing"
                  placeholder="example-タグ名"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`tag_id`]" class="error-message">{{
                  errors[`tag_id`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <AInputForm
                  id="postNum"
                  v-model="form.postNum"
                  :required="true"
                  label="郵便番号"
                  :disabled="!isNew && !isEditing"
                  placeholder="example-郵便番号"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`postNum`]" class="error-message">{{
                  errors[`postNum`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <AInputForm
                  id="URLA"
                  v-model="form.URLA"
                  :required="true"
                  label="URL-A"
                  :disabled="!isNew && !isEditing"
                  default="sss"
                  placeholder="https://contact.fastdoctor.jp/app/home-visit/"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`URLA`]" class="error-message">{{
                  errors[`URLA`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <AInputForm
                  id="URLB"
                  v-model="form.URLB"
                  :required="true"
                  label="URL-B"
                  :disabled="!isNew && !isEditing"
                  placeholder="https://"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`URLB`]" class="error-message">{{
                  errors[`URLB`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <AInputForm
                  id="URLC"
                  v-model="form.URLC"
                  :required="true"
                  label="URL-C"
                  :disabled="!isNew && !isEditing"
                  placeholder="https://"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`URLC`]" class="error-message">{{
                  errors[`URLC`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <div class="form-outline">
                  <label data-v-40706297="" for="urlC" class="form-label">運用開始日</label>
                  <div data-v-40706297="" class="d-flex align-items-center">
                    <input
                      id="beginDate"
                      v-model="form.beginDate"
                      :required="true"
                      label="運用開始日"
                      :disabled="!isNew && !isEditing"
                      placeholder="運用開始日"
                      class="ex-input"
                      type="datetime-local"
                      style="padding:0 28px"
                    />
                  </div>                
                
                </div>
                
                <span v-if="errors && errors[`addr`]" class="error-message">{{
                  errors[`addr`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <AInputForm
                  id="addr"
                  v-model="form.addr"
                  :required="false"
                  label="住所"
                  :disabled="!isNew && !isEditing"
                  placeholder="example-住所"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`addr`]" class="error-message">{{
                  errors[`addr`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <AInputForm
                  id="tel"
                  v-model="form.tel"
                  :required="false"
                  label="電話番号"
                  :disabled="!isNew && !isEditing"
                  placeholder="example-電話番号"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`tel`]" class="error-message">{{
                  errors[`tel`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <AInputForm
                  id="checker"
                  v-model="form.checker"
                  :required="false"
                  label="担当者名"
                  :disabled="!isNew && !isEditing"
                  placeholder="example-担当者名"
                  class-name="ex-input"
                  type="text"
                />
                <span v-if="errors && errors[`checker`]" class="error-message">{{
                  errors[`checker`][0]
                }}</span>
              </div>

              <div class="main-form-element">
                <ATextArea
                  id="desp"
                  v-model="form.desp"
                  :required="false"
                  label="病院の説明"
                  height="60px"
                  :disabled="!isNew && !isEditing"
                  placeholder="病院の特徴等を記述ください"
                  class-name="ex-input"
                />
                <span v-if="errors && errors[`desp`]" class="error-message">{{
                  errors[`desp`][0]
                }}</span>
              </div>
            </div>
          </div>
        </main>
      </template>
    </MBaseDetail>
    <MDeleteModal
      :target-name="form.tag_id"
      @onCancel="onCloseModal('delete-modal')"
      @onDelete="deleteWithHos"
    />
  </div>
</template>

<script>
import { mapState } from 'vuex'

import AInputForm from '@/views/components/AInputForm.vue'
import ATextArea from '@/views/components/ATextArea.vue'
import MDeleteModal from '@/views/components/MDeleteModal.vue'
import MBaseDetail from '@/views/admin/components/MBaseDetail.vue'
import MBreadcrumb from '@/views/admin/components/MBreadcrumb.vue'

// const
import BUTTON from '@/consts/button'
import HTTP_STATUS from '@/consts/httpStatus'
import ROUTE from '@/consts/route'
import ROLE from '@/consts/role'
import TOAST from '@/consts/toast'

// repository
import { RepositoryFactory } from '@/repositories/repositoryFactory'

const hosRepository = RepositoryFactory.get('hospitals')

export default {
  components: {
    AInputForm,
    ATextArea,
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
    pageTitle: '病院の詳細',
    BUTTON,
    isNew: false,
    isEditing: false,
    form: {
      tag_id: '',
      hos_name: null,
      postNum: '',
      desp: '',
    },
    errors: {},
  }),

  computed: {
    ...mapState('userModule', ['adminUser']),
  },

  watch: {
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
          this.pageTitle = '病院 新規登録'
        }
        if (!this.isNew && this.isEditing) {
          this.pageTitle = '病院 編集'
        }
        if (!this.isNew && !this.isEditing) {
          this.pageTitle = '病院 詳細'
        }
      },
      immediate: true,
    },
  },

  async created() {
    this.setBreadcrumbData()
    if (this.isNew) return
    await this.fetchHosShow()
  },

  methods: {
    /*-------------------------------------------*/
    /* 病院詳細取得
    /*-------------------------------------------*/
    async fetchHosShow() {
      this.showLoader()
      await hosRepository
        .showWithHos(this.id)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.form = res.data
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
      if (this.isNew) {
        this.storeWithHos()
      } else {
        this.updateWithHos()
      }
    },
    // 新規登録処理
    async storeWithHos() {
      this.showLoader()

      await hosRepository
        .storeWithHos(this.form)
        .then(res => {
          if (res.status !== HTTP_STATUS.CREATED) {
            this.$toast.errorToast()
          }

          // 新規登録完了後の処理
          this.$toast.successToast(TOAST.SUCCESS.CREATED)
          this.errors = {}
          this.isEditing = false
          this.$router.push({
            name: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.name,
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
    async updateWithHos() {
      this.showLoader()

      await hosRepository
        .updateWithHos(this.id, this.form)
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
    async deleteWithHos() {
      this.showLoader()
      await hosRepository
        .deleteWithHos(this.form.id)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.$toast.successToast(TOAST.SUCCESS.DELETED)
          this.isEditing = false
          this.errors = {}
          this.$router.push({ name: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.name })
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
    /* 共通処理 管理者画面
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
        this.fetchHosShow()
      }
    },
    setBreadcrumbData() {
      this.breadcrumbData = [
        {
          title: '病院 詳細',
          link: { name: ROUTE.ADMIN.HOSPITAL.TAGMANAGE.name },
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
