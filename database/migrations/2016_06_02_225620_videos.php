<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Videos extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('videos', function(Blueprint $table) {

            $table->increments('id');
            $table->integer('aime');
            $table->string('titre',25);
            $table->string('description',255);
            $table->string('url',255);
            $table->timestamps();



        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('videos');

    }
}
