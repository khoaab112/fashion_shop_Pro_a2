<template>
   <div class="row">
      <div class="col-md-3 col-sm-3">
         <div id="sidebar-admin">
            <router-view name="sidebar" />
         </div>
      </div>      
      <div class="col-md-9 col-sm-9 admin-right">
         <header id="header">
            <router-view name="header" />
         </header>
         <div>
            <router-view>
            </router-view>
         </div>
         <footer id="footer">
            <router-view name="footer" />
         </footer>
      </div>
   </div>
</template>
<script>
</script>
<style >
.admin-right {
   background-color: #dddddd;
}
#header{
   background-color: white;
    width: 98%;
    height: 4rem;
    margin-top: 13px;
    margin-left: 8px;
    border-radius: 9px;
}
</style>