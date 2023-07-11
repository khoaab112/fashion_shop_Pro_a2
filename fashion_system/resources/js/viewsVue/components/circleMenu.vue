<template>
  <ul id="menu-circle">
    <a @click="isActiveMenuCircle = !isActiveMenuCircle" class="menu-button"><span><font-awesome-icon
          icon="fa-regular fa-compass" /></span></a>
    <li :style="isActiveMenuCircle ? value.style : ''" class="menu-item" v-for="value in circleMenuComPonents"
      :key="value.key">
      <a v-if="isActiveMenuCircle">
        <span class="icon-menu-circle" :style="value.styleIcons"> <font-awesome-icon :icon="value.icon" /></span>
      </a>
    </li>
  </ul>
</template>
    
<script>
export default {
  name: "circleMenu",
  components: {
  },
  props: ['circleMenu'],
  data() {
    return {
      isActiveMenuCircle: false,
      circleMenuComPonents: this.circleMenu,
      coordinatesMax: -160,
      coordinatesMin: -20,
      practicalCoordinates: 140,
      delay: 0,
    };
  },
  created() {
    this.addStyleToTagLi(this.circleMenuComPonents);

  },
  mounted() {

  },
  computed: {
  },
  methods: {
    addStyleToTagLi(valueCircleMenu) {
      const divisor = (this.practicalCoordinates / (valueCircleMenu.length - 1)).toFixed(1);
      let temporaryCoorDinates = 0;
      valueCircleMenu.forEach(
        (element, key) => {
          temporaryCoorDinates += Number(!key ? this.coordinatesMin : -divisor);
          this.delay += 0.1;
          element.style = {
            'transform': 'rotate(' + (Number(temporaryCoorDinates)) + 'deg) translateY(-140px) rotate(160deg)',
            'transition-delay': this.delay + 's',
          },
            element.styleIcons = {
              'transform': 'rotate(' + Number(this.coordinatesMax - Number(temporaryCoorDinates)) + 'deg)',
            }
        }
      );

    }
  },
};
</script>
<style>
#menu-circle {
  width: 150px;
  height: 150px;
  position: absolute;
  right: -19px;
  top: 80%;
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
  background: #d9d9d9;
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
  left: 57%;
  line-height: 5px;
  top: 59%;
  margin: -50px 0 0 -50px;
  border-radius: 50%;
  /* background-color: #f8f9fa; */
  background-color: #00000073;
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
  position: relative;
  top: 17%;
  left: 7px;
  text-decoration: none;
}

.menu-button span {
  color: #40a9ff;
}

.menu-button span {
  position: relative;
  top: 2%;
  left: 8px;
}

.icon-menu-circle {
  position: absolute;

}
</style>