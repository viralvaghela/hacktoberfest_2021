
  
#### Simple CRUD Code Igniter
Setting database di "Application/config/development/database.php" nama dan user database and.
Jalankan Database Migration :
http://{url}/migrate
Untuk Login ke aplikasi :
http://{url}/auth

#### 1. Admin
		username : admin
		password : admin123
#### 2. Member
		username : lukisanjaya
		password : admin123
#### 3.  Hak Akses Menu 
### Admin
- Dashboard Admin
- List users > hanya role = 2 (member) yang ditampilkan
- Create User > ketika tambah user otomatis role =2 (member)
- Edit User
- Detail User 
- Delete User
- Change Password

### Member
- Dashboard Member
- Change Password

### Menu lain
- Login
- Register > ketika register otomatis role =2 (member)