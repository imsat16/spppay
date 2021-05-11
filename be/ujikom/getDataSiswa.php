<?php
include 'conn.php';
$nama_kelas = $_POST['nama_kelas'];

// $queryResult=$connect->query ("SELECT * FROM tb_siswa");
// $queryResult=$connect->query ("SELECT tb_siswa.,tb_kelas. FROM tb_siswa 
// INNER JOIN tb_kelas ON tb_kelas.id_kelas=tb_siswa.id_siswa ORDER BY tb_siswa.id_siswa ASC");
// $queryResult=$connect->query("SELECT * FROM tb_siswa INNER JOIN tb_kelas ON tb_siswa.id_kelas = tb_kelas.id_kelas WHERE nama_kls = '".$nama_kls."'");
$queryResult=$connect->query("SELECT tb_siswa.*, tb_kelas.* FROM tb_siswa INNER JOIN tb_kelas ON tb_siswa.id_class = tb_kelas.id_class WHERE tb_kelas.nama_kelas = '".$nama_kelas."'");
$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[]=$fetchData;
}
 
echo json_encode($result);
?>