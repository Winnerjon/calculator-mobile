
import 'dart:io';

class AddMobService {
  static String? getInterstitialAddUnitId() {
    if(Platform.isAndroid) {
      return 'ca-app-pub-1060922975424563/4230006891';
    }else if(Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    }
    return null;
  }
}