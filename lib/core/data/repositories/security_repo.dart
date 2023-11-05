/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UserDeviceInfo {
  final DeviceInfoPlugin _deviceInfoPlugin;

  UserDeviceInfo(this._deviceInfoPlugin);
  Future<String> getDeviceId() async {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        final info = await _deviceInfoPlugin.androidInfo;
        return info.id;
      case TargetPlatform.fuchsia:
        return '';

      // TODO: Handle this case.
      case TargetPlatform.iOS:
        return '';
      case TargetPlatform.linux:
        return '';
      case TargetPlatform.macOS:
        final info = await _deviceInfoPlugin.macOsInfo;
        return info.computerName;
      case TargetPlatform.windows:
        final info = await _deviceInfoPlugin.windowsInfo;

        return info.deviceId;
    }

  }
}

@LazySingleton()
class SecurityRepo {
  final FirebaseFirestore _firestore;
  final UserDeviceInfo _deviceInfo;

  SecurityRepo(this._firestore, this._deviceInfo);
  Future<bool> isActive() async {
    final deviceId = await _deviceInfo.getDeviceId();
    final document = _firestore.collection('devices').doc(deviceId);
    final result = await document.get();
    final data = result.data();
    print(data);
    if (data == null) {
      await document.set(Device(id: deviceId).toMap());
      return false;
    } else {
      final device = Device.fromMap(data);
      return device.isActive;
    }
  }
}

class Device {
  final String id;
  final bool isActive;

  Device({required this.id, this.isActive = false});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'is_active': this.isActive,
    };
  }

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      id: map['id'] as String,
      isActive: map['is_active'] as bool,
    );
  }
}
*/
