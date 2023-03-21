import 'dart:collection';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'qualaroo_method_channel.dart';

abstract class QualarooPlatform extends PlatformInterface {
  /// Constructs a QualarooPlatform.
  QualarooPlatform() : super(token: _token);

  static final Object _token = Object();

  static QualarooPlatform _instance = MethodChannelQualaroo();

  /// The default instance of [QualarooPlatform] to use.
  ///
  /// Defaults to [MethodChannelQualaroo].
  static QualarooPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QualarooPlatform] when
  /// they register themselves.
  static set instance(QualarooPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future initMethodCall(String qualarooKey, String surveyAlise,
      HashMap<String, dynamic> userProperties) {
    return _instance.initMethodCall(qualarooKey, surveyAlise, userProperties);
  }
}
