import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  Future<PermissionStatus> getStoragePermissionStatus() async {
    var status = await Permission.storage.status;
    return status;
  }
}
