<?php 
require_once("header.php");
require_once("sidebar.php");?>


<?php


if(isset($_POST['date'])){

  $date=$_POST['date'];


   $m=$conn->query("SELECT`paymentID`, employee.name,`payment_date`,`amount`,`payment_method`,bankID,salary_month.month FROM `salary_payment` JOIN employee ON employee.empID=salary_payment.empID JOIN salary_month ON salary_month.id=salary_payment.monthID where payment_date ='$date'");
 }else{

  $m=$conn->query("SELECT`paymentID`, employee.name,`payment_date`,`amount`,`payment_method`,bankID,salary_month.month FROM `salary_payment` JOIN employee ON employee.empID=salary_payment.empID JOIN salary_month ON salary_month.id=salary_payment.monthID ");
   
 }
  ?>

 


<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Simple Tables</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Simple Tables</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section >
<section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Bordered Table</h3>
              </div>






            </div>
            <!-- /.card-header -->
            <div class="container">
              <div class="rowclearfix">
                <div class="col-md-2">
                  <br>
                  <a href="#" class="button-button-success"></a>



                </div>
                  <form action="" method="POST"> 
          <div class="col-md-6">

            <input type="date" name="date" class='form-control' placeholder="Search By date" value="" > 


          </div>
          <div class="col-md-6 text-left">
               <td colspan="8">
        <input type="submit"  class="btn btn-block btn-primary" value="Save">
          </div>
        </form>




                <div>
               
                <div class="col-md-12">
                  <h1>salary payment</h1>
                  <table class="table table-bordered table-striped hover" >
                    <thead >

                      <tr >

                       <!--  <th>paymentID</th> -->

                       <th>Emp Name</th>
                       <th>Payment Date </th>
                       <th>Amount</th>
                       <th>Payment Method</th>
                       <th>Bank Name</th>
                       <th>Month Name</th>
                       <th>ACTION</th>



                     </tr>

                     
                   </thead>
                   
                   <tr >

                    <?php 
                    $sum =0;
                    while($ii=$m->fetch_assoc()){ $sum = $sum + $ii['amount'];
$bankname='';
                    if ($ii['bankID']>0) {




   $b=$conn->query("SELECT `bankID`, `bank_name` FROM `bank` WHERE bankID=".$ii['bankID'] );
              $p=$b->fetch_assoc(); 
               $bankname=$p['bank_name'];
                     
                      
                   }

                    

                    ?>


                      <td><?php echo$ii['name'];?></td>
                      <td><?php echo$ii['payment_date'];?></td>
                      <td><?php echo$ii['amount']; ?></td>
                      <td><?php echo$ii['payment_method']; ?></td>
                      <td><?php echo $bankname;?></td>
                      <td><?php echo$ii['month']; ?></td>


                      <td>
                       



                       <a href="paymentdelete.php?mm=<?php echo $ii['paymentID'] ?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>

                     </td>
                   </tr>
                 <?php } ?> 

                  <tr >
                          <th class="align-middle text-center" colspan ="2">total</th>
                          <td ><?php echo $sum; ?></td>
                        </tr>

               </table>

             </div>



           </div>

         </div>


       </div>

     </div>
   </div>
   <!-- /.card -->
 </div>
</div>
</div><!-- /.container-fluid -->
</section>

<?php require("footer.php"); ?>