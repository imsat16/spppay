<?php
include '../conn.php';



$queryResult = $connect->query("SELECT * FROM tb_kelas ORDER BY nama_kelas = 'X' DESC");

$result = array();

while ($fetchData = $queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}

if ($result == null) {
    $gagal = null;
    echo json_encode($gagal);
} else {
    echo json_encode($result);
}
