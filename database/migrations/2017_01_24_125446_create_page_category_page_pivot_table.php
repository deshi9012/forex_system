<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePageCategoryPagePivotTable extends Migration {

    public function up() {

        Schema::create('page_category_page', function (Blueprint $table) {

            $table->integer('page_category_id')->unsigned()->index();
            $table->foreign('page_category_id')->references('id')->on('page_categories')->onDelete('cascade');

            $table->integer('page_id')->unsigned()->index();
            $table->foreign('page_id')->references('id')->on('pages')->onDelete('cascade');

            $table->primary(['page_category_id', 'page_id']);
        });
    }

    public function down() {
        Schema::drop('page_category_page');
    }
}
