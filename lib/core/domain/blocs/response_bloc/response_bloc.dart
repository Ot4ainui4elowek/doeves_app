import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_bloc.freezed.dart';
part 'response_event.dart';
part 'response_state.dart';

class ResponseBloc extends Bloc<ResponseEvent, ResponseState> {
  ResponseBloc() : super(const ResponseState.initial()) {
    on<FetchEvent>(
      (event, emit) {
        switch (event.result) {
          case GoodUseCaseResult():
            emit(const ResponseState.initial());
          case BadUseCaseResult(:final errorList):
            emit(ResponseState.error(message: errorList[0].code));
          case DataBadUseCaseResult(:final errorData):
            emit(ResponseState.error(message: errorData.message));
        }
      },
    );
    on<LoadingEvent>(
      (event, emit) => emit(const ResponseState.loading()),
    );
  }
}
