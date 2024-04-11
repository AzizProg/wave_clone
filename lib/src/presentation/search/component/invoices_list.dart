import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/presentation/search/component/not_found.dart';

import '../bloc/search_bloc.dart';
import '../bloc/search_state.dart';

class InvoicesList extends StatelessWidget {
  const InvoicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (_, state) {
      //Because I don't make Invoice processing
      return const SingleChildScrollView(child: NotFound());
    });
  }
}
