enum AppAssets {
  appLogo,
  correctInCircle,
  faceRoadMap,
  locationMap,
  logo,
  mask,
  walkCity,
  products,
  selectLanguageBackground,
  specialOffer,
  splash,
  wings,
  wifiIc,
  placeholder,
  noData,
  successAction,
  noNetwork,
  correct,
  correctA,
  paymentDone,
  coupons,
  product,
  society,
  person,
  more
}

extension AppAssetsData on AppAssets {
  static const String _baseAssetPath = 'assets/images/';

  String get imagePath {
    switch (this) {
      case AppAssets.appLogo:
        return "${_baseAssetPath}app_logo.png";
      case AppAssets.walkCity:
        return "${_baseAssetPath}walk_city.png";
      case AppAssets.correctInCircle:
        return "${_baseAssetPath}correct_in_circle.png";
      case AppAssets.faceRoadMap:
        return "${_baseAssetPath}face_road_map.png";
      case AppAssets.locationMap:
        return "${_baseAssetPath}location_map.png";
      case AppAssets.mask:
        return "${_baseAssetPath}mask.png";
      case AppAssets.products:
        return "${_baseAssetPath}products.png";
      case AppAssets.logo:
        return "${_baseAssetPath}logo.png";
      case AppAssets.selectLanguageBackground:
        return "${_baseAssetPath}select_language_background.png";
      case AppAssets.specialOffer:
        return "${_baseAssetPath}special_offer.png";
      case AppAssets.splash:
        return "${_baseAssetPath}splash.png";
      case AppAssets.wings:
        return "${_baseAssetPath}wings.png";
      case AppAssets.wifiIc:
        return "${_baseAssetPath}no_network.png";
      case AppAssets.placeholder:
        return "${_baseAssetPath}placeholderx.png";
      case AppAssets.noData:
        return "${_baseAssetPath}no_data.png";
      case AppAssets.noNetwork:
        return "${_baseAssetPath}no_network.png";
      case AppAssets.successAction:
        return "${_baseAssetPath}correct_in_circle.png";
      case AppAssets.correct:
        return "${_baseAssetPath}correct.png";
      case AppAssets.correctA:
        return "${_baseAssetPath}correct_a.png";
      case AppAssets.paymentDone:
        return "${_baseAssetPath}payment_done.png";
      case AppAssets.person:
        return "${_baseAssetPath}personx.jpg";
      case AppAssets.coupons:
        return "${_baseAssetPath}coupons.png";
      case AppAssets.product:
        return "${_baseAssetPath}product.png";
      case AppAssets.society:
        return "${_baseAssetPath}society.png";
      case AppAssets.more:
        return "${_baseAssetPath}more.png";

      default:
        return "";
    }
  }
}
