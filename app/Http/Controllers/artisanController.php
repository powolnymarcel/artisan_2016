<?php

namespace App\Http\Controllers;
//\Debugbar::disable();
use App\Accueil;
use App\Concours;
use App\Users;
use Illuminate\Http\Request;
use App\Videos;
use Illuminate\Http\Response;
use App\Http\Requests;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use Illuminate\Validation\Validator;

class artisanController extends Controller
{

    public function __construct()
    {   
        //Par défaut la locale en session sera FR
        Session::put('language','fr');
       // $language = Session::get('language','fr');
       // app()->setLocale($language);
    }

    public function index()
    {
        $locale=app()->getLocale();
        //On va chercher en base de données les diverses infos à afficher sur l'acceuil
        $accueil= Accueil::select('description_'.$locale.' as description','entete_'.$locale.' as entete','image_header_'.$locale.' as image_header','sous_titre_'.$locale.' as sous_titre')->get();


        //On va chercher en base de données les vidéos
        $videos=Videos::select('description_'.$locale.' as description','titre_'.$locale.' as titre','url as url','id as id','aime as aime' )->get();

        //On vérifie si l'utilisateur est déjà passé sur le site et que l'on a son IP en session
        if(session()->get('ip_vote_artisan')) {
            $utilisateur= Users::where('adresseIp', '=', $_SERVER['REMOTE_ADDR'])->first();
            $videos_utilisateur= $utilisateur->videos;

            //On vérifie Si l'utilisateur a déjà liké une vidéo
            if($utilisateur->videos)
            {
                //On garde en variable les vidéos liké par l'utilisateur
                $videos_utilisateur= $utilisateur->videos;
                return view('accueil',['videos'=>$videos,'accueil'=>$accueil,'videos_utilisateur'=>$videos_utilisateur]);
            }
            return view('accueil',['videos'=>$videos,'accueil'=>$accueil,'videos_utilisateur'=>$videos_utilisateur]);
        }
        else{
            $utilisateur= Users::where('adresseIp', '=', $_SERVER['REMOTE_ADDR'])->first();
            if($utilisateur){
                session()->put('ip_vote_artisan',$_SERVER['REMOTE_ADDR']);
                $utilisateur= Users::where('adresseIp', '=', $_SERVER['REMOTE_ADDR'])->first();
                $videos_utilisateur= $utilisateur->videos;
                if($utilisateur->videos)
                {
                    //On garde en variable les vidéos likées par l'utilisateur
                    return view('accueil',['videos'=>$videos,'accueil'=>$accueil,'videos_utilisateur'=>$videos_utilisateur]);
                }
                return view('accueil',['videos'=>$videos,'accueil'=>$accueil,'videos_utilisateur'=>$videos_utilisateur]);
            }
            else{
               // echo "nouveau user";
                session()->put('ip_vote_artisan',$_SERVER['REMOTE_ADDR']);
                $user = new Users;
                $user->adresseIp =$value = session()->get('ip_vote_artisan');
                $user->save();
               return $this->index();
            }
        }
    }
    
    public function aime(Request $request)
    {
        $video_id = $request['idVideo'];

        $ipUser= $_SERVER['REMOTE_ADDR'];

        if (isset($request['idVideo'])){
            $utilisateurPresent= Users::where('adresseIp', '=', $ipUser)->count();
            $utilisateur= Users::where('adresseIp', '=', $ipUser)->first();
            if($utilisateurPresent==1){

                if($utilisateur->videos->contains($video_id))
                {
                    return response()->json(['dejavote'=>'oui']);
                }
                else{
                    if ($utilisateur->totalVoteDuJour < 3)
                    {

                        //ça fonctionne
                        $video = Videos::find($video_id);
                        $video->aime += 1;
                        $video->save();

                        $utilisateur=Users::where('adresseIp', '=', $ipUser)->first();
                        $utilisateur->videos()->attach($video_id);
                        $utilisateur->totalVoteDuJour += 1;
                        $utilisateur->save();
                        return response()->json(['depassement'=>'non']);
                    }
                    else{
                        return response()->json(['depassement'=>'oui']);
                    }
                }
            }
            else{
                return 'non';
            }
        }
        return "nons";
    }




    public function concours(Request $request)
    {
        $email=$request['email'];


        $emailPresent=Concours::where('email', '=', $email)->first();
        if($emailPresent)
        {
            return response()->json(['concours'=>'ajout_non']);
        }
        else
        {
            $participe = new Concours;
            $participe->email =$email;
            $participe->save();
            return response()->json(['concours'=>'ajout_oui']);
        }


    }





public function langue(){

   $langue = Input::get('langue');
    app()->setLocale($langue);
        $locale=app()->getLocale();

    $accueil= Accueil::select('description_'.$locale.' as description','entete_'.$locale.' as entete','image_header_'.$locale.' as image_header','sous_titre_'.$locale.' as sous_titre')->get();
    Session::put('language',$langue);



    $videos=Videos::select('description_'.$locale.' as description','titre_'.$locale.' as titre','url as url','id as id','aime as aime' )->get();

    
    $utilisateur= Users::where('adresseIp', '=', $_SERVER['REMOTE_ADDR'])->first();
    $videos_utilisateur= $utilisateur->videos;
    return view('accueil',['videos'=>$videos,'accueil'=>$accueil,'videos_utilisateur'=>$videos_utilisateur]);
}














}
