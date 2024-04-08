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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(picture),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                description,
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
        const Align(
          alignment: Alignment.topRight,
          child: Icon(Icons.cancel_outlined),
        )
      ],
    ),
  );
}
