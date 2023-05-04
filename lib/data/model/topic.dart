import 'package:flutter/material.dart';

class Topic {
  final String title;
  final String thumbnail;
  final String color;
  final String titleColor;
  Topic(
      {required this.title,
      required this.thumbnail,
      required this.color,
      required this.titleColor});

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      title: json['title'].toString(),
      thumbnail: json['thumbnail'].toString(),
      color: json['color'],
      titleColor: json['titleColor'],
    );
  }
}

extension GetBgColor on Topic {
  Color get bgColor => Color(int.parse(color));
}
