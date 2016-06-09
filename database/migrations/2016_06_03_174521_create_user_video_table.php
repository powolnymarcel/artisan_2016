<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUserVideoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users_videos', function(Blueprint $table) {

            $table->increments('id');
            
            $table->integer('users_id')->unsigned();
            $table->foreign('users_id')->references('id')->on('users');

            $table->integer('videos_id')->unsigned();
            $table->foreign('videos_id')->references('id')->on('videos');



        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('user_video');

    }
}
