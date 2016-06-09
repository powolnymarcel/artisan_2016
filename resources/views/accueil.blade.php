@extends('layout.layout')
@section('titre')Artisan 2016
@stop
@section('contenu')
<div class="row">
    <div class="col-md-12">
        <nav class="navbar navbar-right">

            <?php
            if(app()->getLocale()=="fr"){
                $locale="nl";
            }
            else{
                $locale="fr";
            }
            ?>
            <form action="{{route('langue',['langue'=>$locale])}}" method="POST">
                <select name="langue" id="" onchange="this.form.submit()">
                    <option value="fr" @if(app()->getLocale() =='fr') selected @endif>FR</option>
                    <option value="nl" @if(app()->getLocale() =='nl') selected @endif>NL</option>
                    <input type="hidden" name="_token" value="{{Session::token()}}">
                </select>
            </form>
            Langue choisie: {{trans('traduction.langue')}}

        </nav>
        <img src="{{URL::to('img')}}/{{$accueil[0]->image_header}}" class="img-responsive center-block" alt="">


        <h3>{{$accueil[0]->entete}}</h3>
        <form >
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" name="email" required id="email">
                <input type="button" id="participer" class="btn btn-default" value="{{trans('traduction.participer')}}">
            </div>

        </form>
        <hr>
        <h2>{{$accueil[0]->sous_titre}}</h2>
        <ul id="videos" class="list-unstyled">

            @foreach($videos as $video)
                <li id="video{{$video->id}}" class="col-md-6 text-center">
                    {{$video->titre}}<br>
                    <div style="overflow:hidden;height:270px;width:480px;"><div id="youtube_canvas" style="height:270px;width:480px;"><iframe style="height:270px;width:480px;border:0;" frameborder="0" src="{{$video->url}}?hl=fr&amp;autoplay=0&amp;cc_load_policy=0&amp;loop=0&amp;iv_load_policy=0&amp;fs=1&amp;showinfo=0"></iframe></div><style>#youtube_canvas img{max-width:none!important;background:none!important}</style></div>
                    <hr>
                    <a href="" class="btn btn-success aime @foreach($videos_utilisateur as $video_utilisateur) @if($video_utilisateur->id==$video->id)btn-danger @endif @endforeach" title="" data-id="{{$video->id}}">
                        {{trans('traduction.vote')}}
                    </a>
                    <span id="video-{{$video->idvideos}}">{{$video->aime}}</span>
                    <p>{{$video->description}}</p>
                    <hr>
                </li>
            @endforeach
        </ul>

    </div>
    <footer class="col-md-12 text-center">
        <a href="{{route('auth.login')}}">Connexion</a>
    </footer>
</div>
@stop
@section('scripts')

    <script>
var token ='{{Session::token()}}';

        $('.aime').click(function(event){
            event.preventDefault();
        });

$('.aime').on('click',function(){

            var idVideo=$(this).attr('data-id');
            $.ajax({
                type: 'POST',
                context:this,
                url:  '{{route('aime')}}',
                data: {
                    idVideo: idVideo,
                    _token:token
                }

            })
                    .done(function(msg){

                        console.log(msg)
                        if(msg.depassement == 'oui'){
                            swal({
                                title: "Erreur!",
                                text: "Le nombre de vote est limité à 3 par jour! Revennez demain.",
                                type: "error",
                                confirmButtonText: "Ok"
                            });
                        }
                        else if(msg.dejavote == 'oui') {
                            swal({
                                title: "Erreur!",
                                text: "Vous ne pouvez voter qu'une fois par vidéo et par jour! Revennez demain.",
                                type: "error",
                                confirmButtonText: "Ok"
                            });
                        }
                        else if(msg.depassement == 'non'){
                            var span= $(this).siblings('span');
                            span.text( Number( span.text() ) + 1 );
                            $(this).addClass('btn-danger');
                            swal("Merci!", "Merci d'avoir voté", "success");
                        }
                        else{
                            swal({
                                title: "Erreur!",
                                text: "Une erreur est survennue",
                                type: "error",
                                confirmButtonText: "Ok"
                            });
                        }
                    })

            // $( this ).attr('src', 'img/coeur-on.png');
            //$( this ).attr('id', 'coeur-on');

        });

$(document).on("keypress",function(event) {
    var keyCode = event.which || event.keyCode;
    if (keyCode == 13) {
        $("#participer").click();
        return false;
    }
});
$('#participer').on('click',function(){
    var email=$('#email').val();

    function validationEmail(adresseMail) {
        var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
        return pattern.test(adresseMail);
    }

    if( !validationEmail( email ) ) {
        return  swal({
            title: "Email!",
            text: "Votre email n'est pas valide ! ",
            type: "error",
            confirmButtonText: "Ok"
        });
    }
    $.ajax({
                type: 'POST',
                url:  '{{route('concours')}}',
                data: {
                    email: email,
                    _token:token
                }
            })
            .done(function(msg){

                if(msg.concours == 'ajout_non'){
                    swal({
                        title: "Participation!",
                        text: "Votre email est déjà enregistrée.",
                        type: "error",
                        confirmButtonText: "Ok"
                    });
                }
                else if(msg.concours == 'ajout_oui'){
                    swal("Merci!", "Merci d'avoir participé.", "success");

                }
                else{
                    swal({
                        title: "Erreur!",
                        text: "Une erreur est survennue (concours)",
                        type: "error",
                        confirmButtonText: "Ok"
                    });
                }
            });

    // $( this ).attr('src', 'img/coeur-on.png');
    //$( this ).attr('id', 'coeur-on');

});


    </script>
@stop