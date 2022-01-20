<?php 
require_once("header.php");
require_once("sidebar.php");


// $fetch_data =$candidate->fetch_assoc();

$candidate=$conn->query("SELECT * FROM `candidate`");
if(isset($_POST['name'])){ 
 $id=$_POST['id'];
 $name=$_POST['name'];
 $email=$_POST['email'];
 $phone=$_POST['phone'];
 $address=$_POST['address'];
 $photo=$_FILES['photo']["name"];
 $dob=$_POST['dob'];
 $gender=$_POST['gender'];
 

 $target_file=date('Y-m-d-h-i-s').basename($_FILES["photo"]["name"]);
 $target="./assets/images/".$target_file;
 move_uploaded_file($_FILES["photo"]["tmp_name"], $target);
 $insert=$conn->query("INSERT INTO `candidate` ( `name`, `email`, `phone`, `address`, `photo`, `dob`, `gender`) VALUES ( '$name', '$email', '$phone', '$address', '$target_file', '$dob', '$gender')");
 // header('location:candidate.php'); ?>

 <script> 
  window.location.assign("candidate_education.php");
</script>

<?php } ?>

<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Add Candidate</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="dashboard.php">Home</a></li>
          <li class="breadcrumb-item active">Add Candidate</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Candidate Information</h3>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
           <form action="" method="post" id="basic-form" enctype="multipart/form-data">
            <table class="table">
              <tr colspan="2">
                
                <th>Name</th>
                <td colspan="4">
                  <input type="text" class="form-control" name="name" value= "">
                </td>
              </tr>
              <tr>
                <th>Email</th>
                <td>
                  <input type="text" class="form-control" name="email" value="">
                </td>
                <th>Phone</th>
                <td>
                  <input type="text" class="form-control" name="phone" value= "">
                </td>
              </tr>
              <tr>
                <th>Address</th>
                <td>
                  <input type="text" class="form-control" name="address" value="">
                </td>
                <th>photo</th>
                <td>
                  <input type="file" class="form-control" name="photo" value= "">
                </td>
              </tr>
              <tr>
                <th>Date of birth</th>
                <td>
                  <input type="date" class="form-control" name="dob" value="">
                </td>
                <th>Gender</th>
                <td>
                  <input type="radio"  name="gender" value= "Male"><span> Male</span>
                  <input type="radio"  name="gender" value= "Female"><span> Female</span>
                </td>
              </tr>
              <tr>
                <td colspan="4">
                  <input type="submit" class="btn btn-block btn-primary" value="Next">
                </td>
              </tr>
            </table>
          </form>
          
          <h3>Candidate List</h3>
          <table class="table table-bordered">
            <tr>
              <th>Serial No.</th>
              <th>Name</th>
              <th>Email</th>
              <th>Phone</th>
              <th>Address</th>       
              <th>photo</th>
              <th>Date of birth</th>
              <th>Gender</th>
              <th>Action</th>
            </tr>
            <?php $i=0;
            $fetch_data=$candidate->fetch_all();
            foreach($fetch_data as $key => $value) {?>
              <tr>
                <td><?php echo ++$i; ?></td>
                <td><?php echo $value[1]; ?></td>
                <td><?php echo $value[2]; ?></td>
                <td><?php echo $value[3]; ?></td>
                <td><?php echo $value[4]; ?></td>
                <td><img width="50" height="50" src="./assets/images/<?php echo $value[5]; ?>"/></td>

                <td><?php echo $value[6]; ?></td>
                <td><?php echo $value[7]; ?></td>
                
                <td>
                  
                  <a href="C_update.php?id=<?php echo $value[0]; ?>" class="btn btn-sm btn-success">Edit</a>||
                  <a href="C_delete.php?id=<?php echo $value[0];?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')" >Delete</a>
                </td>
              </tr>
              <?php
            }
            
                //?>
                
                
              </div>
            </table>
          </div>
          <!-- /.card -->
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>
  

  <?php require("footer.php"); ?>