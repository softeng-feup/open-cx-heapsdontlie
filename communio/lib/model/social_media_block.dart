import 'package:flutter/material.dart';

class SocialMediaBlock {

  String name;
  String url;
  AssetImage logo;

  SocialMediaBlock(String name, String url, String logo) {
    this.name = name;
    this.url = url;
    this.logo = AssetImage(logo);
  }

}
