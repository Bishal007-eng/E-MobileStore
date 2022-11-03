
<?php

	require('connection.inc.php');
	require('functions.inc.php');
  require('add_to_cart.inc.php');

	$cat_res=mysqli_query($con,"select * from categories where status=1 order by categories asc");
	$cat_arr=array();
	while($row=mysqli_fetch_assoc($cat_res)){
		$cat_arr[]=$row;	
	}

  $obj=new add_to_cart();
  $totalProduct=$obj->totalProduct();

  if(isset($_SESSION['USER_LOGIN'])){
    $uid=$_SESSION['USER_ID'];
    
    if(isset($_GET['wishlist_id'])){
      $wid=get_safe_value($con,$_GET['wishlist_id']);
      mysqli_query($con,"delete from wishlist where id='$wid' and user_id='$uid'");
    }
  
    $wishlist_count=mysqli_num_rows(mysqli_query($con,"select product.name,product.image,product.price,product.mrp,wishlist.id 
      from product,wishlist where wishlist.product_id=product.id and wishlist.user_id='$uid'"));
  }

?>

<!doctype html>
<html class="no-js" lang="en">
	<head>
			<meta charset="utf-8">
			<meta http-equiv="x-ua-compatible" content="ie=edge">
			<title>E-Mobile Shop</title>
			<meta name="description" content="">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link rel="stylesheet" href="css/bootstrap.min.css">
			<link rel="stylesheet" href="css/owl.carousel.min.css">
			<link rel="stylesheet" href="css/owl.theme.default.min.css">
			<link rel="stylesheet" href="css/core.css">
			<link rel="stylesheet" href="css/shortcode/shortcodes.css">
			<link rel="stylesheet" href="style.css">
			<link rel="stylesheet" href="css/responsive.css">
			<link rel="stylesheet" href="css/custom.css">
		<script src="js/vendor/modernizr-3.5.0.min.js"></script>


    


	</head>
<body>

  <!--[if lt IE 8]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
  <![endif]--> 

  <div class="wrapper">
    <header id="htc__header" class="htc__header__area header--one">
      <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header">
        <div class="container">
          <div class="row">
            <div class="menumenu__container clearfix">
              <div class="col-lg-2 col-md-2 col-sm-3 col-xs-7"> 
                <div class="logo">
                  <a href="index.php">E-Mobile Shop</a>
                </div>
              </div>

              
              <div class="col-md-7 col-lg-6 col-sm-5 col-xs-3">
                <nav class="main__menu__nav hidden-xs hidden-sm">
                  <ul class="main__menu">
                    <li class="drop"><a href="index.php">Home</a></li>
                    <?php
											foreach($cat_arr as $list){
										?>
										<li><a href="categories.php?id=<?php echo $list['id']?>"><?php echo $list['categories']?></a></li>
										<?php
											}
										?>
                    <li><a href="contact.php">contact</a></li>
                  </ul>
                </nav>



                <div class="mobile-menu clearfix visible-xs visible-sm">
                  <nav id="mobile_dropdown">
                    <ul>
                      <li><a href="index.php">Home</a></li>
                      <?php
												foreach($cat_arr as $list){
											?>
											<li><a href="categories.php?id=<?php echo $list['id']?>"><?php echo $list['categories']?></a></li>
											<?php
												}
											?>
                      <li><a href="contact.php">contact</a></li>
                    </ul>
                  </nav>
                </div>  
              </div>
							


              <div class="col-md-3 col-lg-4 col-sm-4 col-xs-4">
                <div class="header__right">
                  <div class="header__search search search__open">
                    <a href="#"><i class="icon-magnifier icons"></i></a>
                  </div> &nbsp; &nbsp;
                  <div class="header__account">
                    <?php 
                      if(isset($_SESSION['USER_LOGIN']))
                      {
                        echo 
                        '<a href="logout.php">Logout</a> 
                        <a href="my_order.php">My Order</a>'
                        ;
                        
                      }
                      else
                      {                       
                        echo '<a href="login.php">Login/Register</a>';
                      }
                    ?>

                  </div>

                  &nbsp;
                  <div class="htc__shopping__cart">
                  <?php
										if(isset($_SESSION['USER_ID'])){
										?>
										<a href="wishlist.php"><i class="icon-heart icons"></i></a>
                    <a href="wishlist.php"><span class="htc__wishlist"><?php echo $wishlist_count ?></span></a>
										<?php } ?> &nbsp;
                    <a href="cart.php"><i class="icon-handbag icons"></i></a>
                    <a href="cart.php"><span class="htc__qua"><?php echo $totalProduct ?></span></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="mobile-menu-area"></div>
        </div>
      </div>
    </header>

    <div class="body__overlay"></div>
		<div class="offset__wrapper">
      <div class="search__area">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="search__inner">
                <form action="search.php" method="get">
                  <input placeholder="Search here... " type="text" name="str">
                  <button type="submit"></button>
                </form>
                <div class="search__close__btn">
                  <span class="search__close__btn_icon"><i class="zmdi zmdi-close"></i></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>