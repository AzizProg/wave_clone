
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_event.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_state.dart';

import '../bloc/search_bloc.dart';

class TransactionSearchBar extends StatelessWidget {
  const TransactionSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (_, state) {
        return Container(
          height: context.getHeight(35),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: context.getWidth(10)),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(5)),
          child: TextFormField(
            onChanged: (value) {

              context.read<SearchBloc>().add(GetTransferByName(name: value));
            },
            decoration: const InputDecoration(
                iconColor: Colors.black54,
                icon: Icon(Icons.search),
                hintStyle: TextStyle(color: Colors.black54),
                hintText: "Rechercher",
                border: InputBorder.none),
          ),
        );
      },
    );
  }
}
