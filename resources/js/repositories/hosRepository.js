import axios from 'axios'

const resource = '/hospitals'

export default {
  /**
   * 病院一覧取得
   */
  indexWithHos(page, keyword, sortKey, orderBy) {
    return axios.get(
      `${resource}?page=${page}&keyword=${keyword}&sort_key=${sortKey}&order_by=${orderBy}`
    )
  },
  /**
   * 病院 詳細情報取得
   */
  showWithHos(id) {
    return axios.get(`${resource}/${id}`)
  },
  /**
   * 病院 登録
   */
  storeWithHos(params) {
    return axios.post(`${resource}`, params)
  },
  /**
   * 病院 更新
   */
  updateWithHos(id, params) {
    return axios.patch(`${resource}/${id}`, params)
  },
  /**
   * 病院 削除
   */
  deleteWithHos(id) {
    return axios.delete(`${resource}/${id}`)
  },
}
