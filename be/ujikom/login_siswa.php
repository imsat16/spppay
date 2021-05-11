<?php
include "conn.php";

$nis = $_POST['nis'];
$password = $_POST['password'];

$queryResult = $connect->query("SELECT * FROM tb_login_siswa WHERE nis = '".$nis."' AND password ='".$password ."'");
$result = mysqli_num_rows($queryResult);

if ($result == 1) {
    $queryResult = $connect->query("SELECT tb_siswa.*,tb_kelas.* FROM tb_siswa INNER JOIN tb_kelas ON tb_siswa.id_class = tb_kelas.id_class WHERE tb_siswa.nis = '".$nis."'");
    $result = array();
    while ($fetchData = $queryResult->fetch_assoc()) {
        $result[] = $fetchData;
    }
    echo json_encode($result);
} else {
    $hasil2 = "gagal";
    echo json_encode($hasil2);
}
// echo json_encode($result);

?>