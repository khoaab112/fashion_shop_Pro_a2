<!DOCTYPE html>
<html>

<head>
    <title>Xác thực mật khẩu</title>
    <link type="text/css" rel="stylesheet" href="{{ asset('css/confirm_password.css') }}" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
</head>

<body id="reissue-password">
    <section id="confirm-password">
        <div class="container">
            <div class="text-center">
                <h1 class="title">Thay đổi mật khẩu</h1>
                <p>Email : <strong>example@gmail.com</strong></p>
                <p class="idea">Chúng tôi nhận được yêu cầu cấp lại mật khẩu <br>Nếu không phải bạn hãy bỏ qua hoặc thay đổi lại thông tin truy cấp nếu cần thiết !</p>
            </div>
            <hr>
            <form action="{{ route('createPassword') }}" id="frm-comfirm-password" method="post">
                {{-- <input type="text" name="data" id="data" value={{ $data }} hidden> --}}
                @csrf
                <div class="form-floating mt-3">
                    <input type="password" class="form-control" id="password" name="password"
                        placeholder="name@example.com">
                    <label for="password">Mật khẩu</label>
                    <span class="password icon-eye on" onclick="clickIcon(event,'password')"><i
                            class="fa-solid fa-eye"></i></span>
                    <span class="password icon-eye off none-icon" onclick="clickIcon(event,'password')"><i
                            class="fa-regular fa-eye-slash"></i></i></span>
                </div>
                @if ($errors->any())
                    <strong class="text-danger mb-2">{{ $errors->first('password') }}</strong>
                @endif
                <div class="form-floating mt-3">
                    <input type="password" class="form-control" id="password_confirmation"
                        name="password_confirmation" placeholder="Password">
                    <label for="password_confirmation">Xác nhận</label>
                    <span class="confirmation icon-eye on" onclick="clickIcon(event,'confirmation')"><i
                            class="fa-solid fa-eye"></i></span>
                    <span class="confirmation icon-eye off none-icon" onclick="clickIcon(event,'confirmation')"><i
                            class="fa-regular fa-eye-slash"></i></i></span>
                </div>
                @if ($errors->any())
                    <strong class="text-danger">{{ $errors->first('password_confirmation') }}</strong>
                @endif
                <div class="text-center"> <button class="btn-submit" type="submit">Xác nhận</button></div>
            </form>
        </div>
    </section>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous">
</script>
<script>
    function clickIcon(event, key) {
        var clickedElement = event.currentTarget;
        var hasOnClass = clickedElement.classList.contains('on');
        var spanOn , spanOff;
        var elPassword = document.getElementById("password");
        var elConfirm = document.getElementById("password_confirmation");
        switch (key) {
            case 'password':
                 spanOn = document.querySelector('.password.icon-eye.on');
                 spanOff = document.querySelector('.password.icon-eye.off');
                if (hasOnClass) {
                    spanOn.classList.add('none-icon');
                    spanOff.classList.remove('none-icon');
                    elPassword.type="text";
                } else {
                    spanOn.classList.remove('none-icon');
                    spanOff.classList.add('none-icon');
                    elPassword.type="password";
                }
                break;
            case 'confirmation':
                 spanOn = document.querySelector('.confirmation.icon-eye.on');
                 spanOff = document.querySelector('.confirmation.icon-eye.off');
                if (hasOnClass) {
                    spanOn.classList.add('none-icon');
                    spanOff.classList.remove('none-icon');
                    elConfirm.type="text";
                } else {
                    spanOn.classList.remove('none-icon');
                    spanOff.classList.add('none-icon');
                    elConfirm.type="password";
                }
                break;
        }
    };
    const submit =() => {
       var bg = document.querySelector('#reissue-password');
       bg.classList.add('add-su');
    };
</script>

</html>
