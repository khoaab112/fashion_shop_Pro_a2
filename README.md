<p align="center">
<div  style="display:flex ; justify-content: center; align-items: center;">
<a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400rem" alt="Laravel Logo"></a>
<a href="https://vuejs.org/" target="_blank"><img src="https://www.svgrepo.com/show/303494/vue-9-logo.svg" width="150rem" alt="Vuejs Logo"></a>
</div>
</p>

 # fashion_shop_Pro_a2
 **It is a retail chain management system with functionalities for system administration, news publishing, and user management**

 <strong style="color:blue">The system is built using the following tools:</strong>

 <div style="display:flex ; justify-content: center; align-items: center;" >
 <a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="100rem" alt="Laravel Logo">
</a>
<a href="https://vuejs.org/" target="_blank">
<img src="https://www.svgrepo.com/show/303494/vue-9-logo.svg" width="40rem" alt="Vue Logo">
</a>
<a href="https://getbootstrap.com/" target="_blank">
<img src="https://getbootstrap.com/docs/5.3/assets/brand/bootstrap-logo.svg" width="40rem" alt="Bootstrap Logo" style="margin-left:10px">
</a>
<a href="https://antdv.com/" target="_blank">
<img src="https://next.antdv.com/assets/logo.1ef800a8.svg" width="40rem" alt="Antdv Logo" style="margin-left:10px">
</a>
<a href="https://element-plus.org/" target="_blank">
<img src="https://element-plus.org/images/element-plus-logo.svg" width="100rem" alt="Element Logo" style="margin-left:10px">
</a>
<a href="https://fontawesome.com/" target="_blank">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Font_Awesome_logomark_blue.svg/1200px-Font_Awesome_logomark_blue.svg.png" width="40rem" alt="Font Awesome Logo" style="margin-left:10px">
</a>
<a href="https://axios-http.com/" target="_blank">
<img src="https://camo.githubusercontent.com/272811d860f3fab0dd8ff0690e2ca36afbf0c96ad44100b8d42dfdce8511679b/68747470733a2f2f6178696f732d687474702e636f6d2f6173736574732f6c6f676f2e737667" width="90rem" alt="Axios Logo" style="margin-left:10px">
</a>
<a href="https://jwt.io/" target="_blank">
<img src="https://jwt.io/img/pic_logo.svg" width="50rem" alt="jwt Logo" style="margin-left:10px">
</a>
 </div>

 - **Laravel**  <span style="color:red">v10.15.0</span>

 - **Vuejs**  <span style="color:red">v3.3.4</span>

 - **Vuex**  <span style="color:red">v4.1.0</span>

 - **Vue-router**  <span style="color:red">v4.2.2</span>

 - **Bootstrap**  <span style="color:red">v5.3.0</span>

 - **Ant-design-vue**  <span style="color:red">v3.2.20</span>

 - **Element-plus**  <span style="color:red">v2.3.5</span>

 - **Fontawesome**  <span style="color:red">v6.4.0</span>(free)

 - **Axios**  <span style="color:red">v1.4.0</span>

 - **Php-jwt**  <span style="color:red">v6.0</span>

 - **Jwt-auth**  <span style="color:red">v6.0</span>

 <strong style="color:blue">Additionally, it utilizes various supporting libraries:</strong>

 - **Vue-quill**  <span style="color:red">v1.2.0</span>

 - **Mavon-editor**  <span style="color:red">v3.0.1</span>

 - **Quill-image-uploader**  <span style="color:red">v1.3.0</span>

 - **Vue-client-recaptcha**  <span style="color:red">v1.1.4</span>
 
 - **tsparticles**  <span style="color:red">v2.10.1</span>

 - **pusher**  <span style="color:red">https://dashboard.pusher.com/apps/1669732/console</span>

## # Mandatory System Requirements (to prevent errors during operation)
 ```javascript
-PostgreSQL : 15.3
-Php : 8.2.4
-Composer : 2.5.5
-Node : 18.16.0
-Npm : 9.5.1
-The database system is developed by the owner (file sql).
**And the tools as described above**
 ```
 ```javascript
For running applications locally, you can use XAMPP.
_In the php.ini file, uncomment the following section: ;extension=pdo_pgsql 
 ```
## Project Execution Steps:
```Step 1  :```
<span>
- Download the necessary requirements :PostgreSQL, php, composer, node, npm, file .sql
</span>

```Step 2  :```
- Initialize the database from file database.txt or database.sql

```Step 3  :```
- Clone the project to your computer
- create file env with the same headers and content as in the 'env.example' file.
- Modify the configuration with the database connection region (*Ensure that the requirements match the PostgreSQL configurations you have set up.*).

```Step 4  :```
- Install in the command prompt (CMD)

**Server**

```javascript
 composer install
```
	
```javascript
php artisan key:generate
 ```
	
```javascript
php artisan migrate
```
	
```javascript
php artisan db:seed
```
	
**Client**
```javascript
npm install
```

```javascript
npm install -g @vue/cli
```
	
**Run**

Client : 
```javascript
npm run dev
```
Server
```javascript
php artisan ser
```


## Login system requirements :

|            		 | `User`      | `pass`      |`url`                         |
| :----------------- | :---------- | :-----------|:-----------------------------|
| `System management`| `admin1231` | `123488888` |`{domain}/auth/login`         |
| `Customers`      	 | `client1231`| `123488888` |`{domain}/customer/auth/login`|

# The system functions 

**System management**

**User interface, news and product advertising**

# construction time and completion time
```time
Time 5/24/2023 to ? Estimated 4 months
``` 
## number of people participating in the project
 one
## Other
 ```
## open files
 - ide open with software Xmind
 - diagram  copy and paste web dbdiagram.io
  demo diagram db
 ```javascript
https://dbdiagram.io/d/647a31d2722eb774944d2b4f
```
**Idea**
<img src="Note_Project/idea.png" width="1000rem" alt="Element Logo" style="margin-left:10px">

Details :

```
fashion_shop_Pro_a2\Note_Project\IDEA_SHOP.xmind
```

# Contact
Gmail :
```javascript
nguyenvankhoark@gmail.com
```

