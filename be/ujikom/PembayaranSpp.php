<?php
include 'conn.php';

$awalan = "PEMB";
$lebar = 6;

$auto = $connect->query("SELECT id_payment FROM tb_pembayaran ORDER BY id_payment DESC LIMIT 1");
$jumlah_record = mysqli_num_rows($auto);
if ($jumlah_record == 0) {
    $nomor = 1;
} else {
    $row = mysqli_fetch_array($auto);
    $nomor = intval(substr($row[0], strlen($awalan))) + 1;
}
if ($lebar > 0) {
    $angka = $awalan . str_pad($nomor, $lebar, "0", STR_PAD_LEFT);
} else {
    $angka = $awalan . $nomor;
}

$id = $angka;

$get_tagihan = $_POST['tagihan'];
$get_nominal = $_POST['nominal'];
$tagihan = (int)$get_tagihan;
$nominal = (int)$get_nominal;
$bulan = $_POST['bulan'];
$id_spp = $_POST['id_spp'];
$nisn = $_POST['nisn'];
$id_petugas = $_POST['id_petugas'];

$hari = date("d");
$bulan_b = date("F");
$tahun = date("Y");

if ($nominal > $tagihan) {
    $hasil_kembalian = $nominal - $tagihan;
} else if ($nominal <= $tagihan) {
    $hasil_kembalian = $tagihan - $nominal;
} else {
    $gagal = "gagal";
    echo json_encode($gagal);
}

if ($hasil_kembalian == 0) {
    $status = "Lunas";
} else {
    $status = "Belum Lunas";
}

$queryResult = $connect->query("UPDATE tb_spp SET `" . $bulan . "` = '" . $hasil_kembalian . "', `status` = '" . $status . "' WHERE id_spp = '" . $id_spp . "'");
$queryResult1 = $connect->query("INSERT INTO tb_pembayaran (id_payment, id_petugas, nisn, tgl_bayar, bln_dibayar, thn_dibayar, id_spp, jumlah_bayar, pembayaran_sisa_bayar) VALUES ('" . $id . "', '" . $id_petugas . "', '" . $nisn . "', '" . $hari . "', '" . $bulan_b . "', '" . $tahun . "', '" . $id_spp . "', '" . $nominal . "', '" . $hasil_kembalian . "')");


$berhasil = "berhasil";
echo json_encode($berhasil);
?>