import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/core/helpers/asset_helper.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/core/helpers/size_helper.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_bloc.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_state.dart';
import 'package:wave_clone/src/presentation/home/component/home_action_buttons.dart';
import 'package:wave_clone/src/presentation/home/component/home_app_bar.dart';
import 'package:wave_clone/src/presentation/home/component/transactions_section.dart';
import 'package:wave_clone/src/presentation/home/component/wave_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.primaryColor(),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (_, child) {
            return CustomScrollView(
              slivers: [
                HomeAppBar(),
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: ColoredBox(
                            color: ColorsHelper.primaryColor(),
                          )),

                          //Positionner les buttons et les transactions
                          Positioned(
                              left: 0,
                              right: 0,
                              top: SizesHelper.height(100),
                              child: Container(
                                padding: EdgeInsets.only(top: SizesHelper.height(40)),
                                height: MediaQuery.sizeOf(context).height,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10))),
                                child:  Column(
                                  children: [
                                    const HomeActionButtons(),
                                    Divider(thickness: SizesHelper.height(5),
                                    color: Colors.grey.withOpacity(.2),

                                    ),
                                    TransactionSection(),
                                  ],
                                ),
                              )),

                          //Positionner la card wave au dessus de la liste de transaction et des buttons
                          Positioned(
                              right: SizesHelper.width(50),
                              left: SizesHelper.width(50),
                              top: 0,
                              child: const WaveCard())
                        ],
                      ),
                    )
                  ]),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
