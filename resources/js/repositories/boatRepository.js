import axios from 'axios'

const resource = '/boats'

export default {
  /*-------------------------------------------*/
  /* ADMIN/LENDER
  /*-------------------------------------------*/
  /*-------------------------------------------*/
  /* VIEWER *認証なし
  /*-------------------------------------------*/
  viewerIndex(page, sortKey, orderBy, prefectureParam, cityParam, portId) {
    return axios.get(
      `${resource}/viewer/index?page=${page}&sort_key=${sortKey}&order_by=${orderBy}&prefecture_param=${prefectureParam}&city_param=${cityParam}&port_id=${portId}`
    )
  },
  viewerShow(id) {
    return axios.get(`${resource}/viewer/show/${id}`)
  },
}
