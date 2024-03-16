// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:internal_app/model/todoapimodel.dart';
import 'package:internal_app/repository/api.dart';
import 'package:meta/meta.dart';

import '../data.dart';

part 'apiblocker_event.dart';
part 'apiblocker_state.dart';

class ApiblockerBloc extends Bloc<ApiblockerEvent, ApiblockerState> {
  ApiblockerBloc() : super(ApiblockerInitial()) {
    on<SearchApiEvent>((event, emit) {
      fetchApiHandler(event, emit, allApiList);
    });
    on<SearchRCAApiEvent>((event, emit) {
      fetchApiHandler(event, emit, rcaApiList);
    });
    on<SearchRCSApiEvent>((event, emit) {
      fetchApiHandler(event, emit, rcsApiList);
    });
    on<SearchRCIApiEvent>((event, emit) {
      fetchApiHandler(event, emit, rciApiList);
    });
    on<SearchPLAIDApiEvent>((event, emit) {
      fetchApiHandler(event, emit, plaidApiList);
    });
    on<SearchPAYTRACEApiEvent>((event, emit) {
      fetchApiHandler(event, emit, paytraceApiList);
    });
    on<SearchI2CApiEvent>((event, emit) {
      fetchApiHandler(event, emit, i2cApiList);
    });
    on<SearchFINXACTApiEvent>((event, emit) {
      fetchApiHandler(event, emit, finxactApiList);
    });
    on<LoadRCAAPisEvent>(loadApiHandler);

    on<RCAApiCallOnPageLoad>((event, emit) async {
      print("called");
      try {
        ApiRepository apiRepository = ApiRepository();
        final posts = await apiRepository.fetchPosts();
        emit(ApiDataLoadedState(posts));
      } catch (e) {
        // Handle error
      }
    });
  }

  void fetchApiHandler(event, emit, apiList) {
    {
      final searchTerm = event.searchTerm.toLowerCase();
      if (searchTerm.length > 0) {
        final filteredApis = apiList
            .where((api) =>
                api['apiName'].toString().toLowerCase().contains(searchTerm))
            .toSet()
            .toList();
        emit(ApiLoadedState(filteredApis));
      } else {
        emit(ApiLoadedState([]));
      }
    }
  }

  void loadApiHandler(LoadRCAAPisEvent event, Emitter<ApiblockerState> emit) {
    {
      if (event.apiType == CredApiType.RCA.name) {
        emit(ApiLoadedState(rcaApiList));
      } else if (event.apiType == CredApiType.RCI.name) {
        emit(ApiLoadedState(rciApiList));
      } else if (event.apiType == CredApiType.RCS.name) {
        emit(ApiLoadedState(rcsApiList));
      } else if (event.apiType == CredApiType.PLAID.name) {
        emit(ApiLoadedState(plaidApiList));
      } else if (event.apiType == CredApiType.PAYTRACE.name) {
        emit(ApiLoadedState(paytraceApiList));
      } else if (event.apiType == CredApiType.FINXACT.name) {
        emit(ApiLoadedState(finxactApiList));
      } else if (event.apiType == CredApiType.I2C.name) {
        emit(ApiLoadedState(i2cApiList));
      }
    }
  }
}
