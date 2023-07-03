<template>
    <div>
      <circle-menu type="middle-around" :number="4">
        <!-- Các nút con -->
        <button type="button" slot="item_btn" @click="dosomething"></button>
        <button type="button" slot="item_1" @click="handleItemClick(1)"></button>
        <button type="button" slot="item_2" @click="handleItemClick(2)"></button>
        <button type="button" slot="item_3" @click="handleItemClick(3)"></button>
        <button type="button" slot="item_4" @click="handleItemClick(4)"></button>
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
  