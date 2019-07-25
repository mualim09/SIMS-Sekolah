<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBlogPostMetasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('blog_post_metas', function (Blueprint $table) {
            $table->unsignedBigInteger('id_post');
            $table->foreign('id_post')->references('id')->on('blog_posts');
            $table->unsignedBigInteger('id_tag');
            $table->foreign('id_tag')->references('id')->on('blog_tags');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('blog_post_metas');
    }
}
