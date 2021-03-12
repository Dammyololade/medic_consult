import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medic_consult/ui/dashboard/models/contact_model.dart';
import 'package:medic_consult/ui/ui_kits.dart';

import 'cubit/dashboard_cubit.dart';
import 'cubit/dashboard_state.dart';

/// description:
/// @package: ui.dashboard
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/12/21
class ContactListBuilder extends StatelessWidget with UIKits {
  @override
  Widget build(BuildContext context) {
    setContext(context);
    final _cubit = BlocProvider.of<DashboardCubit>(context);
    return BlocBuilder(
        buildWhen: (pre, next) =>
            next is FetchingContacts ||
            next is ContactsFetched ||
            next is FetchingContactsError,
        cubit: _cubit,
        builder: (ct, DashboardState state) {
          if (state is FetchingContacts)
            return Center(
              child: Column(
                children: [
              Container(
                  width: 20, height: 20, child: CircularProgressIndicator()),
                ],
              ),
            );
          if (state is ContactsFetched) {
            return Container(
              height: pxHeight(120),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: pxWidth(5), right: pxWidth(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: pxHeight(46),
                          width: pxWidth(46),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            color: context.theme.primaryColor
                              ),
                          child: Icon(Icons.add, color: Colors.white,),
                        ),
                        height(7),
                        Text("Add", style: headline6.copyWith(
                          height: pxHeight(1.26)
                        ),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _cubit.contactModel.count,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: pxWidth(10)),
                          height: pxHeight(120),
                          width: pxWidth(100),
                          padding: EdgeInsets.symmetric(horizontal: pxWidth(10)),
                          decoration: BoxDecoration(
                              color: Color(0xffF1F3F6),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: pxHeight(42),
                                width: pxWidth(42),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0xff3A4276).withOpacity(.2),
                                        width: 2),
                                    image: DecorationImage(
                                      image: AssetImage("images/contact_${index + 1}.png"),
                                    )),
                              ),
                              height(15),
                              Center(
                                child: Text(getName(index),
                                  style: headline6,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return Text("Error $state");
        });
  }

  String getName(int index) {
    return ["Ada Perry", "Alex McCad", "Ashley Cole"][index];
  }
}
