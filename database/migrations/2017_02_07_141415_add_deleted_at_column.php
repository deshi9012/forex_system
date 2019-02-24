<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddDeletedAtColumn extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::table('page_tags', function (Blueprint $table) {
            $table->softDeletes();
        });
        Schema::table('page_categories', function (Blueprint $table) {
            $table->softDeletes();
        });
        Schema::table('document_tags', function (Blueprint $table) {
            $table->softDeletes();
        });
        Schema::table('document_categories', function (Blueprint $table) {
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        //
    }
}
