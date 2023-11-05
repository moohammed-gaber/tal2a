import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HelpersModule {
/*
  @lazySingleton
  FirebaseFirestore get firebaseFireStore => FirebaseFirestore.instance;
*/
  @lazySingleton
  DeviceInfoPlugin get deviceInfoPlugin => DeviceInfoPlugin();
}
