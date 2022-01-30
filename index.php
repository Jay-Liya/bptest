<!DOCTYPE html>
<html>
<head>
    <title>BP - Products</title>
    <!-- Bootstrap CSS 5.1.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-4" id="app">
        <h1 class="py-4">Products List</h1>
        <?php
        // check search button clicked or not
        if(isset($_POST['submit']))
        {
            $searchfor = $_POST['txtsearch'];
            $searchby = $_POST['cmbsearch'];
        }
        else {
            $searchfor = '';
            $searchby = 'unitprice';
        }
        ?>
        <!-- form for searching -->
        <form method="post" action="<?php echo filter_var($_SERVER['PHP_SELF'], FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH); ?>">
            <div class="row g-3 py-3">
                <div class="col-md-3">
                    <select class="form-select" id="cmbsearch" name="cmbsearch">
                        <option value="style">Search by Style</option>
                        <option value="description">Search by Description</option>
                        <option value="unitprice">Search by Price</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <input class="form-control" type="text" id="txtsearch" name="txtsearch" placeholder="Search for ...">
                </div>
                <div class="col-md-6">
                    <button class="btn btn-outline-secondary px-4" type="submit" name="submit">Search</button>
                </div>
            </div>
        </form>
        <?php
        // check sorting field set or not
        if(isset($_GET['order'])){
            $order = $_GET['order'];
        }
        else {
            $order = 'productid';
        }
        // check sorting method set or not
        if(isset($_GET['sort'])){
            $sort = $_GET['sort'];
        }
        else {
            $sort = 'DESC';
        }
        $sort == 'DESC' ? $sort = 'ASC' : $sort = 'DESC';
        ?>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Product ID</th>
                <th scope="col">Style</th>
                <th scope="col"><a href='<?php echo "?order=description&&sort=$sort";?>'>Description</a></th>
                <th scope="col">Ext Description</th>
                <th scope="col"><a href='<?php echo "?order=unitprice&&sort=$sort";?>'>Price</a></th>
            </tr>
            </thead>
            <?php
                // include database connection and TableRows files
                include 'DBConnect.php';
                include 'TableRows.php';
                // prepare sql for listing, sorting and searching
                $sql = "SELECT productid,style,description,extdescription,unitprice FROM bp_product 
                        INNER JOIN bp_price ON bp_product.productid = bp_price.product WHERE {$searchby} LIKE '%{$searchfor}%' ORDER BY {$order} {$sort};";
                $stmt = $conn->prepare($sql);
                $stmt->execute();
            
                $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
                foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
                    echo $v;
                }
                
                $conn = null;
            ?>
        </table>
    </div>
</body>
</html> 