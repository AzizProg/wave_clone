import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';

class MyNetworks extends StatelessWidget {
  const MyNetworks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " My Networks",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: _icon(icon: FontAwesomeIcons.github)),
            Expanded(child: _icon(icon: FontAwesomeIcons.linkedin)),
            Expanded(child: _icon(icon: FontAwesomeIcons.envelope)),
          ],
        ),
      ],
    );
  }

  Widget _icon({required IconData icon}) {
    var iconContainer = Card(
      child: InkWell(
        onTap: () {
        },
        onTapDown: (details) {
        },
        splashFactory: InkRipple.splashFactory,
        overlayColor: MaterialStateColor.resolveWith(
            (states) => ColorsHelper.primaryColor),
        child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: double.infinity,
            child: FaIcon(
              icon,
              size: 50,
              color: ColorsHelper.secondaryColor,
            )),
      ),
    );

    return iconContainer;
  }
}
