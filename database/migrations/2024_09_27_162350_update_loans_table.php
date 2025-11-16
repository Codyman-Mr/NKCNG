<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
   public function up(): void
{
    Schema::table('loans', function (Blueprint $table) {
        $table->string('applicant_name')->nullable()->after('loan_required_amount');
    });
}

public function down(): void
{
    Schema::table('loans', function (Blueprint $table) {
        $table->dropColumn('applicant_name');
    });
}
