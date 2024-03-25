import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/core/helpers/size_helper.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_bloc.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_state.dart';
import 'package:wave_clone/src/presentation/home/component/home_action_buttons.dart';
import 'package:wave_clone/src/presentation/home/component/custom_sliver_app_bar.dart';
import 'package:wave_clone/src/presentation/home/component/transactions_section.dart';
import 'package:wave_clone/src/presentation/home/component/wave_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorsHelper.primaryColor(),
      ),
      child: Scaffold(
        backgroundColor: ColorsHelper.primaryColor(),
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (_, state) {
              return CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverPersistentHeader(
                      delegate: CustomSliverAppBar(
                          balance: 50000, maxAppBarSize: 0, minAppBarSize: 0),
                      pinned: true),

                  //Transaction list and ActionsButtons
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: SizesHelper.height(100)),
                          padding: EdgeInsets.only(top: SizesHelper.height(40)),
                          width: double.infinity,
                          decoration: _boxDecoration(),
                          child: Column(children: [
                            //list of Buttons
                            const HomeActionButtons(),

                            Divider(
                              thickness: SizesHelper.height(5),
                              color: Colors.grey.withOpacity(.2),
                            ),

                            //Show transactions list under Actions Buttons
                            const TransactionSection(),
                          ]),
                        ),

                        //WaveCard
                        const WaveCard()
                      ],
                    ),
                  ),
                ],
              );
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
