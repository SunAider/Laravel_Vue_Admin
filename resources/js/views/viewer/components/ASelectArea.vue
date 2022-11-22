<template>
  <div>
    <div
      id="selectarea-dropdown"
      class="ex-search-dropdown"
      data-toggle="collapse"
      :data-target="'#' + id"
    >
      {{ label }}
    </div>
    <nav :id="id" class="ex-search-choice container-fluid collapse navbar-collapse">
      <ul class="ex-search-choice-items navbar-nav row">
        <li
          v-for="(area, index) in cityList"
          :key="index"
          class="ex-search-choice-item navi-item nav-item col-6"
        >
          <!-- <router-link :to="area.url" class="nav-link">{{ area.name }}</router-link> -->
          <div
            class="nav-link"
            @click="onNavItemClick('onList', isPort ? area.id : area.url_param, isPort)"
          >
            {{ isPort ? area.port_name : area.city_name }}
          </div>
        </li>
      </ul>
    </nav>
  </div>
</template>
<script>
export default {
  props: {
    label: {
      type: String,
      required: true,
      default: '',
    },
    id: {
      type: String,
      required: true,
      default: '',
    },
    cityList: {
      type: Array,
      required: true,
      default: () => {
        return []
      },
    },
    isPort: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    onNavItemClick(funcName, param, isPort) {
      this.$emit(funcName, param, isPort)
      document.getElementById('selectarea-dropdown').click()
    },
  },
}
</script>
