<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
  <?php $this->load->view('admin/partials/header'); ?> 
 <!-- Page level plugin CSS-->

  <?php $this->load->view('admin/partials/navbar'); ?>

  <div class="content-wrapper">
    <div class="container-fluid">
      <?php if(isset($_GET['alert'])){ ?>
        <div class="alert alert-danger alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <?=$_GET['alert']?>
        </div>
      <?php } ?>
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Change Password</div>
        <div class="card-body">
            <form action="<?=base_url('member/change_password_action')?>" method="POST">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="password_lama">Password Lama</label>
                    <input type="password" class="form-control" id="password_lama" placeholder="Password Lama" name="password_lama">
                    <?php echo form_error('password_lama') ?>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="password">Password Baru</label>
                  <input type="password" maxlength="255" class="form-control" id="password" placeholder="Password Baru" name="password" required>
                  <?php echo form_error('password') ?>
                </div>
                <div class="form-group col-md-6">
                  <label for="password_conf">Konfirmasi Password</label>
                  <input type="password" maxlength="255" class="form-control" id="password_conf" placeholder="Konfirmasi Password" name="password_conf" required>
                  <?php echo form_error('password_conf') ?>
                </div>
            </div>
            <button type="submit" name="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
      </div>
    </div>
    <!-- /.container-fluid-->
  
    <?php $this->load->view('admin/partials/footer'); ?>
  </div>
</body>
</html>
