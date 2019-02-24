<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDocumentCategoryDocumentPivotTable extends Migration {

    public function up() {
        Schema::create('document_category_document', function (Blueprint $table) {

            $table->integer('document_category_id')->unsigned()->index();
            $table->foreign('document_category_id')->references('id')->on('document_categories')->onDelete('cascade');

            $table->integer('document_id')->unsigned()->index();
            $table->foreign('document_id')->references('id')->on('documents')->onDelete('cascade');

            $table->primary(['document_category_id', 'document_id'],'doc_cat_doc_doc_cat_id_doc_id_primary');
        });
    }

        public function down() {
        Schema::drop('document_category_document');
    }
}
