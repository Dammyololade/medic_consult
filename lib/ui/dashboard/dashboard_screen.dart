import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medic_consult/ui/dashboard/appointment_builder.dart';
import 'package:medic_consult/ui/dashboard/contact_list_builder.dart';
import 'package:medic_consult/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:medic_consult/ui/ui_kits.dart';

import 'news_list_builder.dart';

/// description:
/// @package: ui.dashboard
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/11/21
class DashboardScreen extends StatelessWidget with UIKits {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DashboardCubit>(context).loadData();
    setContext(context);
    return Container(
      padding: EdgeInsets.only(left: pxWidth(25), top: pxHeight(52)),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Icon(
                              Icons.notifications,
                              size: 33,
                            ),
                            Positioned(
                                top: 0,
                                right: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: pxHeight(2),
                                      horizontal: pxWidth(4.5)),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: context.theme.primaryColor),
                                  child: Center(
                                    child: Text(
                                      "2",
                                      style: headline6.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: fontSize(7.43),
                                          height: pxHeight(1.5)),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        Text(
                          "Notification",
                          style: subtitle2.copyWith(
                              fontSize: fontSize(9),
                              color: Color(0xff78839C),
                              height: pxHeight(1.67)),
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage("images/profile.png"),
                        ),
                        Text(
                          "Jane Doe",
                          style: subtitle2.copyWith(
                              fontSize: fontSize(9),
                              color: Color(0xff78839C),
                              height: pxHeight(1.67)),
                        )
                      ],
                    ),
                    width(26),
                  ],
                ),
                height(3),
                Text("Welcome Amma", style: headline1),
                height(8),
                AppointmentBuilder(),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(bottom: pxHeight(12), top: pxHeight(18)),
                  child: Text(
                    "Family members",
                    style: headline3.copyWith(
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                ContactListBuilder(),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: pxHeight(17), top: pxHeight(21)),
                  child: Text(
                    "Whats new",
                    style: headline2,
                  ),
                )
              ],
            ),
          ),
          NewsBuilder(),
        ],
      ),
    );
  }
}
