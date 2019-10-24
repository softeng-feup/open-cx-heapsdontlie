import 'package:flutter_svg/flutter_svg.dart';

class SocialBlock {

  static final Map<String, SvgPicture> _socialLogo = {
    'facebook':SvgPicture.asset('assets/facebook.svg'),
    'instagram':SvgPicture.asset('assets/instagram.svg'),
    'twitter':SvgPicture.asset('assets/twitter.svg'),
    'github':SvgPicture.asset('assets/github.svg'),
    'linkedin':SvgPicture.asset('assets/linkedin.svg'),
    'default':SvgPicture.asset('assets/default_social.svg')
  };

  String name;
  String url;
  SvgPicture logo;

  SocialBlock(this.name, this.url) {
    if (_socialLogo.containsKey(name)) {
      this.logo = _socialLogo[name];
    }
    else {
      this.logo = _socialLogo['default'];
    }
  }

  @override
  String toString() {
    return '\n\t SocialBlock{name: $name, url: $url}';
  }

}
