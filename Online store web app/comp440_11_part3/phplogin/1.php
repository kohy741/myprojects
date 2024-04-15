<?php 
    include("connection.php");
    session_start();
    $isLogin=$_SESSION['isLogin'] ;
    
    if(!$isLogin){
        echo "Only registered users have access.";
        exit;
    }
    echo "hi, ". $_SESSION['username']."!";
    $sql = "SELECT C.name as category,I.item_id, I.title, I.price
    FROM items I,categories C 
    where  I.item_id = C.item_id and (C.name, I.price) in (
        SELECT C.name, MAX(I.price) AS max_price
        FROM categories C , items I 
        where C.item_id = I.item_id
        GROUP BY C.name
    )
    ORDER BY C.name;";  
    $result = mysqli_query($conn, $sql);  
?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>1</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  </head>
  <body>

    <br><br><a class="btn btn-dark btn-lg" href="cards.php" role="button">back</a>
    <h1 class="mb-3">the most expensive items in each category</h1>
    <div>
      <table class="table table-striped">
          <thead>
              <tr>
                <th scope="col">Category</th>
                <th scope="col">item#</th>
                <th scope="col">item</th>
                <th scope="col">Price</th>
              </tr>
          </thead>
          <tbody>
          <?php 
                while($row = mysqli_fetch_assoc($result)){ ?>
                  <tr>
                      <th scope="row"><?php echo $row['category']; ?></th>
                      <td><?php echo $row['item_id'];?></a></td>
                      <td><?php echo $row['title']; ?></td>
                      <td><?php echo '$'.$row['price']; ?></td>
                  </tr>
          <?php } ?>
          </tbody>
      </table>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
  </body>
</html>