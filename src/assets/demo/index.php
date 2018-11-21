<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bakery</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.5.0/css/foundation.min.css">
</head>
<body>
    <div class="grid-x">
        <div class="cell large-6 large-offset-3 medium-10 medium-offset-1">

            <?php
            // Include config file
            require_once "config.php";
            
            // Attempt select query execution
            $sql = "SELECT * FROM bakery";
            if($result = mysqli_query($link, $sql)){
                        if(mysqli_num_rows($result) > 0){
                            echo "<table>";
                                echo "<tbody>";
                                while($row = mysqli_fetch_array($result)){
                                    echo "<tr>";
                                        echo "<td>" . $row . "</td>";
                                    echo "</tr>";
                                }
                                echo "</tbody>";                            
                            echo "</table>";
                            // Free result set
                            mysqli_free_result($result);
                        } else{
                            echo "<p class='lead'><em>No records were found.</em></p>";
                        }
            } else{
                echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
            }
            
            // Close connection
            mysqli_close($link);
            ?>
            
        </div>
    </div>
</body>
</html>