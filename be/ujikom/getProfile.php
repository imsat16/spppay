<?php
    include 'conn.php';

    $id = $_POST['id'];

    $queryResult = $connect->query("SELECT * FROM tb_petugas WHERE id_petugas='".$id."'");
    // $hasil=mysqli_num_rows($queryResult);
    $result = array();

while ($fetchData = $queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}

echo json_encode($result);
?>