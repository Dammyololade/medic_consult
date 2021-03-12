import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medic_consult/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:medic_consult/ui/dashboard/cubit/dashboard_state.dart';
import 'package:medic_consult/ui/dashboard/models/appointment_model.dart';
import 'package:medic_consult/ui/ui_kits.dart';

/// description:
/// @package: ui.dashboard
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/12/21
class AppointmentBuilder extends StatelessWidget with UIKits {
  @override
  Widget build(BuildContext context) {
    setContext(context);
    final _cubit = BlocProvider.of<DashboardCubit>(context);
    return BlocBuilder(
        buildWhen: (pre, next) =>
            next is FetchingAppointments ||
            next is AppointmentsFetched ||
            next is ViewMore ||
            next is FetchingAppointmentsError,
        cubit: _cubit,
        builder: (ct, DashboardState state) {
          if (state is FetchingAppointments)
            return Center(
              child: Column(
                children: [
                  Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator()),
                ],
              ),
            );
          if (state is AppointmentsFetched || state is ViewMore) {
            return Container(
              margin: EdgeInsets.only(right: pxWidth(25)),
              padding: EdgeInsets.symmetric(
                  vertical: pxHeight(9), horizontal: pxWidth(16)),
              decoration: BoxDecoration(
                  color: Color(0xffF1F3F6),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Appointments",
                        style: headline2,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          _cubit.viewMore();
                        },
                        child: Text(
                          _cubit.isViewingMore ? "View Less" : "View More",
                          style: headline6.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.theme.primaryColor,
                              fontSize: fontSize(10)),
                        ),
                      )
                    ],
                  ),
                  height(4),
                  if (_cubit.isViewingMore)
                    ..._cubit.appointmentModel.data.appointments
                        .map((e) => AppointmentItemBuilder(
                            e,
                            _cubit.appointmentModel.data.appointments
                                    .indexOf(e) ==
                                2))
                        .toList()
                  else
                    AppointmentItemBuilder(
                        _cubit.appointmentModel.data.appointments.first, false)
                ],
              ),
            );
          }

          return Text("Error $state");
        });
  }
}

class AppointmentItemBuilder extends StatelessWidget with UIKits {
  Appointment appointment;
  bool isLastIndex;

  AppointmentItemBuilder(this.appointment, this.isLastIndex);

  @override
  Widget build(BuildContext context) {
    setContext(context);
    return Padding(
      padding: EdgeInsets.only(
          top: pxHeight(20), bottom: pxHeight(isLastIndex ? 21 : 5)),
      child: Row(
        children: [
          Container(
            height: pxHeight(45),
            width: pxWidth(4.26),
            decoration: BoxDecoration(
                color: !isLastIndex ? Color(0xff71B548) : Color(0xffEEC000)),
          ),
          width(9.74),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.name,
                style: headline4,
              ),
              height(13),
              Text(
                appointment.address,
                style: subtitle1.copyWith(
                    fontWeight: FontWeight.w600, color: Color(0xff919DB5)),
              ),
            ],
          )),
          width(10),
          Text(
            "14 Sept, 4:30 PM",
            style: subtitle2.copyWith(
                fontWeight: FontWeight.w600, color: Color(0xffB0BAC9)),
          ),
        ],
      ),
    );
  }
}
