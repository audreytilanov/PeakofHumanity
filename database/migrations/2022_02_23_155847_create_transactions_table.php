<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')
                    ->constrained('users')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            $table->foreignId('city_id')
                    ->constrained('cities')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            $table->foreignId('province_id')
                    ->constrained('provinces')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            $table->dateTime('timeout')->nullable();
            $table->string('address', 191);
            $table->double('total', 12, 2)->nullable();
            $table->double('shipping_cost', 12, 2)->nullable();
            $table->double('sub_total', 12, 2);
            $table->string('proof_of_payment', 191)->nullable();
            $table->string('code');
            $table->string('slug');
            $table->string('payment_token')->nullable();
            $table->string('payment_url')->nullable();
            $table->date('tgl_pemasangan')->nullable();
            $table->date('tgl_pembongkaran')->nullable();
            $table->enum('status', ['pending', 'unpaid', 'paid', 'admin_verified', 'admin_notverified', 'admin_deliver', 'success', 'expired', 'canceled'])->default('pending');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transactions');
    }
}
