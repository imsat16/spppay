<?php
    include 'conn.php';

    $username = $_POST['username'];
    $password = $_POST['password'];

    $queryResult = $connect->query("SELECT * FROM tb_petugas WHERE username='".$username."' and password='".$password."'");
    $hasil=mysqli_num_rows($queryResult);

    if ($hasil == 1) {
    $queryResult = $connect->query("SELECT * FROM tb_petugas WHERE username='" . $username . "' and password='" . $password . "'");

    $result = array();

    while ($fetchData = $queryResult->fetch_assoc()) {
        $result[] = $fetchData;
    }

    echo json_encode($result);
}else{
    $hasil2= "gagal";
    echo json_encode($hasil2);
}
?>