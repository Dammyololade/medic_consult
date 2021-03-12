import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medic_consult/ui/dashboard/cubit/dashboard_state.dart';
import 'package:medic_consult/ui/dashboard/models/appointment_model.dart';
import 'package:medic_consult/ui/dashboard/models/contact_model.dart';
import 'package:medic_consult/ui/dashboard/models/news_model.dart';
import 'package:medic_consult/ui/dashboard/repository/dashboard_repository.dart';

/// description:
/// @package: ui.dashboard.cubit
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/11/21
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  DashboardRepository repository = DashboardRepository();
  NewsModel newsModel;
  AppointmentModel appointmentModel;
  ContactModel contactModel;
  bool isViewingMore = false;

  Future<void> loadData()async {
    getNews();
    getApppointments();
    getContacts();
  }

  void viewMore() {
    emit(DashboardReset());
    isViewingMore = !isViewingMore;
    emit(ViewMore());
  }

  Future<void> getNews() async {
    try {
      emit(FetchingNews());
      newsModel = await repository.fetchNews();
      emit(NewsFetched());
    } catch (err) {
      emit(FetchingNewsError(message: err.toString()));
    }
  }

  Future<void> getApppointments() async {
    try {
      emit(FetchingAppointments());
      appointmentModel = await repository.fetchAppointments();
      emit(AppointmentsFetched());
    } catch (err) {
      emit(FetchingAppointmentsError(message: err.toString()));
    }
  }

  Future<void> getContacts() async {
    try {
      emit(FetchingContacts());
      contactModel = await repository.fetchContacts();
      emit(ContactsFetched());
    } catch (err) {
      emit(FetchingContactsError(message: err.toString()));
    }
  }
}
