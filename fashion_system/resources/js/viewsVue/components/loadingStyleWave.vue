<template>
  <section class="loading-wave">
    <div class="loading-bar"></div>
    <div class="loading-bar"></div>
    <div class="loading-bar"></div>
    <div class="loading-bar"></div>
  </section>
</template>
    
<script>
export default {
  name: 'loadingWave',
  components: {
  },
  setup() {
  },
  directives: {
  },
  data() {
    return {
    };
  },
};
</script>
    
<style>

.loading-wave {
    /* width: 300px; */
    height: 100px;
    display: flex;
    justify-content: center;
    align-items: flex-end;
  }
  
  .loading-bar {
    width: 20px;
    height: 10px;
    margin: 0 5px;
    /* background-color: #3498db; */
    background: linear-gradient(-135deg, #50c86f, #4158d0);
    border-radius: 5px;
    animation: loading-wave-animation 1s ease-in-out infinite;
  }
  
  .loading-bar:nth-child(2) {
    animation-delay: 0.1s;
  }
  
  .loading-bar:nth-child(3) {
    animation-delay: 0.2s;
  }
  
  .loading-bar:nth-child(4) {
    animation-delay: 0.3s;
  }
  
  @keyframes loading-wave-animation {
    0% {
      height: 10px;
    }
  
    50% {
      height: 50px;
    }
  
    100% {
      height: 10px;
    }
  }
  </style>