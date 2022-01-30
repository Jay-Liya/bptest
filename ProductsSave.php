<?php
    include 'DBConnect.php';
    
    // prepare sql and bind parameters for bp_product table
    $sql = "INSERT INTO bp_product (productid, style, description, extdescription)
VALUES (:productid, :style, :description, :extdescription)";
    $st = $conn->prepare($sql);

    // prepare sql and bind parameters for bp_price table
    $sql_price = "INSERT INTO bp_price (product, price_index, currency, baseunitprice, unitprice)
VALUES (:product, :price_index, :currency, :baseunitprice, :unitprice)";
    $st_price = $conn->prepare($sql_price);

    // get json format product data from api
    $url = 'https://www.blackpepper.co.nz/api/candidate/products';
    $result = file_get_contents($url);
    $array = json_decode($result, true);
    $count = 0;
    
    foreach ($array["data"] as $product) {

        // bind values and execute statement in a loop for product
        $st->bindValue( ':productid', $product['productid'],PDO::PARAM_INT );
        $st->bindValue( ':style', $product['style'],PDO::PARAM_STR );
        $st->bindValue( ':description', $product['description'], PDO::PARAM_STR );
        $st->bindValue( ':extdescription', $product['extdescription'], PDO::PARAM_STR );
        $st->execute();

        $price_index = 0;
        foreach ($product["price"] as $price) {

            // bind values and execute statement in a loop for product price
            $st_price->bindValue( ':product', $product['productid'],PDO::PARAM_INT );
            $st_price->bindValue( ':price_index', $price_index,PDO::PARAM_INT );
            $st_price->bindValue( ':currency', $price['currency'], PDO::PARAM_STR );
            $st_price->bindValue( ':baseunitprice', $price['baseunitprice'], PDO::PARAM_STR );
            $st_price->bindValue( ':unitprice', $price['unitprice'], PDO::PARAM_STR );
            $st_price->execute();
            $price_index++;
        }
        
        $count++;
    }
    
    // display number of products added
    if($count==0) {
        echo "<h1>No products added.</h1>";
    }
    else {
        echo "<h1>".$count." products successfully added.</h1>";
    }
    
    $conn = null;