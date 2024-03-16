// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:internal_app/widgets/search_textField.dart';

import '../bloc/apiblocker_bloc.dart';
import '../data.dart';
import '../widgets/api_item.dart';

class SearchApiScreen extends StatefulWidget {
  final String apiType;
  const SearchApiScreen({
    Key? key,
    required this.apiType,
  }) : super(key: key);

  @override
  State<SearchApiScreen> createState() => _SearchApiScreenState();
}

class _SearchApiScreenState extends State<SearchApiScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool showNoresultFoundText = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiblockerBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<ApiblockerBloc, ApiblockerState>(
          listener: (context, state) {
            if (state is ApiLoadedState) {
              if (state.filteredApis.length == 0) {
                setState(() {
                  showNoresultFoundText = true;
                });
              } else {
                setState(() {
                  showNoresultFoundText = false;
                });
              }
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Search ${widget.apiType} APIs",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SearchTextField(
                      onChanged: (string) {
                        if (widget.apiType == CredApiType.ALL.name) {
                          context
                              .read<ApiblockerBloc>()
                              .add(SearchApiEvent(string));
                        } else if (widget.apiType == CredApiType.RCA.name) {
                          context
                              .read<ApiblockerBloc>()
                              .add(SearchRCAApiEvent(string));
                        } else if (widget.apiType == CredApiType.RCS.name) {
                          context
                              .read<ApiblockerBloc>()
                              .add(SearchRCSApiEvent(string));
                        } else if (widget.apiType == CredApiType.RCI.name) {
                          context
                              .read<ApiblockerBloc>()
                              .add(SearchRCIApiEvent(string));
                        } else if (widget.apiType == CredApiType.PLAID.name) {
                          context
                              .read<ApiblockerBloc>()
                              .add(SearchPLAIDApiEvent(string));
                        } else if (widget.apiType ==
                            CredApiType.PAYTRACE.name) {
                          context
                              .read<ApiblockerBloc>()
                              .add(SearchPAYTRACEApiEvent(string));
                        } else if (widget.apiType == CredApiType.I2C.name) {
                          context
                              .read<ApiblockerBloc>()
                              .add(SearchI2CApiEvent(string));
                        } else if (widget.apiType == CredApiType.FINXACT.name) {
                          context
                              .read<ApiblockerBloc>()
                              .add(SearchFINXACTApiEvent(string));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    showNoresultFoundText
                        ? const Center(
                            child: Text("no results found"),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: state is ApiLoadedState
                                  ? state.filteredApis.length
                                  : 0, // Set itemCount to 0 if state is not ApiLoadedState
                              itemBuilder: (context, index) {
                                if (state is ApiLoadedState) {
                                  final api = state.filteredApis[index];
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: ApiItem(
                                      apiName: api['apiName'],
                                      apiUrl: api['apiUrl'],
                                      id: api['id'],
                                    ),
                                  );
                                } else {
                                  // Handle other states or return a placeholder widget if needed
                                  return Container();
                                }
                              },
                            ),
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
