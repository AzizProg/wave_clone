import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/core/helpers/size_helper.dart';
import 'package:wave_clone/src/domain/entity/transaction_entity.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_bloc.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_state.dart';
import 'package:wave_clone/src/presentation/home/component/home_action_buttons.dart';
import 'package:wave_clone/src/presentation/home/component/custom_sliver_app_bar.dart';
import 'package:wave_clone/src/presentation/home/component/notification_container.dart';
import 'package:wave_clone/src/presentation/home/component/transactions_section.dart';
import 'package:wave_clone/src/presentation/home/component/wave_card.dart';

import '../component/transaction_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorsHelper.primaryColor(),
      ),
      child: Scaffold(
        // backgroundColor: ColorsHelper.primaryColor(),
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (_, state) {
              return CustomScrollView(slivers: [
                SliverPersistentHeader(
                    delegate: CustomSliverAppBar(
                        balance: 50000, maxAppBarSize: 100, minAppBarSize: 50),
                    pinned: true),
                SliverToBoxAdapter(
                  child: Container(
                    //  margin: EdgeInsets.only(top: SizesHelper.height(100)),
                    //padding: EdgeInsets.only(top: SizesHelper.height(40)),
                    width: double.infinity,
                    height: context.getHeight(250),
                    decoration: _boxDecoration(),
                    child: Stack(children: [
                      Positioned.fill(
                          child:
                              ColoredBox(color: ColorsHelper.primaryColor())),
                      //list of Buttons
                      Positioned(
                        child: Container(
                            padding:
                                EdgeInsets.only(top: context.getHeight(60)),
                            margin:
                                EdgeInsets.only(top: context.getHeight(100)),
                            decoration: _boxDecoration(),
                            child: const HomeActionButtons()),
                      ),

                      const Positioned(left: 60, right: 60, child: WaveCard()),
                    ]),
                  ),
                ),
                 SliverToBoxAdapter(
                  child: NotificationContainer(),
                ),
                const SliverToBoxAdapter(
                  child: TransactionSection(),
                )
              ]);
            },
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)));
  }
}
