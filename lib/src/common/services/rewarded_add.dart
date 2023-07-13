import 'package:flutter_yandex_ads/components/rewarded.dart';
import 'package:flutter_yandex_ads/pigeons/rewarded.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'addmob_service.dart';

class CustomRewardedAdd {
  RewardedAd? _rewardedAd;
  YandexAdsRewardedComponent? _yandexRewarded;

  showYandexRewarded() {
    _yandexRewarded = YandexAdsRewardedComponent(
        id: 'R-M-2442613-2',
        onAdLoaded: () {
          _yandexRewarded?.show();
          print('rewarded onAdLoaded');
        },
        onAdFailedToLoad: (RewardedError err) {
          print('rewarded onAdFailedToLoad code: ${err.code}, description: ${err.description}');
        },
        onAdDismissed: () {
          print("rewarded onAdDismissed");
        },
        onAdShown: () {
          print("rewarded onAdShown");
        },
        onImpression: (RewardedImpression? data) {
          print('rewarded onImpression ${data?.data}');
        },
        onRewarded: (RewardedEvent? data) {
          print('rewarded onRewarded amount ${data?.amount}, type ${data?.type}');
        });
    _yandexRewarded?.load();
    _yandexRewarded?.show();
  }

  show() async {
    await _createRewardedAd();
    await _showRewardedAd();
  }

  Future<void> _createRewardedAd() async {
    if(_rewardedAd != null) return;
    RewardedAd.load(
        adUnitId: AddMobService.getInterstitialAddUnitId()!,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            _rewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            _rewardedAd = null;
            _createRewardedAd();
          },
        ));
  }

  Future<void> _showRewardedAd() async {
    if (_rewardedAd == null) {
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!
        .show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
    _rewardedAd = null;
  }
}
