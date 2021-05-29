<?php
	$mysqli = mysqli_connect(SERVER, USER, PASS, BD);
    #echo $mysqli;
    mysqli_set_charset($mysqli, "utf8");
    $proveedores=mysqli_query($mysqli,"SELECT producto.NombreProd, SUM(detalle.CantidadProductos) AS CantidadProductos FROM producto INNER JOIN detalle ON producto.CodigoProd = detalle.CodigoProd GROUP BY(producto.NombreProd) ORDER BY(CantidadProductos ) DESC ");
                    
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
                    <div id="chart_div" class="col-sm-5"></div>
                    <div id="table_div" class="col-sm-5"></div>
                </div>                
           
                </div>
                

                
            </div>
        </div>
    </div>




    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Nombre Producto');
        data.addColumn('number', 'Numero de Ventas');
        data.addRows([
            <?php
            while($prov=mysqli_fetch_array($proveedores, MYSQLI_ASSOC)){
                echo "['".$prov['NombreProd']."', ".$prov['CantidadProductos']."],";
            }
            ?>
        ]);


        // Set chart options
        var options = {'title':'Nivel de ventas por producto',
                       'width':600,
                       'height':300,
                       'legend': { 'position': 'none'}
                    };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

<?php
	$mysqli = mysqli_connect(SERVER, USER, PASS, BD);
    #echo $mysqli;
    mysqli_set_charset($mysqli, "utf8");
    $proveedores=mysqli_query($mysqli,"SELECT producto.NombreProd, SUM(detalle.CantidadProductos) AS CantidadProductos FROM producto INNER JOIN detalle ON producto.CodigoProd = detalle.CodigoProd GROUP BY(producto.NombreProd) ORDER BY(CantidadProductos ) DESC ");
                    
?>

<script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Nombre Producto');
        data.addColumn('number', 'Numero de Ventas');
        data.addRows([
            <?php
            while($prov=mysqli_fetch_array($proveedores, MYSQLI_ASSOC)){
                echo "['".$prov['NombreProd']."', ".$prov['CantidadProductos']."],";
            }
            ?>
        ]);
    

        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {showRowNumber: true, width: '400', height: '300'});
      }
    </script>