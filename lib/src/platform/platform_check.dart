import 'package:flutter/foundation.dart';

class PlatformCheck {
 static final bool isApplePlatform = (
    defaultTargetPlatform == TargetPlatform.iOS 
    || defaultTargetPlatform == TargetPlatform.macOS
   ) && !kIsWeb;

  static final bool isMacApp = defaultTargetPlatform == TargetPlatform.macOS && !kIsWeb;
}