import 'package:flutter/material.dart';

/// description: 
/// @package: ui.dashboard.models
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/11/21
class AppointmentModel {
  int total;
  int count;
  Data data;
  bool success;

  AppointmentModel({this.total, this.count, this.data, this.success});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
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
  List<Appointment> appointments;

  Data({this.appointments});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['appointments'] != null) {
      appointments = [];
      json['appointments'].forEach((v) {
        appointments.add(new Appointment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointments != null) {
      data['appointments'] = this.appointments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Appointment {
  String id;
  String createdAt;
  String name;
  String address;

  Appointment({this.id, this.createdAt, this.name, this.address});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }
}

