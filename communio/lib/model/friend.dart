import 'package:communio/model/social_media_block.dart';

class Friend {

  String name;
  List<SocialMediaBlock> _socialMediaInfo;

  Friend(String name) {
    this.name = name;
    this._socialMediaInfo = new List<SocialMediaBlock>();
  }

  String getName() { return name; }

  List<SocialMediaBlock> getSocialMedia() { return _socialMediaInfo; }

}
