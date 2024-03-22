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

<body>
    {{-- @php
        dd($status);
    @endphp --}}
    @if ($status && $data)
        <section id="confirm-password">
            <div class="container">
                <div class="text-center">
                    <h1 class="title">Xác thực mật khẩu</h1>
                    <p>Email : <strong class="text-danger">{{ $data->email }}</strong></p>
                    <p class="idea">Hãy tạo mật khẩu cho tài khoản của bạn để sử dụng dịch vụ của chúng tôi !</p>
                </div>
                <hr>
                <form action="{{ route('createPassword') }}" id="frm-comfirm-password" method="post">
                    <input type="text" name="data" id="data" value={{ $data }} hidden>
                    @csrf
                    <div class="form-floating mt-3">
                        <input type="password" class="form-control" id="password" name="password"
                            placeholder="name@example.com">
                        <label for="password">Mật khẩu</label>
                        <span class="icon-eye"><i class="fa-solid fa-eye"></i></span>
                    </div>
                    @if ($errors->any())
                        <strong class="text-danger mb-2">{{ $errors->first('password') }}</strong>
                    @endif
                    <div class="form-floating mt-3">
                        <input type="password" class="form-control" id="password_confirmation"
                            name="password_confirmation" placeholder="Password">
                        <label for="password_confirmation">Xác nhận</label>
                        <span class="icon-eye"><i class="fa-solid fa-eye"></i></span>
                    </div>
                    @if ($errors->any())
                    <strong class="text-danger">{{ $errors->first('password_confirmation') }}</strong>
                @endif
                    <div class="text-center"> <button class="btn-submit" type="submit">Xác nhận</button></div>
                </form>
            </div>
        </section>
    @elseif ($status && !$data)
        <section id="message-error">
            <div class="text-center mt-5">
                <div class="card">Tạo thành công</div>
            </div>
        </section>
    @else
        <section id="message-error">
            <div class="text-center mt-5">
                <div class="card">{{ $message }}</div>
            </div>
        </section>
    @endif
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous">
</script>

</html>
