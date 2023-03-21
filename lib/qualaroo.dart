
import 'dart:collection';

import 'qualaroo_platform_interface.dart';

class Qualaroo {
  Future<String?> getPlatformVersion() {
    return QualarooPlatform.instance.getPlatformVersion();
  }
  Future initMethodCall(String qualarooKey,String surveyKey,HashMap<String, dynamic> userProperties) {
    return QualarooPlatform.instance.initMethodCall(qualarooKey,surveyKey,userProperties);
  }

}
