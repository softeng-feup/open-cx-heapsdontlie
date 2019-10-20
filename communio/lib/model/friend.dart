import 'package:communio/model/social_media_block.dart';

class Friend {

  final String name;
  final String photo;
  final String location;
  List<SocialBlock> socials;
  List<dynamic> interests;
  Friend({this.name, this.photo, this.location, this.socials, this.interests});

  Map<String, dynamic> get map {
    return {
      "name": name,
      "photo": photo,
      "location": location,
      "socials": socials,
      "interests": interests
    };
  }

  factory Friend.fromJson(Map<String, dynamic> json) {
    return new Friend(
        name: json['name'],
        photo: json['photo'],
        location: json['location'],
        socials: Friend.createSocial(json['socials']),
        interests: json['interests']
    );
  }

  static List<SocialBlock> createSocial(Map<String, dynamic> response) {
    final List<SocialBlock> socials = new List<SocialBlock>();
      response.forEach((k,v) =>
          socials.add(
              new SocialBlock(k, v)
          )
      );
    return socials;
  }

}
