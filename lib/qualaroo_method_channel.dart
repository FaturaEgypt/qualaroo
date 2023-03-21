import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:qualaroo/constants.dart';

import 'qualaroo_platform_interface.dart';

/// An implementation of [QualarooPlatform] that uses method channels.
class MethodChannelQualaroo extends QualarooPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('qualaroo');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future initMethodCall(String qualarooKey, String surveyAlise,
      HashMap<String, dynamic> userProperties) async {
    await methodChannel.invokeMethod<String>(Constants.INIT_METHOD_CALL, {
      Constants.Qualaroo_KEY: qualarooKey,
      Constants.Qualaroo_alise: surveyAlise,
      Constants.SEND_USER_DATA: userProperties,
    });
  }
}
