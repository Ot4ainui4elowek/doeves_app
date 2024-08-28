import 'package:doeves_app/core/data/model/list_response_model.dart';
import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_response_bloc.freezed.dart';
part 'list_response_event.dart';
part 'list_response_state.dart';

class ListResponseBloc
    extends Bloc<ListResponseBlocEvent, ListResponseBlocState> {
  ListResponseBloc() : super(const ListResponseBlocState.initial()) {
    on<LoadingEvent>(
      (event, emit) {
        emit(const ListResponseBlocState.loading());
      },
    );
    on<FetchDataEvent>(
      (event, emit) {
        switch (event.result) {
          case GoodUseCaseResult(:final data):
            {
              if (event.initialListIsEmpty && data.list.isEmpty) {
                emit(const ListResponseBlocState.initial());
              } else if (!event.initialListIsEmpty && data.list.isEmpty) {
                emit(const ListResponseBlocState.emptyResponse());
              } else {
                emit(const ListResponseBlocState.emptyState());
              }
            }
          case DataBadUseCaseResult(:final errorData):
            {
              emit(ListResponseBlocState.error(
                  SpecificError(errorData.message)));
            }
          case BadUseCaseResult(:final errorList):
            {
              emit(ListResponseBlocState.error(errorList[0]));
            }
          default:
            {
              emit(ListResponseBlocState.error(SpecificError('Unknown error')));
            }
        }
      },
    );
    on<EmptyResponseEvent>(
      (event, emit) => emit(const ListResponseBlocState.emptyResponse()),
    );

    on<ResetToInitialStateEvent>(
      (event, emit) => emit(const ListResponseBlocState.initial()),
    );
    on<ClearStateEvent>(
      (event, emit) => emit(const ListResponseBlocState.emptyState()),
    );
    on<ErrorEvent>(
      (event, emit) => emit(
        ListResponseBlocState.error(SpecificError(event.message)),
      ),
    );
  }
}
