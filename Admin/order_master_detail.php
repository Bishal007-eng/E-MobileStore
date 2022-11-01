<?php

	require('top.inc.php');

	$order_id=get_safe_value($con,$_GET['id']);

	if(isset($_POST['update_order_status']))
	{
		$update_order_status=$_POST['update_order_status'];

		if($update_order_status=='5')
		{
			mysqli_query($con,"update `order` set order_status='$update_order_status',payment_status='Success' where id='$order_id'");
		}
		else
		{
			mysqli_query($con,"update `order` set order_status='$update_order_status' where id='$order_id'");
		}
		
	}
?>


<div class="content pb-0">
	<div class="orders">
	  <div class="row">
		  <div class="col-xl-12">
			 	<div class="card">
					<div class="card-body">
				   	<h4 class="box-title">Order Detail </h4>
					</div>
					<div class="card-body--">
				   	<div class="table-stats order-table ov-h">

					  	<table class="table">

								<thead>

									<tr>
										<th class="product-thumbnail">Product Name</th>
										<th class="product-thumbnail">Product Image</th>
										<th class="product-name">Qty</th>
										<th class="product-price">Price</th>
										<th class="product-price">Total Price</th>
									</tr>

								</thead>

								<tbody>

									<?php
										$res=mysqli_query($con,"select distinct(order_detail.id) ,order_detail.*,product.name,product.image,`order`.address,`order`.city,`order`.pincode 
											from order_detail,product ,`order` where order_detail.order_id='$order_id' and  order_detail.product_id=product.id 
											GROUP by order_detail.id");
										$total_price=0;
										
										$userInfo=mysqli_fetch_assoc(mysqli_query($con,"select * from `order` where id='$order_id'"));
										
										$address=$userInfo['address'];
										$city=$userInfo['city'];
										$pincode=$userInfo['pincode'];
										
										while($row=mysqli_fetch_assoc($res)){
										
										$total_price=$total_price+($row['qty']*$row['price']);
									?>

									<tr>
										<td class="product-name"><?php echo $row['name']?></td>
										<td class="product-name"> <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$row['image']?>"></td>
										<td class="product-name"><?php echo $row['qty']?></td>
										<td class="product-name">Rs. <?php echo $row['price']?></td>
										<td class="product-name">Rs. <?php echo $row['qty']*$row['price']?></td>
										
									</tr>

									<?php } ?>

									<tr>
										<td colspan="3"></td>
										<td class="product-name">Total Price:</td>
										<td class="product-name">Rs. <?php echo $total_price?></td>										
									</tr>

								</tbody>
							
							</table>

							<div id="address_details">
								<strong>Address : &nbsp;</strong>

								<?php echo $address?>, <?php echo $city?>, <?php echo $pincode?><br/><br/>

								<strong>Order Status : &nbsp;</strong>
								
								<?php 
									$order_status_arr=mysqli_fetch_assoc(mysqli_query($con,"select order_status.name 
										from order_status,`order` where `order`.id='$order_id' and `order`.order_status=order_status.id"));
									echo $order_status_arr['name'];
								?>
							
								<div>

									<form method="post">

										<select class="form-control" name="update_order_status" required>

											<option value="">Select Status</option>
											<?php
												$res=mysqli_query($con,"select * from order_status");
												while($row=mysqli_fetch_assoc($res)){
													if($row['id']==$categories_id){
														echo "<option selected value=".$row['id'].">".$row['name']."</option>";
													}else{
														echo "<option value=".$row['id'].">".$row['name']."</option>";
													}
												}
											?>

										</select>

										<input type="submit" class="form-control"/>
									</form>

								</div>

							</div>
				   	</div>
					</div>
			 	</div>
		  </div>
	  </div>
	</div>
</div>


<?php

	require('footer.inc.php');

?>