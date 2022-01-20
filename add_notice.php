<?php 
require_once("header.php");
require_once("sidebar.php");

$db=$conn->query("SELECT * FROM `notice`");

if(isset($_POST['title'])){
  $title=$_POST["title"];
  $date=$_POST["date"];
  $details=$_POST["details"];

  $conn->query("INSERT INTO `notice` (`title`, `date`, `details`) VALUES ('$title', '$date', '$details')");

  header('location:add_notice.php');
  
}
?>

<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Notice</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">Notice</li>
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
            <h3 class="card-title">Notice</h3>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
           <h1>Add Notice</h1>
           <form action="" method="post">
            <div class="row">
            <div class="col-6">
              <div class="form-group">
               <label for="title">Title</label>
               <input type="text" name="title" class="form-control" placeholder="Title">
             </div>
           </div>
           <div class="col-6">
            <div class="form-group">
             <label for="date">Date</label>
             <input type="text" name="date" class="form-control" placeholder="Date">
           </div>
         </div>
         </div>
         <div class="row">
           <div class="col-12">
          <div class="form-group">        
              <textarea name="details" id="" cols="130" rows="10" placeholder="Details"></textarea>  
          </div>
        </div>
        </div>
        <input type="submit" class="btn btn-block btn-success" value="Submit">
      </form>
      <h2>Notice List</h2>
      <table class="table table-bordered">
        <tr>
          <th>Title</th>
          <th>Date</th>
          <th>Details</th>
          <th>Action</th>
        </tr>
        <tr>
          <?php 
          while($i=$db->fetch_assoc()){?>

            <td><?php echo $i['title'] ?></td>
            <td><?php echo $i['date'] ?></td>
            <td><?php echo $i['details'] ?></td>
            <td>
              <a href="update_notice.php?id=<?php echo $i['id'] ?>" class="btn btn-xs btn-primary">Edit</a>
              <a href="delete_notice.php?id=<?php echo $i['id'] ?>" class="btn btn-xs btn-danger">Delete</a>
            </td>
          </tr>
        <?php } ?>
      </table>
    </div>
  </div>
  <!-- /.card -->
</div>
</div>
</div><!-- /.container-fluid -->
</section>

<?php require("footer.php"); ?>