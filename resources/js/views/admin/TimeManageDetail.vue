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
              <ADropdown
                id="hos_id"
                v-model="form.hos_id"
                item-name="病院名"
                :options="hosIndexData"
                :required="true"
                :searchable="true"
                label-key="id"
                label="hos_name"
                :disabled="!isEditing"
              />
              <span v-if="errors && errors.hos_id" class="error-message">{{
                errors.hos_id[0]
              }}</span>
            </div>
            <div class="main-form">
              <label class="form-label">時間設定<span class="text-danger pl-2">※</span></label>
              <div class="main-form-element">
                <vue-good-table
                  :columns="columns"
                  :rows="rows"
                  :disabled="!isNew && !isEditing"
                  :ltr="true"
                  style-class="vgt-table striped bordered"
                  theme="black-rhino"
                  compact-mode
                >
                  <template slot="table-row" slot-scope="props">
                    <span v-if="props.column.field != 'time'">
                      <input
                        type="checkbox"
                        :checked="props.row[props.column.field]"
                        :disabled="!isNew && !isEditing"
                        @change="onChangChk($event.target.checked, props.index, props.column.field)"
                      />
                    </span>
                    <span v-else>
                      {{ props.formattedRow[props.column.field] }}
                    </span>
                  </template>
                </vue-good-table>
                <span v-if="errors && errors[`time`]" class="error-message">{{
                  errors[`time`][0]
                }}</span>
              </div>
            </div>
            <div></div>
          </div>
        </main>
      </template>
    </MBaseDetail>
    <MDeleteModal
      :target-name="form.tag_id"
      @onCancel="onCloseModal('delete-modal')"
      @onDelete="deleteWithTime"
    />
  </div>
</template>

<script>
import moment from 'moment'
import { mapState } from 'vuex'

import MDeleteModal from '@/views/components/MDeleteModal.vue'
import MBaseDetail from '@/views/admin/components/MBaseDetail.vue'
import MBreadcrumb from '@/views/admin/components/MBreadcrumb.vue'
import ADropdown from '@/views/components/ADropdown.vue'

// const
import BUTTON from '@/consts/button'
import HTTP_STATUS from '@/consts/httpStatus'
import ROUTE from '@/consts/route'
import ROLE from '@/consts/role'
import TOAST from '@/consts/toast'

// repository
import { RepositoryFactory } from '@/repositories/repositoryFactory'

// table
import 'vue-good-table/dist/vue-good-table.css'
import { VueGoodTable } from 'vue-good-table'

const timeRepository = RepositoryFactory.get('time')
const hosRepository = RepositoryFactory.get('hospitals')

export default {
  components: {
    ADropdown,
    MDeleteModal,
    MBaseDetail,
    MBreadcrumb,
    VueGoodTable,
  },
  props: {
    id: {
      type: null,
      required: true,
      default: null,
    },
  },

  data: () => ({
    hosIndexData: [],
    timesArray: [],
    defaultTimesArray: [],
    ROLE,
    pageTitle: '詳細情報',
    BUTTON,
    isNew: false,
    isEditing: false,
    form: {
      hos_id: null,
      time: [],
    },
    errors: {},
    columns: [
      {
        label: '時間',
        field: 'time',
        sortable: false,
      },
      {
        label: '日',
        field: 'sun',
        sortable: false,
      },
      {
        label: '月',
        field: 'mon',
        sortable: false,
      },
      {
        label: '火',
        field: 'tues',
        sortable: false,
      },
      {
        label: '水',
        field: 'wed',
        sortable: false,
      },
      {
        label: '木',
        field: 'thur',
        sortable: false,
      },
      {
        label: '金',
        field: 'fri',
        sortable: false,
      },
      {
        label: '土',
        field: 'sat',
        sortable: false,
      },
      {
        label: '祝',
        field: 'holi',
        sortable: false,
      },
    ],
    rows: [],
    checkedArr: [],
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
          this.pageTitle = '時間帯 設定'
        }
        if (!this.isNew && this.isEditing) {
          this.pageTitle = '時間帯 編集'
        }
        if (!this.isNew && !this.isEditing) {
          this.pageTitle = '時間帯 詳細'
        }
      },
      immediate: true,
    },
  },

  async created() {
    this.setBreadcrumbData()
    await this.fetchHos()
    if (this.isNew) return
    await this.fetchTimeShow()
  },
  mounted() {
    this.pushData()
  },
  methods: {
    /*-------------------------------------------*/
    /* 病院一覧取得
    /*-------------------------------------------*/
    pushData() {
      console.log('push data is called')
      for (let i = 1; i <= 24; i += 1) {
        const xxx = {
          time: i - 1,
          sun: false,
          mon: false,
          tues: false,
          wed: false,
          thur: false,
          fri: false,
          sat: false,
          holi: false,
          //   time: `${(Math.floor(i * 100) / 100).toFixed(2)}~${(i + 1).toFixed(2)}`,
        }
        this.rows.push(xxx)
      }

      //   console.log('result arr: ', arr)
    },

    async fetchHos() {
      const orderBy = this.isAsc ? 'asc' : 'desc'
      await hosRepository
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
    /*-------------------------------------------*/
    /* 時間対象税取得
    /*-------------------------------------------*/
    async fetchTimeShow() {
      this.showLoader()
      // console.log("this.id", this.id)
      await timeRepository
        .showWithTime(this.id)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.form.hos_id = res.data.hos_id
          // console.log("hos_id", this.form.hos_id)
          this.timesArray = []
          res.data.time.split(',').forEach(item => {
            this.timesArray.push(item)
          })
          this.defaultTimesArray = this.timesArray
          this.refreshChk(this.defaultTimesArray)
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
      // const arryValue = []
      console.log('Save button is clicked')
      this.form.time = this.timesArray.toString()
      // console.log(this.form)
      if (this.isNew) {
        this.storeWithTime()
      } else {
        this.updateWithTime()
      }
    },
    // 新規登録処理
    async storeWithTime() {
      this.showLoader()

      await timeRepository
        .storeWithTime(this.form)
        .then(res => {
          if (res.status !== HTTP_STATUS.CREATED) {
            this.$toast.errorToast()
          }
          this.timesArray = []
          // 新規登録完了後の処理
          this.$toast.successToast(TOAST.SUCCESS.CREATED)
          this.errors = {}
          this.isEditing = false
          this.$router.push({
            name: ROUTE.ADMIN.HOSPITAL.TIMEMANAGE.name,
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
    async updateWithTime() {
      this.showLoader()

      await timeRepository
        .updateWithTime(this.id, this.form)
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
    async deleteWithTime() {
      this.showLoader()
      await timeRepository
        .deleteWithTime(this.id)
        .then(res => {
          if (res.status !== HTTP_STATUS.OK) {
            this.$toast.errorToast()
            return
          }
          this.$toast.successToast(TOAST.SUCCESS.DELETED)
          this.isEditing = false
          this.errors = {}
          this.$router.push({ name: ROUTE.ADMIN.HOSPITAL.TIMEMANAGE.name })
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
    },
    onOpenModal(modalName) {
      this.$modal.show(modalName)
    },
    onCloseModal(modalName) {
      this.$modal.hide(modalName)
    },
    onDeleTimeItem(id) {
      this.timesArray = this.timesArray.filter((_, index) => index !== id)
    },
    // onIncreaTimeItem() {
    //   this.timesArray = this.timesArray.concat({
    //     start_time: { HH: '00', mm: '00' },
    //     end_time: { HH: '00', mm: '00' },
    //   })
    // },
    // 呼び出しメソッドが異なるため完全に共通できない。
    onCancelEdit() {
      this.isEditing = false
      this.errors = {}
      if (this.isNew) {
        this.form = {}
      } else {
        this.fetchTimeShow()
      }
    },
    setBreadcrumbData() {
      this.breadcrumbData = [
        {
          title: '病院の時間帯管理',
          link: { name: ROUTE.ADMIN.HOSPITAL.TIMEMANAGE.name },
        },
        {
          title: this.pageTitle,
          link: '',
        },
      ]
    },
    onCellClick(params) {
      // params.row - row object
      // params.column - column object
      // params.rowIndex - index of this row on the current page.
      // params.event - click event
      // console.log('cell is clicked', params)
      console.log('cell is clicked', params.rowIndex + 1, params.column.field)
    },
    // check(e) {
    //   console.log(e.target.parent.parent.parent.props.rowIndex)
    // },
    onChangChk(e, rowIndex, columnField) {
      if (rowIndex < 10) rowIndex = `0${rowIndex}`
      const temp = `${columnField}-${rowIndex}`
      if (e === true) {
        this.timesArray.push(temp)
      } else {
        this.timesArray.splice(this.timesArray.indexOf(temp), 1)
      }
    },

    refreshChk(timesArray) {
      console.log('refresh check is called')
      // console.log(timesArray)
      for (let i = 0; i <= timesArray.length - 1; i += 1) {
        const temp = timesArray[i].split('-')
        if (temp[1] < 10) temp[1] %= 10
        this.rows[temp[1]][temp[0]] = true
      }
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
.incre-icon {
  cursor: pointer;
}
.incre-icon:hover {
  color: rgb(34, 143, 143);
  cursor: pointer;
}
</style>
