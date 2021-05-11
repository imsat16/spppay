<?php
include 'conn.php';

$nisn = $_POST['nisn'];

$queryResult = $connect->query("SELECT * FROM tb_spp WHERE nisn = '" . $nisn . "'");
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
?>