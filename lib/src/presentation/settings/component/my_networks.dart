import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave_clone/src/core/constants/my_networks_link.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';

class MyNetworks extends StatelessWidget {
  MyNetworks({super.key});
  final List<Map<String, dynamic>> _networks = [
    {
      "icon": FontAwesomeIcons.github,
      "link": MyNetWorksLink.github,
    },
    {
      "icon": FontAwesomeIcons.linkedin,
      "link": MyNetWorksLink.linkedin,
    },
    {
      "icon": FontAwesomeIcons.envelope,
      "link": MyNetWorksLink.mail,
    },
  ];
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
            children: List.generate(
                _networks.length,
                (index) => Expanded(
                    child: _icon(
                        icon: _networks[index]["icon"],
                        link: _networks[index]["link"])))),
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception("Could not launch $uri");
    }
  }

  Widget _icon({required IconData icon, required String link}) {
    var iconContainer = Card(
      child: InkWell(
        onTap: () {
          _launchURL(link);
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
