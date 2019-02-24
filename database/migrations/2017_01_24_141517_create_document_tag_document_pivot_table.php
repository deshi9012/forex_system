<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDocumentTagDocumentPivotTable extends Migration {

    public function up() {
        Schema::create('document_tag_document', function (Blueprint $table) {

            $table->integer('document_tag_id')->unsigned()->index();
            $table->foreign('document_tag_id')->references('id')->on('document_tags')->onDelete('cascade');

            $table->integer('document_id')->unsigned()->index();
            $table->foreign('document_id')->references('id')->on('documents')->onDelete('cascade');

            $table->primary(['document_tag_id', 'document_id']);
        });
    }

    public function down() {
        Schema::drop('document_tag_document');
    }
}
