import axios from 'axios'

const resource = '/time'

export default {
  /**
   * 時間帯 一覧取得
   */
  indexWithTime(page, keyword, sortKey, orderBy) {
    return axios.get(
      `${resource}?page=${page}&keyword=${keyword}&sort_key=${sortKey}&order_by=${orderBy}`
    )
  },
  /**
   * 時間帯 詳細情報取得
   */
  showWithTime(id) {
    return axios.get(`${resource}/${id}`)
  },
  /**
   * 時間帯 登録
   */
  storeWithTime(params) {
    console.log('params:', params)
    return axios.post(`${resource}`, params)
  },
  /**
   * 時間帯 更新
   */
  updateWithTime(id, params) {
    return axios.patch(`${resource}/${id}`, params)
  },
  /**
   * 時間帯 削除
   */
  deleteWithTime(id) {
    return axios.delete(`${resource}/${id}`)
  },

  setAllCloseOption(state) {
    return axios.get(`/closeAllBanner?state=${state}`)
  },
  getAllCloseOption() {
    return axios.get(`/closeAllBanner`)
  },
}
