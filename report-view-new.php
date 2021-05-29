<?php
 $cr = 0;
 $inicio = 0;
	$mysqli = mysqli_connect("localhost", "root", "", "fasse");
    #echo $mysqli;
    mysqli_set_charset($mysqli, "utf8");
    $proveedores=mysqli_query($mysqli,"select  CodigoProd, 
sum(CantidadProductos) CantidadProductos, 
sum(PrecioProd) PrecioProd 
from detalle
group by detalle.CodigoProd 
order by CantidadProductos  desc ;");
    
    $cr=$inicio+1;
                    
?>
<p class="lead">
    
    </p>
    <ul class="breadcrumb" style="margin-bottom: 5px;">
        <li>
            <a href="configAdmin.php?view=report">
                <i class="fa fa-plus-circle" aria-hidden="true"></i> &nbsp; Reporte de ventas
            </a>
        </li>
        <li>
            <a href="configAdmin.php?view=providerlist"><i class="fa fa-list-ol" aria-hidden="true"></i> &nbsp; Reporte de clientes</a>
        </li>
    </ul>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <br><br>
                <div class="panel panel-info">
                    <div class="panel-heading text-center"><h4>Reporte</h4></div>
                  
                </div>
                <div id="chart_div"></div>
                
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
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
            <?php
            while($prov=mysqli_fetch_array($proveedores, MYSQLI_ASSOC)){
                echo "['".$prov['CodigoProd']."', ".$prov['CantidadProductos']."],";
            }
            ?>
        ]);


        // Set chart options
        var options = {'title':'Nivel de ventas por producto',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
