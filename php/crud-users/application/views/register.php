<?php $this->load->view('admin/partials/header');?>
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register</div>
      <div class="card-body">
      <?php if(isset($_GET['alert'])){ ?>
        <div class="alert alert-danger alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <?=$_GET['alert']?>
        </div>
      <?php } ?>
        <form action="<?=base_url('auth/register_action')?>" method="POST">
            <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="username">Username</label>
                  <input type="text" maxlength="255" class="form-control" id="username" placeholder="Username" name="username" value="<?=(!empty(set_value('username')))? htmlspecialchars(set_value('username')):'';?>">
                  <?php echo form_error('username') ?>
                </div>
                <div class="form-group col-md-6">
                  <label for="email">Email</label>
                  <input type="email" maxlength="255" class="form-control" id="email" placeholder="Email" name="email" required value="<?=(!empty(set_value('email')))? htmlspecialchars(set_value('email')):'';?>">
                  <?php echo form_error('email') ?>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="password">Password</label>
                  <input type="password" maxlength="255" class="form-control" id="password" placeholder="Password" name="password" required>
                  <?php echo form_error('password') ?>
                </div>
                <div class="form-group col-md-6">
                  <label for="password_conf">Konfirmasi Password</label>
                  <input type="password" maxlength="255" class="form-control" id="password_conf" placeholder="Konfirmasi Password" name="password_conf" required>
                  <?php echo form_error('password_conf') ?>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="firstname">Firstname</label>
                  <input type="text" maxlength="255" class="form-control" id="firstname" placeholder="Firstname" name="firstname" required value="<?=(!empty(set_value('firstname')))? htmlspecialchars(set_value('firstname')):'';?>">
                  <?php echo form_error('firstname') ?>
                </div>
                <div class="form-group col-md-6">
                  <label for="lastname">Lastname</label>
                  <input type="text" maxlength="255" class="form-control" id="lastname" placeholder="Lastname" name="lastname" required value="<?=(!empty(set_value('lastname')))? htmlspecialchars(set_value('lastname')):'';?>">
                  <?php echo form_error('lastname') ?>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="tempat-lahir">Tempat Lahir</label>
                  <input type="text" maxlength="255" class="form-control" id="tempat-lahir" placeholder="Tempat Lahir" name="tempat_lahir" required value="<?=(!empty(set_value('tempat_lahir')))? htmlspecialchars(set_value('tempat_lahir')):'';?>">
                  <?php echo form_error('tempat_lahir') ?>
                </div>
                <div class="form-group col-md-6">
                  <label for="tanggal-lahir">Tanggal Lahir</label>
                  <input type="date" maxlength="6" class="form-control" id="tanggal-lahir" placeholder="Tanggal Lahir" name="tanggal_lahir" required value="<?=(!empty(set_value('tanggal_lahir')))? htmlspecialchars(set_value('tanggal_lahir')):'';?>">
                  <?php echo form_error('tanggal_lahir') ?>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="alamat">Alamat</label>
                  <input type="text" class="form-control" name="alamat" maxlength="255" id="alamat" placeholder="1234 Main St" value="<?=(!empty(set_value('alamat')))? htmlspecialchars(set_value('alamat')):'';?>"> 
                  <?php echo form_error('alamat') ?>
                </div>
                <div class="form-group col-md-6">
                  <label for="handphone">Handphone</label>
                  <input type="text" minlength="10" maxlength="15" class="form-control" id="handphone" placeholder="082349195324" name="handphone" required value="<?=(!empty(set_value('handphone')))? htmlspecialchars(set_value('handphone')):'';?>">
                  <?php echo form_error('handphone') ?>
                </div>
            </div>
          <button type="submit" class="btn btn-primary btn-block">Register</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="<?=base_url('auth/auth')?>">Login to Account</a>
        </div>
      </div>
    </div>
  </div>

    <!-- Bootstrap core JavaScript-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

</body>

</html>
