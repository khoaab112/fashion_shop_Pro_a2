<!-- <template>
Home
<div class="card">
  <div class="card-body">
    This is some text within a card body.
  </div>
</div>
</template> -->
<template>
  <div>
    <div>
      <a-radio-group v-model:value="value1">
        <a-radio-button value="a">Hangzhou</a-radio-button>
        <a-radio-button value="b">Shanghai</a-radio-button>
        <a-radio-button value="c">Beijing</a-radio-button>
        <a-radio-button value="d">Chengdu</a-radio-button>
      </a-radio-group>
    </div>
    <div :style="{ marginTop: '16px' }">
      <a-radio-group v-model:value="value2">
        <a-radio-button value="a">Hangzhou</a-radio-button>
        <a-radio-button value="b" disabled>Shanghai</a-radio-button>
        <a-radio-button value="c">Beijing</a-radio-button>
        <a-radio-button value="d">Chengdu</a-radio-button>
      </a-radio-group>
    </div>
    <div :style="{ marginTop: '16px' }">
      <a-radio-group v-model:value="value3" disabled>
        <a-radio-button value="a">Hangzhou</a-radio-button>
        <a-radio-button value="b">Shanghai</a-radio-button>
        <a-radio-button value="c">Beijing</a-radio-button>
        <a-radio-button value="d">Chengdu</a-radio-button>
      </a-radio-group>
    </div>
  </div>
</template>
<script>
import { defineComponent, ref } from 'vue';
export default defineComponent({
  setup() {
    const value1 = ref('a');
    const value2 = ref('a');
    const value3 = ref('a');
    return {
      value1,
      value2,
      value3,
    };
  },
});
</script>