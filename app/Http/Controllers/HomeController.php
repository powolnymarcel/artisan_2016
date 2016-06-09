<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Videos;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $videos=Videos::all();
        return view('home',['url'=>$videos]);
    }

public function edition(Request $request){

if (Auth::user()->admin ==1) {
    $video = Videos::find($request['leID']);
    $video->titre_fr = $request['leTitreFR'];
    $video->titre_nl = $request['leTitreNL'];
    $video->url = $request['leURL'];
    $video->description_fr = $request['LaDescriptionFR'];
    $video->description_nl = $request['LaDescriptionNL'];
    $video->save();

    return response()->json(['edition' => 'valide']);
}
    else{
        return response()->json(['edition' => 'nonvalide']);

    }
}






}
