import 'package:flutter/material.dart';

/// description:
/// @package: ui.dashboard.cubit
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/11/21
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardReset extends DashboardState {}

class FetchingNews extends DashboardState {}

class FetchingNewsError extends DashboardState {
  String message;

  FetchingNewsError({@required this.message});
}

class NewsFetched extends DashboardState {}

class FetchingAppointments extends DashboardState {}

class FetchingAppointmentsError extends DashboardState {
  String message;

  FetchingAppointmentsError({@required this.message});
}

class AppointmentsFetched extends DashboardState {}
class ViewMore extends DashboardState {}

class FetchingContacts extends DashboardState {}

class FetchingContactsError extends DashboardState {
  String message;

  FetchingContactsError({@required this.message});
}

class ContactsFetched extends DashboardState {}
