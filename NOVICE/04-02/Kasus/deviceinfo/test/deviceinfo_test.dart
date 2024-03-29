import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deviceinfo/deviceinfo.dart';

void main() {
  const MethodChannel channel = MethodChannel('deviceinfo');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Deviceinfo.platformVersion, '42');
  });
}
