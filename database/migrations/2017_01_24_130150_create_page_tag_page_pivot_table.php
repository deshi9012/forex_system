<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePageTagPagePivotTable extends Migration {

    public function up() {
        Schema::create('page_tag_page', function (Blueprint $table) {

            $table->integer('page_tag_id')->unsigned()->index();
            $table->foreign('page_tag_id')->references('id')->on('page_tags')->onDelete('cascade');

            $table->integer('page_id')->unsigned()->index();
            $table->foreign('page_id')->references('id')->on('pages')->onDelete('cascade');

            $table->primary(['page_tag_id', 'page_id']);

        });
    }

    public function down() {
        Schema::drop('page_tag_page');
    }
}
