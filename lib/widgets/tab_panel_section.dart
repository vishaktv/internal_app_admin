// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:internal_app/data.dart';
import 'package:internal_app/widgets/api_item.dart';

import '../bloc/apiblocker_bloc.dart';

class TabPanelSection extends StatefulWidget {
  final String apiType;
  const TabPanelSection({
    Key? key,
    required this.apiType,
  }) : super(key: key);

  @override
  State<TabPanelSection> createState() => _TabPanelSectionState();
}

class _TabPanelSectionState extends State<TabPanelSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ApiblockerBloc>().add(LoadRCAAPisEvent(widget.apiType));
    // context.read<ApiblockerBloc>().add(RCAApiCallOnPageLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiblockerBloc, ApiblockerState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ApiLoadedState) {
          return Container(
            child: ListView.builder(
              itemCount: state.filteredApis
                  .length, // Set itemCount to 0 if state is not ApiLoadedState
              itemBuilder: (context, index) {
                // if (state is ApiLoadedState) {
                final api = state.filteredApis[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ApiItem(
                    apiName: api['apiName'],
                    apiUrl: api['apiUrl'],
                    id: api['id'],
                  ),
                );
                // } else {
                //   // Handle other states or return a placeholder widget if needed
                //   return Container();
                // }
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
