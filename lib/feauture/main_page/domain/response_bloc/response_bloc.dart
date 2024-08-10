import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_bloc.freezed.dart';
part 'response_event.dart';
part 'response_state.dart';

class ResponseBloc<T> extends Bloc<ResponseBlocEvent, ResponseBlocState> {
  ResponseBloc() : super(const ResponseBlocState.initial()) {
    on<LoadingEvent>(
      (event, emit) {
        emit(const ResponseBlocState.loading());
      },
    );
    on<FetchDataEvent>(
      (event, emit) {
        switch (event.result) {
          case GoodUseCaseResult(:final data):
            {
              if (event.initialListIsEmpty && data.isEmpty) {
                emit(const ResponseBlocState.initial());
              } else if (!event.initialListIsEmpty && data.isEmpty) {
                emit(const ResponseBlocState.emptyResponse());
              } else {
                emit(const ResponseBlocState.emptyState());
              }
            }
          case DataBadUseCaseResult(:final errorData):
            {
              emit(ResponseBlocState.error(SpecificError(errorData.message)));
            }
          case BadUseCaseResult(:final errorList):
            {
              emit(ResponseBlocState.error(errorList[0]));
            }
          default:
            {
              emit(ResponseBlocState.error(SpecificError('Unknown error')));
            }
        }
      },
    );
    on<EmptyResponseEvent>(
      (event, emit) => emit(const ResponseBlocState.emptyResponse()),
    );

    on<ResetToInitialStateEvent>(
      (event, emit) => emit(const ResponseBlocState.initial()),
    );
    on<ClearStateEvent>(
      (event, emit) => emit(const ResponseBlocState.emptyState()),
    );
  }
}
