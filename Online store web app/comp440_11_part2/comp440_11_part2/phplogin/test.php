
<?php
    include("connection.php");
    session_start();
    $isLogin=$_SESSION['isLogin'] ;
    
    if(!$isLogin){
        echo "Only registered users have access.";
        exit;
    }   

    $item_id = $_GET['item_id'];
    $detail = "select * from items where item_id = $item_id";  
    $result = mysqli_query($conn, $detail);  
    $row = mysqli_fetch_assoc($result);


?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>view</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  </head>
  <body>
    <h1><?php echo $row['title']?></h1>
    <table class="table table-bordered mb-3" >
        <tbody>
            <tr>
                <th scope="col">Description</th>
                <td><?php echo nl2br($row['description']) ?></td>
            </tr>

            <tr>
                <th scope="col">Seller</th>
                <td><?php echo $row['username']?></td>     
            </tr>

            <tr>
                <th scope="col">uploaded date</th>
                <td><?php echo $row['date']?></td>     
            </tr>

            <tr>
                <th scope="col">Price</th>
                <td><?php echo "$".$row['price']?></td>
            </tr>

            <tr>
                <th scope="col">Category</th>
                <td><?php echo $row['category']?></td>
            </tr>
        </tbody>
    </table>
    <button type="button" onclick="location.href='review.php?item_id=<?php echo $item_id?>'" class="btn btn-info btn-lg">Write a review</button></br></br>
    <a class="btn btn-dark" href="list.php" role="button">back to list</a>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  </body>
</html>