import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medic_consult/app_colors.dart';
import 'package:medic_consult/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:medic_consult/ui/dashboard/cubit/dashboard_state.dart';
import 'package:medic_consult/ui/dashboard/models/news_model.dart';
import 'package:medic_consult/ui/ui_kits.dart';

/// description:
/// @package: ui.dashboard
/// @projct: medic_consult
/// @author Dammyololade
/// @created_at: 3/11/21
class NewsBuilder extends StatelessWidget {
  DashboardCubit _cubit;

  @override
  Widget build(BuildContext context) {
    _cubit = BlocProvider.of<DashboardCubit>(context);
    return BlocBuilder(
        buildWhen: (pre, next) =>
            next is FetchingNews ||
            next is NewsFetched ||
            next is FetchingNewsError,
        cubit: _cubit,
        builder: (ct, DashboardState state) {
          if (state is FetchingNews)
            return SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                    width: 20, height: 20, child: CircularProgressIndicator()),
              ],
            ));
          if (state is NewsFetched)
            return SliverList(
                delegate: SliverChildBuilderDelegate(
                    (ct, index) =>
                        _NewsItemBuilder(_cubit.newsModel.data.news[index]),
                    childCount: _cubit.newsModel.count));

          return SliverToBoxAdapter(child: Text("Error $state"));
        });
  }
}

class _NewsItemBuilder extends StatelessWidget with UIKits {
  News news;

  _NewsItemBuilder(this.news);

  @override
  Widget build(BuildContext context) {
    setContext(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ...["Breast Cancer", "Senology"].map((e) => Container(
                  margin: EdgeInsets.only(right: pxWidth(6)),
                  padding: EdgeInsets.symmetric(
                      vertical: pxHeight(5), horizontal: pxWidth(13)),
                  decoration: BoxDecoration(
                      color: AppColors.containerBackground,
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    e,
                    style: subtitle2.copyWith(color: Colors.black),
                  ),
                ))
          ],
        ),
        height(12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: pxHeight(48),
              width: pxWidth(48),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xffDFEFFA), width: .96),
                  image: DecorationImage(
                    image: AssetImage("images/news_avatar.png"),
                  )),
            ),
            width(12),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.authorName,
                  style: headline5,
                ),
                height(8),
                Text(
                  news.title,
                  style: subtitle1,
                ),
                height(8),
                Text(
                  "14 Sept, 4:30 PM",
                  style: subtitle2.copyWith(color: Color(0xffB0BAC9)),
                )
              ],
            ))
          ],
        ),
        height(5),
        Container(
          margin: EdgeInsets.only(
              top: pxHeight(8),
              bottom: pxHeight(8),
              right: pxWidth(25)),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffF4F6FC), width: 1)),
        ),
      ],
    );
  }
}
