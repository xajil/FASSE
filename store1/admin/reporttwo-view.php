<?php
	$mysqli = mysqli_connect(SERVER, USER, PASS, BD);
    #echo $mysqli;
    mysqli_set_charset($mysqli, "utf8");
    $proveedores=mysqli_query($mysqli,"SELECT proveedor.Direccion, COUNT(proveedor.Direccion) AS Cantidad FROM proveedor GROUP BY(proveedor.Direccion) ORDER BY(Cantidad) DESC ");
                        
?>
<p class="lead">
    
    </p>
    <ul class="breadcrumb" style="margin-bottom: 5px;">
        <li>
            <a href="configAdmin.php?view=report">
                <i class="fa fa-pie-chart" aria-hidden="true"></i> &nbsp; Reporte de ventas
            </a>
        </li>
        <li>
            <a href="configAdmin.php?view=reporttwo"><i class="fa fa-line-chart" aria-hidden="true"></i> &nbsp; Reporte de proveedores</a>
        </li>
    </ul>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <br><br>
                <div class="panel panel-info">
                    <div class="panel-heading text-center"><h4>Reporte</h4></div>
                <div class="row">
                <div id="chart_div" class="col-sm-5" style="width: 600px; height: 400px;"></div>

                    <div id="table_div" class="col-sm-5"></div>
                </div>                
           
                </div>
                

                
            </div>
        </div>
    </div>




    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Departamento');
        data.addColumn('number', 'Numero de proveedores');
        data.addRows([
            <?php
            while($prov=mysqli_fetch_array($proveedores, MYSQLI_ASSOC)){
                echo "['".$prov['Direccion']."', ".$prov['Cantidad']."],";
            }
            ?>
        ]);
    

        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {showRowNumber: true, width: '400', height: '300'});
      }
    </script>

<?php
	$mysqli = mysqli_connect(SERVER, USER, PASS, BD);
    #echo $mysqli;
    mysqli_set_charset($mysqli, "utf8");
    $proveedores=mysqli_query($mysqli,"SELECT proveedor.Direccion, COUNT(proveedor.Direccion) AS Cantidad FROM proveedor GROUP BY(proveedor.Direccion) ORDER BY(Cantidad) DESC ");
                        
?>

    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Departamento', 'Cantidad de proveedores'],
          <?php
            while($prov=mysqli_fetch_array($proveedores, MYSQLI_ASSOC)){
                echo "['".$prov['Direccion']."', ".$prov['Cantidad']."],";
            }
            ?>

        ]);

        var options = {
          title : 'Proveedores por departamento',
          vAxis: {title: 'Cantidad de proveedores'},
          hAxis: {title: 'Departamentos'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>



