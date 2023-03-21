import 'package:flutter_test/flutter_test.dart';
import 'package:qualaroo/qualaroo.dart';
import 'package:qualaroo/qualaroo_platform_interface.dart';
import 'package:qualaroo/qualaroo_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQualarooPlatform
    with MockPlatformInterfaceMixin
    implements QualarooPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final QualarooPlatform initialPlatform = QualarooPlatform.instance;

  test('$MethodChannelQualaroo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQualaroo>());
  });

  test('getPlatformVersion', () async {
    Qualaroo qualarooPlugin = Qualaroo();
    MockQualarooPlatform fakePlatform = MockQualarooPlatform();
    QualarooPlatform.instance = fakePlatform;

    expect(await qualarooPlugin.getPlatformVersion(), '42');
  });
}
