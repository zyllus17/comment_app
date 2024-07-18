import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService(this._remoteConfig);

  Future<void> fetchAndActivate() async {
    await _remoteConfig.fetchAndActivate();
  }

  bool get maskEmail => _remoteConfig.getBool('mask_email');
}

Future<RemoteConfigService> initRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await remoteConfig.setDefaults(<String, dynamic>{
    'mask_email': true,
  });

  return RemoteConfigService(remoteConfig);
}
