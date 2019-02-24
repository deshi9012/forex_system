<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnsToWelcomePage extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::table('welcome_page', function (Blueprint $table) {
            $table->integer('user_id')->unsigned()->nullable()->index();
            $table->boolean('is_featured');
            $table->string('title', 160)->change();

            $table->renameColumn('title','short_message');
            $table->renameColumn('content','long_message');

            $table->foreign('user_id')
                ->references('id')->on('users')
                ->onDelete('set null')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::table('welcome_page', function (Blueprint $table) {
            $table->dropForeign(['user_id']);
    //            $table->dropIndex(['user_id']);
    //            $table->integer('user_id');
    //            $table->boolean('is_featured');
    //            $table->string('short_message');
    //            $table->text('long_message');
        });
    }
}
