import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/presentation/settings/component/about_me.dart';
import 'package:wave_clone/src/presentation/settings/component/disclaimer.dart';
import 'package:wave_clone/src/presentation/settings/component/my_networks.dart';
import 'package:wave_clone/src/presentation/settings/component/profil_card.dart';
import 'package:wave_clone/src/presentation/settings/component/settings_appbar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.backgroundColor,
      appBar: const SettingAppBar(),
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfilCard(),
                SizedBox(
                  height: context.getHeight(20),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const AboutMe(),
                      SizedBox(
                        height: context.getHeight(20),
                      ),
                      const Disclaimer(),
                      SizedBox(
                        height: context.getHeight(20),
                      ),
                       MyNetworks()
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
