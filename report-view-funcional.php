
<?php
$con = mysqli_connect("localhost","root","","fasse");

$sql ="SELECT * FROM `pie_chart`";

$res = $con->query($sql);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            while($fila = $res->fetch_assoc()){
                echo "['".$fila[ingredientes]."', ".$fila[rebanadas]."],";
            }
            ?>
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

</head>
<body>
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
</body>
</html>