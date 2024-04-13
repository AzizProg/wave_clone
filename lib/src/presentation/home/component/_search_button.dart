import 'package:flutter/material.dart';

import '../../../core/helpers/color_helper.dart';
class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onTap});
 final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor:
      MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: ColorsHelper.primaryColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(25)),
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              color: ColorsHelper.primaryColor,
            ),
            Text(
              'Rechercher',
              style: TextStyle(color: ColorsHelper.primaryColor,fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
