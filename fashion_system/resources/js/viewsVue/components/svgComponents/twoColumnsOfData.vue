<template>
    <section>
        <svg
        role="img"
        width="380"
        height="150"
        aria-labelledby="loading-aria"
        viewBox="0 0 380 150"
        preserveAspectRatio="none"
      >
        <title id="loading-aria">Loading...</title>
        <rect
          x="0"
          y="0"
          width="100%"
          height="100%"
          clip-path="url(#clip-path)"
          style='fill: url("#fill");'
        ></rect>
        <defs>
          <clipPath id="clip-path">
              <rect x="4" y="12" rx="0" ry="0" width="163" height="17" />
              <rect x="185" y="12" rx="0" ry="0" width="163" height="17" />
              <rect x="3" y="41" rx="0" ry="0" width="163" height="17" />
              <rect x="185" y="41" rx="0" ry="0" width="163" height="17" />
              <rect x="2" y="70" rx="0" ry="0" width="163" height="17" />
              <rect x="184" y="70" rx="0" ry="0" width="163" height="17" />
              <rect x="3" y="97" rx="0" ry="0" width="163" height="17" />
              <rect x="185" y="97" rx="0" ry="0" width="163" height="17" />
              <rect x="2" y="121" rx="0" ry="0" width="163" height="17" />
              <rect x="185" y="121" rx="0" ry="0" width="163" height="17" />
          </clipPath>
          <linearGradient id="fill">
            <stop
              offset="0.599964"
              stop-color="#f3f3f3"
              stop-opacity="1"
            >
              <animate
                attributeName="offset"
                values="-2; -2; 1"
                keyTimes="0; 0.25; 1"
                dur="2s"
                repeatCount="indefinite"
              ></animate>
            </stop>
            <stop
              offset="1.59996"
              stop-color="#ecebeb"
              stop-opacity="1"
            >
              <animate
                attributeName="offset"
                values="-1; -1; 2"
                keyTimes="0; 0.25; 1"
                dur="2s"
                repeatCount="indefinite"
              ></animate>
            </stop>
            <stop
              offset="2.59996"
              stop-color="#f3f3f3"
              stop-opacity="1"
            >
              <animate
                attributeName="offset"
                values="0; 0; 3"
                keyTimes="0; 0.25; 1"
                dur="2s"
                repeatCount="indefinite"
              ></animate>
            </stop>
          </linearGradient>
        </defs>
      </svg>
    </section>
</template>
<script>
export default {
  name: 'twoColumnOfData',
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
