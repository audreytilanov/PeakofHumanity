<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNegotiationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('negotiations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')
            ->constrained('products');
            $table->foreignId('user_id')
                    ->constrained('users');
            $table->unsignedBigInteger("admin_id")->nullable();
            $table->unsignedBigInteger("detail_transaction_id")->nullable();
            $table->decimal('harga_akhir', 14,2)->nullable();
            $table->string('status')->default('on.progress');
            $table->timestamps();

            $table->foreign("admin_id")->references("id")->on("admins");
            $table->foreign("detail_transaction_id")->references("id")->on("transaction_details");

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('negotiations');
    }
}
