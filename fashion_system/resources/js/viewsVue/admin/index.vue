<template>
  <div>
    <circle-menu type="top" :number="3" mask='black' btn
      colors="[ 'rgb(255, 255, 102)', '#A7425C', '#FFE26F', 'F3825F', '#F19584' ]">
      <a slot="item_1" class="fa fa-twitter fa-lg"></a>
      <a slot="item_2" class="fa fa-weixin fa-lg"></a>
      <a slot="item_3" class="fa fa-weibo fa-lg"></a>
    </circle-menu>
  </div>
</template>
  
<script>
import CircleMenu from 'vue-circle-menu';

export default {
  components: {
    CircleMenu,
  },
  methods: {
    dosomething() {
      // Xử lý khi click vào nút chính (button item_btn)
    },
    handleItemClick(itemNumber) {
      // Xử lý khi click vào các nút con (button item_1, item_2, ...)
      console.log('Clicked item:', itemNumber);
    },
  },
};
</script>
  