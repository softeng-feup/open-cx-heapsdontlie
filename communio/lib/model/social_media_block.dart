import 'package:flutter/material.dart';

abstract class SocialMediaBlock {

  AssetImage logo;
  String url;

  AssetImage getLogo() { return logo; }

  String getUrl() { return url; }

}
