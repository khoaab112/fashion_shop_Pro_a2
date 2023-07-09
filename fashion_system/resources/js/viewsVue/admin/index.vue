<template>
  <div class="container">
    <ul id="menu-circle">
      <a @click="isActiveMenuCircle = !isActiveMenuCircle" class="menu-button"><font-awesome-icon icon="fa-regular fa-compass" /></a>
      <li :class="{ 'menu-item': isActiveMenuCircle }">
        <a>
          <span class="fa fa-github"> <font-awesome-icon icon="fa-brands fa-github" /></span>
        </a>
      </li>
      <li :class="{ 'menu-item': isActiveMenuCircle }">
        <a href="#menu-circle">
          <font-awesome-icon icon="fa-brands fa-github" />
        </a>
      </li>
      <li :class="{ 'menu-item': isActiveMenuCircle }">
        <a href="">
          <font-awesome-icon icon="fa-brands fa-github" />
        </a>
      </li>
      <li :class="{ 'menu-item': isActiveMenuCircle }">
        <a href="#menu-circle">
          <font-awesome-icon icon="fa-brands fa-github" />
        </a>
      </li>
    </ul>

  </div>
</template>
  
<script>

export default {
  components: {
  },
  data() {
    return {
      isActiveMenuCircle: false,
    };
  },

  mounted() {
  },
  methods: {

  },
};
</script>
<style>
#menu-circle {
  width: 150px;
  height: 150px;
  position: absolute;
  left: 50%;
  top: 50%;
  margin: -75px 0 0 -75px;
  list-style: none;
  font-size: 200%;
}

.menu-button {
  opacity: 0;
  z-index: -1;
}

.menu-button {
  width: 50px;
  height: 50px;
  position: absolute;
  left: 73%;
  top: 74%;
  margin: -75px 0 0 -75px;
  border-radius: 50%;
  background: #48a3d06e;
  background-size: 100%;
  overflow: hidden;
  text-decoration: none;
}

#menu-circle:not(:target)>a:first-of-type,
#menu-circle:target>a:last-of-type {
  opacity: 1;
  z-index: 1;
}

#menu-circle:not(:target)>.icon-plus:before,
#menu-circle:target>.icon-minus:before {
  opacity: 1;
}

.menu-item {
  width: 45px;
  height: 45px;
  position: absolute;
  left: 61%;
  line-height: 5px;
  top: 60%;
  margin: -50px 0 0 -50px;
  border-radius: 50%;
  background-color: #daebb2;
  transform: translate(0px, 0px);
  transition: transform 500ms;
  z-index: 0;
  transition: 0.5s;
}

.menu-item:hover {
  opacity: 0.5;
  box-shadow: 0 5px 10px black;
}

.menu-item a {
  color: #fff;
  position: relative;
  top: 20%;
  left: 0;
  text-decoration: none;
}

#menu-circle:not(:target)>.menu-item:nth-child(5) {
  transform: rotate(-20deg) translateY(-140px) rotate(400deg);
  transition-delay: 0s;
}

#menu-circle:not(:target)>.menu-item:nth-child(4) {
  transform: rotate(-66deg) translateY(-130px) rotate(80deg);
  transition-delay: 0.1s;
}

#menu-circle:not(:target)>.menu-item:nth-child(3) {
  transform: rotate(-112deg) translateY(-135px) rotate(120deg);
  transition-delay: 0.2s;
}

#menu-circle:not(:target)>.menu-item:nth-child(2) {
  transform: rotate(-160deg) translateY(-140px) rotate(160deg);
  transition-delay: 0.3s;
}
</style>