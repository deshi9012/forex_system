
<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDocumentsTable extends Migration {

    public function up() {
        Schema::create('documents', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->text('content')->nullable();
            $table->text('description');
            $table->softDeletes();
            $table->timestamps();
        });
    }


    public function down() {
        Schema::dropIfExists('documents');
    }
}
