import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medic_consult/app_colors.dart';
import 'package:medic_consult/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:medic_consult/ui/medic_entry.dart';

void main() {
  runApp(MedicApp());
}

class MedicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medic Consult',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Mulish',
          colorScheme: ColorScheme.light(
            primary: Color(0xff1DA1F2),
          ),
          iconTheme: IconThemeData(color: Color(0xffBFC5D2)),
          primaryColor: Color(0xff1DA1F2),
          textTheme: TextTheme(
              headline1: TextStyle(
                  color: AppColors.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w800),
            headline2: TextStyle(
                color: AppColors.text,
                fontSize: 18,
                fontWeight: FontWeight.w800),
            headline3: TextStyle(
                color: AppColors.text,
                fontSize: 16,
                fontWeight: FontWeight.w600),
            headline4: TextStyle(
                color: AppColors.text,
                fontSize: 15,
                fontWeight: FontWeight.w700),
            headline5: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600),
            headline6: TextStyle(
                color: AppColors.text,
                fontSize: 12,
                fontWeight: FontWeight.w600),
            subtitle1: TextStyle(
                color: AppColors.text,
                fontSize: 11,
                fontWeight: FontWeight.w400),
            subtitle2: TextStyle(
                color: AppColors.text,
                fontSize: 10,
                fontWeight: FontWeight.w400),

          )),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (ct) => DashboardCubit())
      ],
      child: MedicEntry()),
    );
  }
}
