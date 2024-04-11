import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_bloc.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_state.dart';

class CustomSwitchButton extends StatelessWidget {
  CustomSwitchButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.type,

  });
  final Function() onTap;
  TransactionType type;
  final String title;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (_, state) {
        return InkWell(
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1, milliseconds: 100),
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: state.type == type ? Colors.black54 : Colors.black12,
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Row(
                children: [
                  FaIcon(
                    icon,
                    size: context.getWidth((20)),
                    color: state.type == type ? Colors.white : Colors.black54,
                  ),
                  SizedBox(
                    width: context.getWidth(5),
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:
                            state.type == type ? Colors.white : Colors.black54),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
