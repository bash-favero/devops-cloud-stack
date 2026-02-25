<?php
// Zero credenciais ou nomes no código. Tudo vem do ambiente!
$host = getenv('DB_HOST') ?: '';
$db   = getenv('DB_NAME') ?: '';
$user = getenv('DB_USER') ?: '';
$pass = getenv('DB_PASS') ?: '';

$db_status = "❌ Driver PDO not loaded";

// Só tenta conectar se as variáveis de ambiente existirem
if ($host && $db && $user && $pass) {
    if (class_exists('PDO')) {
        try {
            $pdo = new PDO("pgsql:host=$host;port=5432;dbname=$db", $user, $pass);
            $db_status = "✅ Connected to Database";
        } catch (Exception $e) {
            $db_status = "❌ Connection Error: " . $e->getMessage();
        }
    }
} else {
    $db_status = "⚠️ Waiting for environment variables...";
}

$load = sys_getloadavg();
$cpu_load = $load !== false ? round($load[0], 2) : "N/A";
?>

<!DOCTYPE html>
<html>
<head>
    <title>SRE Cloud Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; background: #121212; color: #fff; text-align: center; padding: 50px; }
        .card { background: #1e1e1e; padding: 20px; border-radius: 10px; display: inline-block; margin: 10px; border: 1px solid #333; }
        .status { color: #4caf50; font-weight: bold; margin-top: 15px; }
    </style>
</head>
<body>
    <h1>🚀 SRE Dashboard - 12-Factor App Ready!</h1>
    
    <div class="card">
        <h2>Database Layer</h2>
        <div class="status"><?php echo $db_status; ?></div>
    </div>

    <div class="card">
        <h2>Server Metrics</h2>
        <p>CPU Load (1m): <strong><?php echo $cpu_load; ?></strong></p>
    </div>
</body>
</html>
