import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';

Widget notificationTitle(
    {required String picture,
    required String title,
    required String description,
    required BuildContext context}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Image.asset(
              picture,
            )),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: context.getHeight(5),
                  ),
                  Text(
                    description,
                    textScaleFactor: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          color: Colors.grey.withOpacity(.4),
                          height: context.getHeight(2),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Icon(
            Icons.cancel_outlined,
            size: context.getWidth(20),
          ),
        )
      ],
    ),
  );
}
//
// Text.rich(
// TextSpan(
// text:"$title\n" ,
// style: Theme.of(context)
//     .textTheme
//     .titleMedium
//     ?.copyWith(fontWeight: FontWeight.bold),
// children: [
// TextSpan(
// text: description,
// style:  Theme.of(context).textTheme.bodyMedium,
// )
// ]
// )
// ),
