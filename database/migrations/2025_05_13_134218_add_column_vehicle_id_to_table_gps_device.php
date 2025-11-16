use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Kwa PostgreSQL, tunongeza column kwanza kama nullable integer/bigint
        DB::statement('ALTER TABLE gps_devices ADD COLUMN vehicle_id bigint NULL');

        // Kisha tunongeza foreign key
        Schema::table('gps_devices', function (Blueprint $table) {
            $table->foreign('vehicle_id')->references('id')->on('customer_vehicles')->onDelete('set null');
        });
    }

    public function down(): void
    {
        Schema::table('gps_devices', function (Blueprint $table) {
            $table->dropForeign(['vehicle_id']);
        });

        DB::statement('ALTER TABLE gps_devices DROP COLUMN vehicle_id');
    }
};
