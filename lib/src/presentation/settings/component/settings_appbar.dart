import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';

import '../../../core/helpers/color_helper.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsHelper.backgroundColor,
      elevation: 0,
      toolbarHeight: context.getHeight(80),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: ColorsHelper.backgroundColor),
      leading: InkWell(
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
        ),
      ),
      title: Text(
        "Profil",
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Colors.black),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
