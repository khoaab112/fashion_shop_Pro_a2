<template>
  <section class="loading-text">
    <div class="loading loading04">
      <span>Đ</span>
      <span>A</span>
      <span>N</span>
      <span>G</span>
      &nbsp;
      <span>T</span>
      <span>Ả</span>
      <span>I</span>
    </div>
  </section>
</template>

<script>
export default {
  name: "loadingText",
  components: {},
  setup() {},
  directives: {},
  data() {
    return {};
  },
};
</script>

<style>
.loading {
  font-size: 25px;
  font-weight: 800;
  text-align: center;
}

.loading span {
  display: inline-block;
  margin: 0 -0.05em;
}

.loading04 span {
  animation: loading04 1.5s infinite;
}

.loading04 span:nth-child(2) {
  animation-delay: 0.1s;
}

.loading04 span:nth-child(3) {
  animation-delay: 0.2s;
}

.loading04 span:nth-child(4) {
  animation-delay: 0.3s;
}

.loading04 span:nth-child(5) {
  animation-delay: 0.4s;
}

.loading04 span:nth-child(6) {
  animation-delay: 0.5s;
}

.loading04 span:nth-child(7) {
  animation-delay: 0.6s;
}

@keyframes loading04 {
  0%,
  100% {
    transform: translateY(0);
  }

  50% {
    transform: translateY(15px);
  }
}
</style>
