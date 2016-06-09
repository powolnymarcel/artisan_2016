@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            @foreach($url as $video)
            <div class="panel panel-default" id="{{$video->id}}">
                <h4 class="panel-heading titre_FR_editable-{{$video->id}}">{{$video->titre_fr}}</h4>
                <h4 class="panel-heading titre_NL_editable-{{$video->id}}">{{$video->titre_nl}}</h4>

                <div class="panel-body">
                    <ul>
                        <li>Lien de la video :  <span class="lien_editable-{{$video->id}}">{{$video->url}}</span></li>
                        <li>Description FR de la video : <span class="description_fr_editable-{{$video->id}}">{{$video->description_fr}}</span></li>
                        <li>Description NL de la video : <span class="description_nl_editable-{{$video->id}}">{{$video->description_nl}}</span></li>
                    </ul>
                    <button class="btn btn-default boutonEditer">Editer</button>
                    <button class="btn btn-success boutonValider">Valider</button>
                </div>
            </div>
            @endforeach

        </div>
    </div>
</div>
@endsection
@if(Auth::user()->admin ==1)
@section('scripts')
    <script src="{{ URL::to('lib/sweetalert/dist/sweetalert.min.js') }}"></script>
    <link rel="stylesheet" href="{{ URL::to('lib/sweetalert/dist/sweetalert.css') }}">

    <script>

    var token ='{{Session::token()}}';



    $('.boutonValider').hide();

    $('.boutonEditer').on('click',function(){
        $(this).hide();
        $(this).siblings().show();
        var idVideo=$(this).parent().parent().attr('id');

        $(document).find('.titre_FR_editable-'+idVideo).each(function() {
            var input = $('<input class="titre_FR_editable-'+idVideo+'" />').val($(this).text());
            $(this).replaceWith(input);
        });
        $(document).find('.titre_NL_editable-'+idVideo).each(function() {
            var input = $('<input class="titre_NL_editable-'+idVideo+'" />').val($(this).text());
            $(this).replaceWith(input);
        });
        $(document).find('.lien_editable-'+idVideo).each(function() {
            var input = $('<input style="width: 400px" class="lien_editable-'+idVideo+'" />').val($(this).text());
            $(this).replaceWith(input);
        });
        $(document).find('.description_fr_editable-'+idVideo).each(function() {
            var input = $('<textarea cols="25" rows="5" class="description_fr_editable-'+idVideo+'" />').val($(this).text());
            $(this).replaceWith(input);
        });
        $(document).find('.description_nl_editable-'+idVideo).each(function() {
            var input = $('<textarea cols="25" rows="5" class="description_nl_editable-'+idVideo+'" />').val($(this).text());
            $(this).replaceWith(input);
        });
    });

    $('.boutonValider').on('click',function(){
        $(this).hide();
        $(this).siblings().show();
        var idVideo=$(this).parent().parent().attr('id');

        leTitreFR=$(this).parent().parent().children().val();
        leTitreNL=$(this).parent().parent().children().next().val();
        leURL=        $(this).parent().parent().children().children().children().children().val();
        LaDescriptionFR=$(this).parent().parent().children().children().children().next().children().val();
        LaDescriptionNL=$(this).parent().parent().children().children().children().next().next().children().val();

        $(document).find('.titre_FR_editable-'+idVideo).each(function() {
            var input = $('<h4 class="panel-heading titre_FR_editable-'+idVideo+'" </h4/>').text(leTitreFR);
            $(this).replaceWith(input);
        });
        $(document).find('.titre_NL_editable-'+idVideo).each(function() {
            var input = $('<h4 class="panel-heading titre_NL_editable-'+idVideo+'" </h4/>').text(leTitreNL);
            $(this).replaceWith(input);
        });
        $(document).find('.lien_editable-'+idVideo).each(function() {
            var input = $('<span class="lien_editable-'+idVideo+'" </span>').text(leURL);
            $(this).replaceWith(input);
        });
        $(document).find('.description_fr_editable-'+idVideo).each(function() {
            var input = $('<span class="description_fr_editable-'+idVideo+'" </span>').text(LaDescriptionFR);
            $(this).replaceWith(input);
        });
        $(document).find('.description_nl_editable-'+idVideo).each(function() {
            var input = $('<span class="description_nl_editable-'+idVideo+'" </span>').text(LaDescriptionNL);
            $(this).replaceWith(input);
        });
        $.ajax({
            type: 'POST',
            context:this,
            url:  '{{route('edition')}}',
            data: {
                leID:idVideo,
               leTitreFR:leTitreFR,
                leTitreNL:leTitreNL,
                leURL:leURL,
                LaDescriptionFR:LaDescriptionFR,
                LaDescriptionNL:LaDescriptionNL,
                _token:token
            }

        }).done(function(msg){

            console.log(msg)
            if(msg.edition == 'valide'){
                swal("Merci!", "Edition terminée", "success");
                return true
            }
            swal({
                title: "Erreur!",
                text: "Vous devez etre admin pour modifier du contenu !.",
                type: "error",
                confirmButtonText: "Ok"
            });

        })

    });
</script>
@stop
@endif