<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration {

    public function up() {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('position_id')->unsigned()->nullable()->index();
            $table->integer('superior_id')->unsigned()->nullable()->index();
            $table->string('first_name')->nullable();
            $table->string('last_name')->nullable();
            $table->enum('title', ['Mr.','Mrs.','Ms.','Prof.','Dr.','Miss']);
            $table->string('username')->nullable()->unique();
            $table->string('phone_personal')->nullable();
            $table->string('phone_office')->nullable();
            $table->string('email')->nullable()->unique();
            $table->string('email_personal')->nullable()->unique();
            $table->string('password')->nullable();
            $table->decimal('salary', 10, 2)->nullable();
            $table->timestamp('last_login')->nullable();
            $table->softDeletes();
            $table->rememberToken();
            $table->timestamps();

            $table->foreign('position_id')
                ->references('id')
                ->on('positions')
                ->onDelete('set null')
                ->onUpdate('cascade');

            $table->foreign('superior_id')
                ->references('id')
                ->on('users')
                ->onDelete('set null')
                ->onUpdate('cascade');

        });

    }

    public function down() {
        Schema::table('users',function($table){
            $table->dropForeign(['position_id']);
        });
        Schema::table('users',function($table){
            $table->dropForeign(['superior_id']);
        });
        Schema::dropIfExists('users');
    }
}
