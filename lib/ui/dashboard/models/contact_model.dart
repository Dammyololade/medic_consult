import 'package:flutter/material.dart';

/// description: 
/// @package: ui.dashboard.models
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/11/21
class ContactModel {
  int total;
  int count;
  Data data;
  bool success;

  ContactModel({this.total, this.count, this.data, this.success});

  ContactModel.fromJson(Map<String, dynamic> json) {
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
  List<Contact> users;

  Data({this.users});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users.add(new Contact.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contact {
  String id;
  String createdAt;
  String firstName;
  String avatar;
  String email;
  String address;
  String lastname;

  Contact(
      {this.id,
        this.createdAt,
        this.firstName,
        this.avatar,
        this.email,
        this.address,
        this.lastname});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    firstName = json['firstName'];
    avatar = json['avatar'];
    email = json['email'];
    address = json['address'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['firstName'] = this.firstName;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['address'] = this.address;
    data['lastname'] = this.lastname;
    return data;
  }
}

