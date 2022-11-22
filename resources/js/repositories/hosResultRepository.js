import axios from 'axios'

const resource = '/hosresults'

export default {
  /**
   * 病院一覧取得
   */
  indexWithHosResult(page, startTime, endTime, sortKey, orderBy) {
    return axios.get(
      `${resource}?page=${page}&startTime=${startTime}&endTime=${endTime}&sort_key=${sortKey}&order_by=${orderBy}`
    )
  },
}
