class SocialBlock {

  static Map<String, String> socialLogo = {
    'facebook':'assets/facebook.svg',
    'instagram':'assets/instagram.svg',
    'twitter':'assets/twitter.svg',
    'github':'assets/github.svg',
    'linkedin':'assets/linkedin.svg',
    'default':'assets/default_social.svg'
  };

  String name;
  String url;
  String logo;

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
    this.logo = logo;
  }

}
