  <?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
  <?php $this->load->view('admin/partials/header'); ?> 
 <!-- Page level plugin CSS-->
  <link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" rel="stylesheet">

  <?php $this->load->view('admin/partials/navbar'); ?>

  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="<?=admin_url('user')?>">Users</a>
        </li>
        <li class="breadcrumb-item active">List Users</li>
      </ol>
      <?php if(isset($_GET['alert'])){ ?>
        <div class="alert alert-success alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <?=$_GET['alert']?>
        </div>
      <?php } ?>
      <div id="alert" style="display:none;">
        <div class="alert alert-success alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          Berhasil Menghapus Data
        </div>
      </div>
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Data Users <a href="<?=base_url('secretadmin/user/create')?>" class="btn btn-primary btn-xs pull-right">Create</a>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Full Name</th>
                  <th>Email</th>
                  <th>Username</th>
                  <th>Opsi</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
          </div>
        </div>
        <!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
      </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->

    <?php $this->load->view('admin/partials/footer'); ?>
    <!-- Page level plugin JavaScript-->
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

    <!-- Custom scripts for this page-->
    <script>

        var table;

        $(document).ready(function() {
            //datatables
            table = $('#dataTable').DataTable({ 
                "processing": true, //Feature control the processing indicator.
                "serverSide": true, //Feature control DataTables' server-side processing mode.
                "order": [], //Initial no order.
                // Load data for the table's content from an Ajax source
                "ajax": {
                    "url": '<?php echo admin_url('user/dataTable') ?>',
                    "type": "POST"
                },
                //Set column definition initialisation properties.
                "columns": [
                    {"data": "fullname", "searchable": false},
                    {"data": "email"},
                    {"data": "username"},
                    {"data": "opsi", "searchable": false}
                ],

            });
        });

        $("#dataTable").on( "click", ".btn-delete", function() {
            var sendData = {
              id : $(this).attr('data-id')
            };
            var confirmed = confirm('Yakin, ingin hapus item ini?');
            if (confirmed) {
              console.log(1);
              
                $.ajax({
                  type: "POST",
                  url: "<?=base_url('api/user/delete')?>",
                  data: sendData,
                  dataType: "json",
                  success: function (response) {
                    table.ajax.reload();
                    $('#alert').show();
                  }
                });
            }
        });

        $("#dataTable").on( "click", ".btn-detail", function() {
            var sendData = {
              id : $(this).attr('data-id')
            };
            $.ajax({
              type: "POST",
              url: "<?=base_url('api/user/show')?>",
              data: sendData,
              dataType: "json",
              success: function (response) {
                modal_detail(response.data);
              }
            });
            $('#modal-detail').modal('show');
        });

        function modal_detail(data){
            $('#modal-detail #firstname').text(data.firstname);
            $('#modal-detail #lastname').text(data.lastname);
            let role;
            if (data.role == 2) {
              role = 'Member';
            } else if (data.role == 1) {
              role = 'Admin';
            }
            $('#modal-detail #role').text(role);
            $('#modal-detail #email').text(data.email);
            $('#modal-detail #ttl').text(data.tempat_lahir + ', ' + data.tanggal_lahir);
            $('#modal-detail #alamat').text(data.alamat);
            $('#modal-detail #handphone').text(data.handphone);
            $('#modal-detail #username').text(data.username);
        }
    </script>
  </div>
  
    <!-- Modal Detail-->
    <div class="modal fade" id="modal-detail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Detail User</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            <table class="table table-striped">
              <tbody>
                <tr>
                  <th scope="row">Firsname</th>
                  <td><span id="firstname"></span></td>
                </tr>
                <tr>
                  <th scope="row">Lastname</th>
                  <td><span id="lastname"></span></td>
                </tr>
                <tr>
                  <th scope="row">Role</th>
                  <td><span id="role"></span></td>
                </tr>
                <tr>
                  <th scope="row">Email</th>
                  <td><span id="email"></span></td>
                </tr>
                <tr>
                  <th scope="row">Tempat, Tanggal Lahir</th>
                  <td><span id="ttl"></span></td>
                </tr>
                <tr>
                  <th scope="row">Alamat</th>
                  <td><span id="alamat"></span></td>
                </tr>
                <tr>
                  <th scope="row">Handphone</th>
                  <td><span id="handphone"></span></td>
                </tr>
                <tr>
                  <th scope="row">Username</th>
                  <td><span id="username"></span></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
  
</body>
</html>
