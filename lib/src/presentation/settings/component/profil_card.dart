import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';

import '../../../core/helpers/asset_helper.dart';
import '../../../core/helpers/color_helper.dart';

class ProfilCard extends StatelessWidget {
  const ProfilCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        //Card profil
        Container(
          width: double.infinity,
          height: context.getHeight(160),
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
                        flex: 3,
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
                            "Learn",
                            style: _style(context),
                          ),
                        )),
                    VerticalDivider(
                      color:
                      ColorsHelper.primaryColor().withOpacity(.5),
                    ),
                    Expanded(
                        child: Center(
                            child: Text("Improve",
                                style: _style(context)))),
                    VerticalDivider(
                      color:
                      ColorsHelper.primaryColor().withOpacity(.5),
                    ),
                    Expanded(
                        child: Center(
                            child: Text("Contribute",
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
    );
  }

  TextStyle? _style(BuildContext context) {
    final style =
    Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white);

    return style;
  }
}
