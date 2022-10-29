<?php

  require('top.inc.php');

  if(isset($_GET['type']) && $_GET['type']!='')
  {
    $type=get_safe_value($con,$_GET['type']);
    if($type=='status')
    {
      $operation=get_safe_value($con,$_GET['operation']);
      $id=get_safe_value($con,$_GET['id']);
      if($operation=='active')
      {
        $status='1';
      }
      else
      {
        $status='0';
      }
      $update_status_sql="update categories set status='$status' where id='$id'";
      mysqli_query($con,$update_status_sql);
    }
    
    if($type=='delete')
    {
      $id=get_safe_value($con,$_GET['id']);
      $delete_sql="delete from categories where id='$id'";
      mysqli_query($con,$delete_sql);
    }
  }

  $sql="select * from categories order by categories asc";
  $res=mysqli_query($con,$sql);
?>

<div class="content pb-0">
  <div class="orders">
    <div class="row">
      <div class="col-xl-12">
        <div class="card">
          <div class="card-body">
            <h4 class="box-title">Categories </h4>
          </div>

          <div class="card-body--">
            <div class="table-stats order-table ov-h">
              <table class="table ">

                <thead>
                  <tr>
                    <th class="serial">#</th>
                    <th>ID</th>
                    <th>Categories</th>
                    <th>Status</th>                    
                  </tr>
                </thead>

                <tbody>

                  <?php 
                    $i = 1;
                    while($row = mysqli_fetch_assoc($res)) { 
                  ?>

                  <tr>
                    <td class="serial"><?php echo $i ?></td>
                    <td><?php echo $row['id'] ?></td>
                    <td><?php echo $row['categories'] ?></td>
                    <td>
                      <?php  
                        if ($row['status']==1)
                        {
                          echo "Active";
                        }
                        else
                        {
                          echo "Deactive";
                        }
                      ?>
                    </td>
                  </tr>
                  <?php } ?>

                </tbody>

              </table>
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