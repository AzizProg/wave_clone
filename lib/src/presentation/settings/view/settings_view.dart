import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/helpers/asset_helper.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/core/helpers/size_helper.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorsHelper.primaryColor(),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorsHelper.primaryColor()),
          child: const Text("Décconexion"),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight:
            SizesHelper.getHeight(screenHeight: size.height, heightWished: 80),
        centerTitle: true,
        title: const Text("Profil"),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  //Card profil
                  Container(
                    width: double.infinity,
                    height: SizesHelper.getHeight(
                        screenHeight: size.height, heightWished: 180),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                            color: ColorsHelper.primaryColor())
                      ],
                      color: ColorsHelper.secondaryColor(),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: ColorsHelper.primaryColor()
                                        .withOpacity(.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Image.asset(
                                          AssetsHelper.transferToPerson)),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    "TRAORE Abdoul-Aziz",
                                    textAlign: TextAlign.justify,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                        Flexible(
                          child: Divider(
                            color: ColorsHelper.primaryColor().withOpacity(.4),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Center(
                                child: Text(
                                  "About Me",
                                  style: _style(context),
                                ),
                              )),
                              VerticalDivider(
                                color:
                                    ColorsHelper.primaryColor().withOpacity(.5),
                              ),
                              Expanded(
                                  child: Center(
                                      child: Text("My networks",
                                          style: _style(context)))),
                              VerticalDivider(
                                color:
                                    ColorsHelper.primaryColor().withOpacity(.5),
                              ),
                              Expanded(
                                  child: Center(
                                      child: Text("Disclaimer",
                                          style: _style(context)))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //SWE
                  Positioned(
                    top: 0,
                    right: 50,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                offset: const Offset(0, 2),
                                color: ColorsHelper.primaryColor()
                                    .withOpacity(0.2))
                          ],
                          color: ColorsHelper.primaryColor().withOpacity(0.2),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const Center(
                        child: Text(
                          "SWE",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }

  TextStyle? _style(BuildContext context) {
    final style =
        Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white);

    return style;
  }
}
