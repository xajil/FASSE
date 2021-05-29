<?php
session_start();
require './fpdf/fpdf.php';
include '../library/configServer.php';
include '../library/consulSQL.php';
$id=$_GET['id'];
$sVenta=ejecutarSQL::consultar("SELECT * FROM venta WHERE NumPedido='$id'");
$dVenta=mysqli_fetch_array($sVenta, MYSQLI_ASSOC);
$sCliente=ejecutarSQL::consultar("SELECT * FROM cliente WHERE NIT='".$dVenta['NIT']."'");
$dCliente=mysqli_fetch_array($sCliente, MYSQLI_ASSOC);
class PDF extends FPDF{
}
ob_end_clean();

$pdf->Ln(10);
$pdf->SetFont("Times","b",12);
$pdf->Cell (76,10,utf8_decode('Nombre'),1,0,'C');
$pdf->Cell (30,10,utf8_decode('Precio'),1,0,'C');
$pdf->Cell (30,10,utf8_decode('Cantidad'),1,0,'C');
$pdf->Cell (30,10,utf8_decode('Subtotal'),1,0,'C');
$pdf->Ln(10);
$pdf->SetFont("Times","",12);
$suma=0;
$sDet=ejecutarSQL::consultar("SELECT * FROM detalle WHERE NumPedido='".$id."'");
while($fila1 = mysqli_fetch_array($sDet, MYSQLI_ASSOC)){
    $consulta=ejecutarSQL::consultar("SELECT * FROM producto WHERE CodigoProd='".$fila1['CodigoProd']."'");
    $fila=mysqli_fetch_array($consulta, MYSQLI_ASSOC);
    $pdf->Cell (76,10,utf8_decode($fila['NombreProd']),1,0,'C');
    $pdf->Cell (30,10,utf8_decode('Q'.$fila1['PrecioProd']),1,0,'C');
    $pdf->Cell (30,10,utf8_decode($fila1['CantidadProductos']),1,0,'C');
    $pdf->Cell (30,10,utf8_decode('Q'.$fila1['PrecioProd']*$fila1['CantidadProductos']),1,0,'C');
    $pdf->Ln(10);
    $suma += $fila1['PrecioProd']*$fila1['CantidadProductos'];
    mysqli_free_result($consulta);
}
$pdf->SetFont("Times","b",12);
$pdf->Cell (76,10,utf8_decode(''),1,0,'C');
$pdf->Cell (30,10,utf8_decode(''),1,0,'C');
$pdf->Cell (30,10,utf8_decode(''),1,0,'C');
$pdf->Cell (30,10,utf8_decode('Q'.number_format($suma,2)),1,0,'C');
$pdf->Ln(10);
$pdf->Output('Factura-#'.$id,'I');
mysqli_free_result($sVenta);
mysqli_free_result($sCliente);
mysqli_free_result($sDet);