<template>
  <div class="permission_denied">
    <div id="tsparticles"></div>
    <div class="denied__wrapper">
      <h1>404</h1>
      <h3>OH....Cỏ vẻ thứ bạn tìm nó không có ở đây rồi</h3>
      <p class="text-center">😵‍💫😵‍💫😵‍💫</p>
      <img class="astronaut" :src="getImage(imgAstronaut)" />
      <img class="astronaut clone-astronaut" :src="getImage(imgAstronaut)" />
      <img id="planet" :src="getImage(imgPlanet)" />
      <a href="#"><button class="denied__link"><router-link class="link_404" :to=pathHome>HOME</router-link></button></a>
    </div>
  </div>
</template>
    
<script>
import astronaut from '@/public/images/svg/page_404/astronaut.svg';
import planet from '@/public/images/svg/page_404/planet.svg';
import { loadFull } from "tsparticles";
import paths from '@/js/mixins/getAddressFromRouter.js';

export default {
  name: 'page404',
  components: {
  },
  setup() {
  },
  directives: {
  },
  data() {
    return {
      imgAstronaut: astronaut,
      imgPlanet: planet,
      pathHome: paths.homeClient,      
    };
  },
  created() {
    // Logic khi component được khởi tạo
  },
  mounted() {
    try {
      var particles = {
        fpsLimit: 60,
        particles: {
          number: {
            value: 160,
            density: {
              enable: true,
              area: 800
            }
          },
          color: {
            value: "#ffffff"
          },
          shape: {
            type: "circle"
          },
          opacity: {
            value: 1,
            random: {
              enable: true,
              minimumValue: 0.1
            },
            animation: {
              enable: true,
              speed: 1,
              minimumValue: 0,
              sync: false
            }
          },
          size: {
            value: 3,
            random: {
              enable: true,
              minimumValue: 1
            }
          },
          move: {
            enable: true,
            speed: 0.17,
            direction: "none",
            random: true,
            straight: false,
            outModes: {
              default: "out"
            },
          }
        },
        interactivity: {
          detectsOn: "canvas",
          events: {
            resize: false
          }
        },
        detectRetina: true
      };
      loadFull(tsParticles);
      tsParticles.load("tsparticles", particles);
    } catch (error) {
      console.log(error);
    }
  },
  computed() {
  },
  updated() {

  },
  destroyed() {

  },
  methods: {
    getImage(path) {
      return new URL(path, import.meta.url).href
    },
  },
};
</script>
    
<style >
.particle-error,
.permission_denied,
#tsparticles {
  width: 100%;
  height: 100%;
  margin: 0px !important;
}

#tsparticles {
  position: fixed !important;
  opacity: 0.23;
}

.permission_denied {
  font-family: "banabo" !important;
  /* background: #24344c !important; */
}

.permission_denied a {
  text-decoration: none;
}

.denied__wrapper {
  font-family: "banabo";
  max-width: 390px;
  width: 100%;
  height: 390px;
  display: block;
  margin: 0 auto;
  position: relative;
  margin-top: 8vh;
}

.denied__wrapper p {
  font-size: 2.5rem !important;
}

.permission_denied h1 {
  text-align: center;
  color: #fff;
  font-size: 100px;
  margin-bottom: 0px;
  font-weight: 800;
}

.permission_denied h3 {
  text-align: center;
  color: #fff;
  /* font-size: 19px;
  line-height: 23px;
  max-width: 330px;
  margin: 0px auto 30px auto;
  font-weight: 400; */
}

.permission_denied h3 span {
  position: relative;
  width: 65px;
  display: inline-block;
}

.permission_denied h3 span:after {
  content: "";
  border-bottom: 3px solid #ffbb39;
  position: absolute;
  left: 0;
  top: 43%;
  width: 100%;
}

.denied__link {
  background: none;
  color: #fff;
  padding: 12px 0px 10px 0px;
  border: 1px solid #fff;
  outline: none;
  border-radius: 7px;
  width: 150px;
  font-size: 15px;
  text-align: center;
  margin: 0 auto;
  vertical-align: middle;
  display: block;
  margin-bottom: 40px;
  margin-top: 25px;
  font-weight: 400;
}

.denied__link:hover {
  color: #ffbb39;
  border-color: #ffbb39;
  cursor: pointer;
  opacity: 1;
}

.permission_denied .stars {
  animation: sparkle 1.6s infinite ease-in-out alternate;
}

.clone-astronaut {
  left: 0rem;
  margin-top: 9rem;
  animation: spin 5.5s infinite ease-in-out !important;
}

body {
  background-color: var(--page-404-color);
}

@keyframes sparkle {
  0% {
    opacity: 1;
  }

  100% {
    opacity: 0.3;
  }
}

.astronaut {
  width: 60px;
  position: absolute;
  right: 20px;
  top: 210px;
  animation: spin 4.5s infinite linear;
}

@keyframes spin {
  0% {
    transform: rotateZ(0deg);
  }

  100% {
    transform: rotateZ(360deg);
  }
}

@media (max-width: 600px) {
  .permission_denied h1 {
    font-size: 75px;
  }

  .permission_denied h3 {
    font-size: 16px;
    width: 200px;
    margin: 0 auto;
    line-height: 23px;
  }

  .permission_denied h3 span {
    width: 60px;
  }

  .astronaut {
    width: 35px;
    right: 40px;
    top: 170px;
  }
}

.saturn,
.saturn-2,
.hover {
  animation: hover 2s infinite ease-in-out alternate;
}

a.link_404 {
  color: burlywood;
}

@keyframes hover {
  0% {
    transform: translateY(3px);
  }

  100% {
    transform: translateY(-3px);
  }
}</style>