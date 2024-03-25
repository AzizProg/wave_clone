import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_bloc.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_state.dart';

import '../../../core/helpers/color_helper.dart';
import '../../../core/helpers/size_helper.dart';
import '../bloc/home_event.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        return SliverAppBar(
          elevation: 0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsetsDirectional.only(bottom: 0, top: 16),
            collapseMode: CollapseMode.pin,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ..._balanceHider(),
                IconButton(
                    padding: EdgeInsets.zero,
                    splashColor: Colors.transparent,
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility,
                      color: ColorsHelper.secondaryColor().withOpacity(.5),
                      size: SizesHelper.width(15),
                    ))
              ],
            ),
            centerTitle: true,
          ),
          centerTitle: true,
          leading: const Icon(Icons.settings),
          expandedHeight: SizesHelper.height(80),
          backgroundColor: ColorsHelper.primaryColor(),
        );
      },
    );
  }

  List<Container> _balanceHider() {
    return List.generate(
        8,
        (index) => Container(
              margin: EdgeInsets.only(left: SizesHelper.width(1)),
              padding: EdgeInsets.all(SizesHelper.radius(5)),
              width: SizesHelper.width(5),
              decoration: BoxDecoration(
                  color: ColorsHelper.secondaryColor().withOpacity(.5),
                  shape: BoxShape.circle),
            ));
  }
}
