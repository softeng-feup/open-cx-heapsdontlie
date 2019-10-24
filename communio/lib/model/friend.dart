import 'package:communio/model/social_block.dart';

class Friend {
  final String uuid;
  final String name;
  final String photo;
  final String location;
  List<SocialBlock> socials;
  List<dynamic> interests;

  Friend(
      {this.uuid,
      this.name,
      this.photo,
      this.location,
      this.socials,
      this.interests});

  Map<String, dynamic> get map {
    return {
      "uuid": uuid,
      "name": name,
      "photo": photo,
      "location": location,
      "socials": socials,
      "interests": interests
    };
  }

  factory Friend.fromJson(Map<String, dynamic> json) {
    return new Friend(
        uuid: json['uuid'],
        name: json['name'],
        photo: json['photo'],
        location: json['location'],
        socials: Friend._createSocial(json['socials']),
        interests: json['interests']
    );
  }

  static List<SocialBlock> _createSocial(Map<String, dynamic> response) {
    final List<SocialBlock> socials = new List<SocialBlock>();
    response.forEach((k, v) => socials.add(new SocialBlock(k, v)));
    return socials;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Friend &&
          runtimeType == other.runtimeType &&
          uuid == other.uuid;

  @override
  int get hashCode => (uuid.hashCode);

  @override
  String toString() {
    return '\nFriend{\n'
        'uuid: $uuid,\n'
        'name: $name,\n'
        'location: $location,\n'
        'socials: $socials,\n'
        'interests: $interests\n'
        '}';
  }
}
