<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNegotiationDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('negotiation_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("negotiation_id");
            $table->unsignedBigInteger("admin_id")->nullable();
            $table->decimal('harga_penawaran', 14,2);
            $table->string('status')->default('penawaran');

            $table->timestamps();
            $table->foreign("admin_id")->references("id")->on("admins");
            $table->foreign("negotiation_id")->references("id")->on("negotiations");

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('negotiation_details');
    }
}
