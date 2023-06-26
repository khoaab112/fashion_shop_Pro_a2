<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ env('VITE_WEB_NAME') }}</title>
    {{-- @vite(['resources/css/app.css', 'resources/js/app.js']) --}}
    <link rel="stylesheet" type="text/css" href="{{ asset('css/main_client.css') }}" />
    @vite('resources/js/app.js')
    {{-- @vite('public/css/main_client.css') --}}
</head>

<body>
        <div id="app"></div>
</body>

</html>
