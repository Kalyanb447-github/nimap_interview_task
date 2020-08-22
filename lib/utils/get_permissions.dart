import 'package:permission_handler/permission_handler.dart';

Future<bool> getStoragePermission() async {
  Map<Permission, PermissionStatus> permissionStatus = await [
    Permission.storage,
  ].request();
}
