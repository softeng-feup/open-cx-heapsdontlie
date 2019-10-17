import 'dart:convert';

import 'package:communio/model/social_media_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Friend {

  static Map<String, String> socialLogo = {
    'facebook':'assets/logo_facebook.png',
    'instagram':'assets/logo_instagram.png',
    'twitter':'assets/logo_twitter.png',
    'github':'assets/logo_instagram.png',
    'linkedin':'assets/logo_instagram.png',
    'default':'assets/logo_default.png'
  };

  final String name;
  final String photo;
  final String location;
  List<SocialMediaBlock> socials;
  List<dynamic> interests;
  Friend({this.name, this.photo, this.location, this.socials, this.interests});

  Future<Friend> fromNetwork (String url) async{
    final response = await http.get(url);
    final responseJson = json.decode(response.body);
    return Friend(
      name: responseJson['name'],
      photo: responseJson['photo'],
      location: responseJson['location'],
      socials: createSocialInfo(responseJson['social-media']),
      interests: responseJson['interests']
    );
  }

  List<SocialMediaBlock> createSocialInfo(List<dynamic> response) {
    final List<SocialMediaBlock> socials = new List<SocialMediaBlock>();
    for (dynamic network in response) {
      String logo;
      if (socialLogo.containsKey(network['name'])) {
          logo = socialLogo[network['name']];
      }
      else {
        logo = socialLogo['default'];
      }
      final SocialMediaBlock social = new SocialMediaBlock(
        network['name'],
        network['url'],
        logo
      );
      socials.add(social);
    }
    return socials;
  }


}
