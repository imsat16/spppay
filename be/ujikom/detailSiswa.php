<?php
include 'conn.php';
$nisn = $_POST['nisn'];

$queryResult=$connect->query("SELECT tb_siswa.*, tb_kelas.* FROM tb_siswa INNER JOIN tb_kelas ON tb_siswa.id_class = tb_kelas.id_class WHERE tb_siswa.nisn = '".$nisn. "'");
$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[]=$fetchData;
}
 
echo json_encode($result);
?>