import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_bloc.freezed.dart';
part 'notes_event.dart';
part 'notes_state.dart';

class UseCaseBloc extends Bloc<UseCaseBlocEvent, UseCaseBlocState> {
  UseCaseBloc() : super(const UseCaseBlocState.initial()) {
    on<LoadingEvent>(
      (event, emit) {
        emit(const UseCaseBlocState.loading());
      },
    );
    on<FetchDataEvent>(
      (event, emit) {
        switch (event.result) {
          case GoodUseCaseResult(:final data):
            {
              if (event.initialListIsEmpty && data.isEmpty) {
                emit(const UseCaseBlocState.initial());
              } else if (!event.initialListIsEmpty && data.isEmpty) {
                emit(const UseCaseBlocState.emptyResponse());
              } else {
                emit(const UseCaseBlocState.emptyState());
              }
            }
          case DataBadUseCaseResult(:final errorData):
            {
              emit(UseCaseBlocState.error(SpecificError(errorData.message)));
            }
          case BadUseCaseResult(:final errorList):
            {
              emit(UseCaseBlocState.error(errorList[0]));
            }
          default:
            {
              emit(UseCaseBlocState.error(SpecificError('Unknown error')));
            }
        }
      },
    );
    on<EmptyResponseEvent>(
      (event, emit) => emit(const UseCaseBlocState.emptyResponse()),
    );

    on<ResetToInitialStateEvent>(
      (event, emit) => emit(const UseCaseBlocState.initial()),
    );
    on<ClearStateEvent>(
      (event, emit) => emit(const UseCaseBlocState.emptyState()),
    );
  }
}
