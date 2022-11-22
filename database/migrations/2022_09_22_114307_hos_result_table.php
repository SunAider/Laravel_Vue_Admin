<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class HosResultTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hosResults', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('tag_id')->nullable(false);
            $table->datetime('click_date')->nullable(false);            
            $table->bigInteger('click_type')->nullable(false)->default(0); 
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
        Schema::dropIfExists('hosResults');
    }
}
