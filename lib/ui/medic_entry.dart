import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:medic_consult/ui/dashboard/dashboard_screen.dart';
import 'package:medic_consult/ui/inbox_screen.dart';
import 'package:medic_consult/ui/report_screen.dart';
import 'package:medic_consult/ui/ui_kits.dart';

/// description:
/// @package: ui
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/11/21
class MedicEntry extends StatelessWidget with UIKits{
  var _widgets = [
    DashboardScreen(),
    ReportScreen(),
    InboxScreen(),
  ];
  ValueNotifier<int> _pageNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent
    ));
    ScreenUtil.init(context,
        designSize: Size(375, 812), allowFontScaling: true);
    return Scaffold(
        extendBody: true,
        body: IndexedStack(
          children: _widgets,
          index: _pageNotifier.value,
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _pageNotifier,
          builder: (ct, value, ch) => Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(13.6),
                      topLeft: Radius.circular(13.6)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffE6EBF3).withOpacity(.5),
                        blurRadius: 34,
                        spreadRadius: 0,
                        offset: Offset(0, -10))
                  ]),
              padding: EdgeInsets.only(
                  top: pxHeight(15),
                  bottom: pxHeight(27),
                  left: pxWidth(43),
                  right: pxWidth(50)),
              child: Row(
                children: [
                  _BottomNavItem(
                    isActive: true,
                    imagePath: "images/dashboard.png",
                    title: "Dashboard",
                    onTap: () {
                      //_pageNotifier.value = 0;
                    },
                  ),
                  Spacer(),
                  _BottomNavItem(
                    isActive: false,
                    title: "Report",
                    imagePath: "images/report.png",
                    onTap: () {
                      //_pageNotifier.value = 1;
                    },
                  ),
                  Spacer(),
                  _BottomNavItem(
                    isActive: false,
                    title: "Inbox",
                    imagePath: "images/inbox.png",
                    onTap: () {
                      // _pageNotifier.value = 2;
                    },
                  ),
                ],
              )),
        ));
  }
}

class _BottomNavItem extends StatelessWidget with UIKits {
  bool isActive;
  String imagePath;
  String title;
  VoidCallback onTap;

  _BottomNavItem({
    this.isActive,
    this.imagePath,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    setContext(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            height: pxHeight(29),
            width: pxWidth(27),
          ),
          Text(
            title,
            style: headline6.copyWith(
                fontSize: ScreenUtil().setSp(9),
                fontWeight: FontWeight.w600,
                height: pxHeight(2.67),
                color: isActive ? context.theme.primaryColor : headline6.color),
          ),
        ],
      ),
    );
  }
}
