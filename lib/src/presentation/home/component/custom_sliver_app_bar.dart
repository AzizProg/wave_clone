import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wave_clone/src/core/constants/route_names.dart';
import 'package:wave_clone/src/core/extension/number_extension.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_bloc.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_event.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_state.dart';

import '../../../core/helpers/color_helper.dart';
import '../../../core/helpers/size_helper.dart';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final double balance;
  final double maxAppBarSize;
  final double minAppBarSize;
  CustomSliverAppBar({
    required this.balance,
    required this.maxAppBarSize,
    required this.minAppBarSize,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var topPadding=MediaQuery.viewPaddingOf(context).top;
    return BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
      return  Container(
        width: double.infinity,
        height: maxExtent,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: ColorsHelper.primaryColor,
            boxShadow: shrinkOffset >= maxExtent
                ? [
                    _getAppBarShadowInScroll(),
                  ]
                : null),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment.bottomCenter,

              duration: const Duration(seconds: 1),
              child: Transform.scale(
                scale: 1.5,
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    state.balanceStatus == BalanceStatus.displayed
                        ? context.read<HomeBloc>().add(HomeEventHideBalance())
                        : context.read<HomeBloc>().add(HomeEventShowBalance());
                  },
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        state.balanceStatus == BalanceStatus.hidden
                            ? _hidder(context: context)
                            : RichText(
                                text: TextSpan(
                                    text: "${balance.formatPrice}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                    children: [
                                    TextSpan(
                                        text: "F",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold))
                                  ])),
                        SizedBox(
                          width: context.getWidth(5),
                        ),
                        _balanceIconVisibility(
                            icon: state.balanceStatus == BalanceStatus.displayed
                                ? Icons.visibility
                                : Icons.visibility_off)
                      ]),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                onTap: () =>
                    Navigator.of(context).pushNamed(RoutesNames.settings),
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  ///return default appbar value + 40% if [maxAppBarSize] is under 0.
  @override
  double get maxExtent => maxAppBarSize <= 0
      ? (kToolbarHeight + kToolbarHeight * 0.4)
      : maxAppBarSize;

  ///return default appbar value if [minAppBarSize] is under 0.
  @override
  double get minExtent => minAppBarSize <= 0 ? kToolbarHeight : minAppBarSize;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  ///Show eight points if [BalanceStatus] is hidden[BalanceStatus.hidden]
  Widget _hidder({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            8,
            (index) => Container(
                  width: context.getWidth(10),
                  height: context.getHeight(10),
                  margin: EdgeInsets.symmetric(horizontal: context.getWidth(1)),
                  decoration: BoxDecoration(
                      color: ColorsHelper.secondaryColor.withOpacity(.8),
                      shape: BoxShape.circle),
                ))
      ],
    );
  }

  ///change icon if [BalanceStatus] switch or change
  Widget _balanceIconVisibility({required IconData icon}) {
    return Icon(
      icon,
      size: 15,
      color: Colors.white,
    );
  }

//Add a shadow under the appbar scrolling
  BoxShadow _getAppBarShadowInScroll() {
    return const BoxShadow(
        color: Colors.black, blurStyle: BlurStyle.outer, blurRadius: 5);
  }
}
