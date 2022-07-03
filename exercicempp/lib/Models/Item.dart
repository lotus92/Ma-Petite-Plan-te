import 'package:flutter/material.dart';

class ItemModel {
  final String id;
  final String title;
  final int price;
  final String room;
  final String assetPath;
  final int water;
  final int fertilizing;
  final Map<String, dynamic> about;
  final Map<String, dynamic> tips;
  final Map<String, dynamic> activity;

  ItemModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.room,
      required this.assetPath,
      required this.water,
      required this.fertilizing,
      required this.about,
      required this.tips,
      required this.activity});

  ItemModel.fromJson({required Map<String, dynamic> json})
      : id = json['id'],
        title = json['title'],
        room = json['room'],
        assetPath = json['assetPath'],
        water = json['water'],
        fertilizing = json['fertilizing'],
        about = json['about'],
        tips = json['tips'],
        price = json['price'],
        activity = json['activity'];
}
