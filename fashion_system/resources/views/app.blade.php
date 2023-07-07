<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    {{-- <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, user-scalable=no"> --}}

    {{-- <meta http-equiv="X-UA-Compatible" content="ie=edge"> --}}
    <title>{{ env('VITE_WEB_NAME') }}</title>
    {{-- <link rel="stylesheet" type="text/css" href="{{ asset('css/main_client.css') }}" /> --}}
    <link rel="stylesheet" type="text/css" href="{{ asset('css/main_admin.css') }}"  />
    <link rel="stylesheet" type="text/css" href="{{ asset('css/main.css') }}"  />
    @vite('resources/js/app.js')

</head>

<body>
    <div id="app"></div>
</body>

</html>
