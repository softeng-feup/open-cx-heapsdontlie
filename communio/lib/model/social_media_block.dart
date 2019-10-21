import 'package:flutter_svg/svg.dart';

class SocialBlock {

  static Map<String, String> socialLogo = {
    'facebook':'assets/logo_facebook.png',
    'instagram':'assets/logo_instagram.png',
    'twitter':'assets/logo_twitter.png',
    'github':'assets/logo_github.png',
    'linkedin':'assets/logo_linkedin.png',
    'default':'assets/logo_default.png'
  };

  String name;
  String url;
  SvgPicture logo;

  SocialBlock(String name, String url) {
    this.name = name;
    this.url = url;
    String logo;
    if (socialLogo.containsKey(name)) {
      logo = socialLogo[name];
    }
    else {
      logo = socialLogo['default'];
    }
    this.logo = SvgPicture.asset(logo);
  }

}
