<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePageTagsTable extends Migration {

    public function up() {
        Schema::create('page_tags', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->timestamps();
        });
    }


    public function down() {
        Schema::dropIfExists('page_tags');
    }
}
