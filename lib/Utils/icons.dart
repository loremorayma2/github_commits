import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static Widget githubIcon(
      {double width = 24.0, double height = 24.0, Color color = Colors.white}) {
    return SvgPicture.asset(
      'assets/icons/github.svg',
      width: width,
      height: height,
      color: color,
    );
  }

  static Widget hashtagIcon(
      {double width = 24.0, double height = 24.0, Color color = Colors.white}) {
    return SvgPicture.asset(
      'assets/icons/hashtag.svg',
      width: width,
      height: height,
      color: color,
    );
  }
}
