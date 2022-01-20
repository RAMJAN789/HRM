<?php 
require_once("header.php");
require_once("sidebar.php");?>
<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <!-- <h1>Simple Tables</h1> -->
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <!-- <li class="breadcrumb-item active">Simple Tables</li> -->
            </ol>
          </div>
        </div>
      </div>
    </section >
<section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <!-- <h3 class="card-title">Bordered Table</h3> -->
              </div>

         <?php
                $m=$conn->query("SELECT holidayID,`title`,`start_date`,`end_date` FROM `holiday`");
                ?>
              </div>
            
              <div class="container">
                <div class="rowclearfix">
                  <div class="col-md-2">
                    <br>
                    <a href="add_holiday.php" class="button-button-success">ADD HOLIDAY TIME</a>
                  </div>
                  <div class="col-md-12">
                    <h1>HOLIDAY INFORMATION</h1>


                    <table class="table table-striped hover" >
                      <thead>
                        <tr >
                          
                          <th>SL</th>
                          <th>TITLE</th>
                          <th>START DATE</th>
                          <th>END DATE</th>
                          <th>ACTION</th>
                         
                        </tr>
                        
                      </thead>
                      <tr >
                     
                          <?php
                           $i=0;
                   while($ii=$m->fetch_assoc()){?>
                    
                    <td><?php echo++$i?></td>
                        <td><?php echo$ii['title'];?></td>
                        <td><?php echo$ii['start_date'];?></td>
                        <td><?php echo$ii['end_date']; ?></td>

                        <td>
                          <a class=" btn btn-info btn-sm" href="holiday_updated.php?ff=<?php echo $ii['holidayID'] ?>">EDIT</a>
    
                           | 
                    <a href="holiday_delete.php?ff=<?php echo $ii['holidayID'] ?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>

                          </td>
                         </tr>
                         <?php } ?> 
                        
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