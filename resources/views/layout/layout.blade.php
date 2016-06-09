<?php session_start(); ?>
<?php
$_SESSION['ip_vote_artisan'] = $_SERVER['REMOTE_ADDR'];

?>
<!DOCTYPE html>
<html>
    <head>
        <title>@yield('titre')</title>

        <link href="https://fonts.googleapis.com/css?family=Lato:100" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="{{ URL::to('lib/bootstrap/dist/css/bootstrap.min.css') }}">
        <script src="{{ URL::to('lib/jquery/dist/jquery.min.js') }}"></script>
        <script src="{{ URL::to('lib/bootstrap/dist/js/bootstrap.min.js') }}"></script>
        <script src="{{ URL::to('lib/sweetalert/dist/sweetalert.min.js') }}"></script>
        <link rel="stylesheet" href="{{ URL::to('lib/sweetalert/dist/sweetalert.css') }}">

    </head>
    <body>
        <div class="container">
            @yield('contenu')
        </div>
    @yield('scripts')
    </body>
</html>
