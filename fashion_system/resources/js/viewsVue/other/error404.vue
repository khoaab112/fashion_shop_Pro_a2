<template>
      <section id="page_404">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 ">
                    <div class="col-sm-10 col-sm-offset-1  text-center">
                        <div class="four_zero_four_bg">
                            <h1 class="text-center ">404</h1>
                        </div>

                        <div class="contant_box_404">
                            <h3 class="h2">
                                Cỏ vẽ bạn không đúng ở đâu đó
                            </h3>
                    <p>Quay lại thôi nào !</p>

                            <router-link class="link_404" to="/">Trang chủ</router-link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- <div class="bg-test">0</div> -->
    </section>
</template>
<script>
</script>
<style>

  /* @import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@1,500&display=swap'); */

#page_404 {
    padding: 40px 0;
    background: #fff;
    font-family: "roboto-bold";
}

#page_404 img {
    width: 100%;
}

.four_zero_four_bg {
    background-image: url("../../../gif/error404.gif");
    height: 400px;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    size: 100%;
    width: auto;
}

.four_zero_four_bg h1 {
    font-size: 80px;
    font-family: "banabo";

}

.four_zero_four_bg h3 {
    font-size: 80px;
}

.link_404 {
    color: #fff!important;
    padding: 12px 25px;
    background: #39ac31;
    margin: 20px 0;
    display: inline-block;
    border-radius: 13px;
    text-decoration: none !important;
    font-size: 1rem;
}

.contant_box_404 {
    margin-top: 10px;
}

.bg-test {
    background-image: url('giphy-unscreen.gif');
    height: 400px;
    background-position: center;
    background-repeat: no-repeat;
    size: 100%;
    width: auto;
}

.contant_box_404 h3 {
    font-size: 1rem;
}

.contant_box_404 p {
    font-size: 0.7rem;
}

@media(max-width: 800px) {
    .contant_box_404 h3 {
        font-size: 0.5rem;
    }
    .contant_box_404 p {
        font-size: 0.4rem;
    }
    .link_404{
        font-size: 0.5rem;
    }
}
</style>