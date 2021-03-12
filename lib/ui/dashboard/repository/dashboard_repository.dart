import 'package:flutter/material.dart';
import 'package:medic_consult/network/network_provider.dart';
import 'package:medic_consult/network/url_config.dart';
import 'package:medic_consult/ui/dashboard/models/appointment_model.dart';
import 'package:medic_consult/ui/dashboard/models/news_model.dart';
import 'package:medic_consult/ui/dashboard/models/contact_model.dart';

/// description: 
/// @package: ui.dashboard.repository
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/11/21
class DashboardRepository {

  NetworkProvider networkProvider = NetworkProvider();

  Future<NewsModel> fetchNews() async {
    try {
      final response = await networkProvider.call(
          UrlConfig.news, RequestMethod.get);
      return NewsModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AppointmentModel> fetchAppointments() async {
    try {
      final response = await networkProvider.call(
          UrlConfig.appointments, RequestMethod.get);
      return AppointmentModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ContactModel> fetchContacts() async {
    try {
      final response = await networkProvider.call(
          UrlConfig.contacts, RequestMethod.get);
      return ContactModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}