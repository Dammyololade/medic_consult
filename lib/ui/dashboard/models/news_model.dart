import 'package:flutter/material.dart';

/// description: 
/// @package: ui.dashboard.models
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/11/21
class NewsModel {
  int total;
  int count;
  Data data;
  bool success;

  NewsModel({this.total, this.count, this.data, this.success});

  NewsModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  List<News> news;

  Data({this.news});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = new List<News>();
      json['news'].forEach((v) {
        news.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  String id;
  String createdAt;
  String diseaseName;
  String avatar;
  String department;
  String authorName;
  String title;

  News(
      {this.id,
        this.createdAt,
        this.diseaseName,
        this.avatar,
        this.department,
        this.authorName,
        this.title});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    diseaseName = json['diseaseName'];
    avatar = json['avatar'];
    department = json['department'];
    authorName = json['authorName'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['diseaseName'] = this.diseaseName;
    data['avatar'] = this.avatar;
    data['department'] = this.department;
    data['authorName'] = this.authorName;
    data['title'] = this.title;
    return data;
  }
}

