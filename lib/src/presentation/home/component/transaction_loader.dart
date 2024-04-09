import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';

class TransactionLoader extends StatelessWidget {
  const TransactionLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      //height: 200,
      child: Column(
        children: List.generate(5, (index) => _loader(context)),
      ),
    );
  }

  Widget _loader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _skeleton(height: 10, width: 200, context: context),
              _skeleton(height: 8, width: 100, context: context),
            ],
          ),
          _skeleton(height: 10, width: 50, context: context)
        ],
      ),
    );
  }

  Widget _skeleton(
      {required double height, double? width, required BuildContext context}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade300,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: context.getWidth(width ?? 0),
        height: context.getHeight(height),
      ),
    );
  }
}
