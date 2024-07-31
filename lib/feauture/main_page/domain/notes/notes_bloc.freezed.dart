// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UseCaseBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)
        fetchNotes,
    required TResult Function() loadingNotes,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult? Function()? loadingNotes,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult Function()? loadingNotes,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent value) fetchNotes,
    required TResult Function(LoadingEvent value) loadingNotes,
    required TResult Function(EmptyResponseEvent value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent value)
        resetToInitialState,
    required TResult Function(ClearStateEvent value) clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent value)? fetchNotes,
    TResult? Function(LoadingEvent value)? loadingNotes,
    TResult? Function(EmptyResponseEvent value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult? Function(ClearStateEvent value)? clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent value)? fetchNotes,
    TResult Function(LoadingEvent value)? loadingNotes,
    TResult Function(EmptyResponseEvent value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult Function(ClearStateEvent value)? clearState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UseCaseBlocEventCopyWith<$Res> {
  factory $UseCaseBlocEventCopyWith(
          UseCaseBlocEvent value, $Res Function(UseCaseBlocEvent) then) =
      _$UseCaseBlocEventCopyWithImpl<$Res, UseCaseBlocEvent>;
}

/// @nodoc
class _$UseCaseBlocEventCopyWithImpl<$Res, $Val extends UseCaseBlocEvent>
    implements $UseCaseBlocEventCopyWith<$Res> {
  _$UseCaseBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchDataEventImplCopyWith<$Res> {
  factory _$$FetchDataEventImplCopyWith(_$FetchDataEventImpl value,
          $Res Function(_$FetchDataEventImpl) then) =
      __$$FetchDataEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {UseCaseResult<List<NoteResponseModel>> result, bool initialListIsEmpty});
}

/// @nodoc
class __$$FetchDataEventImplCopyWithImpl<$Res>
    extends _$UseCaseBlocEventCopyWithImpl<$Res, _$FetchDataEventImpl>
    implements _$$FetchDataEventImplCopyWith<$Res> {
  __$$FetchDataEventImplCopyWithImpl(
      _$FetchDataEventImpl _value, $Res Function(_$FetchDataEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? initialListIsEmpty = null,
  }) {
    return _then(_$FetchDataEventImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as UseCaseResult<List<NoteResponseModel>>,
      initialListIsEmpty: null == initialListIsEmpty
          ? _value.initialListIsEmpty
          : initialListIsEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FetchDataEventImpl implements FetchDataEvent {
  _$FetchDataEventImpl(
      {required this.result, required this.initialListIsEmpty});

  @override
  final UseCaseResult<List<NoteResponseModel>> result;
  @override
  final bool initialListIsEmpty;

  @override
  String toString() {
    return 'UseCaseBlocEvent.fetchNotes(result: $result, initialListIsEmpty: $initialListIsEmpty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDataEventImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.initialListIsEmpty, initialListIsEmpty) ||
                other.initialListIsEmpty == initialListIsEmpty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result, initialListIsEmpty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDataEventImplCopyWith<_$FetchDataEventImpl> get copyWith =>
      __$$FetchDataEventImplCopyWithImpl<_$FetchDataEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)
        fetchNotes,
    required TResult Function() loadingNotes,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
  }) {
    return fetchNotes(result, initialListIsEmpty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult? Function()? loadingNotes,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
  }) {
    return fetchNotes?.call(result, initialListIsEmpty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult Function()? loadingNotes,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (fetchNotes != null) {
      return fetchNotes(result, initialListIsEmpty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent value) fetchNotes,
    required TResult Function(LoadingEvent value) loadingNotes,
    required TResult Function(EmptyResponseEvent value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent value)
        resetToInitialState,
    required TResult Function(ClearStateEvent value) clearState,
  }) {
    return fetchNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent value)? fetchNotes,
    TResult? Function(LoadingEvent value)? loadingNotes,
    TResult? Function(EmptyResponseEvent value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult? Function(ClearStateEvent value)? clearState,
  }) {
    return fetchNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent value)? fetchNotes,
    TResult Function(LoadingEvent value)? loadingNotes,
    TResult Function(EmptyResponseEvent value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult Function(ClearStateEvent value)? clearState,
    required TResult orElse(),
  }) {
    if (fetchNotes != null) {
      return fetchNotes(this);
    }
    return orElse();
  }
}

abstract class FetchDataEvent implements UseCaseBlocEvent {
  factory FetchDataEvent(
      {required final UseCaseResult<List<NoteResponseModel>> result,
      required final bool initialListIsEmpty}) = _$FetchDataEventImpl;

  UseCaseResult<List<NoteResponseModel>> get result;
  bool get initialListIsEmpty;
  @JsonKey(ignore: true)
  _$$FetchDataEventImplCopyWith<_$FetchDataEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingEventImplCopyWith<$Res> {
  factory _$$LoadingEventImplCopyWith(
          _$LoadingEventImpl value, $Res Function(_$LoadingEventImpl) then) =
      __$$LoadingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingEventImplCopyWithImpl<$Res>
    extends _$UseCaseBlocEventCopyWithImpl<$Res, _$LoadingEventImpl>
    implements _$$LoadingEventImplCopyWith<$Res> {
  __$$LoadingEventImplCopyWithImpl(
      _$LoadingEventImpl _value, $Res Function(_$LoadingEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingEventImpl implements LoadingEvent {
  _$LoadingEventImpl();

  @override
  String toString() {
    return 'UseCaseBlocEvent.loadingNotes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)
        fetchNotes,
    required TResult Function() loadingNotes,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
  }) {
    return loadingNotes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult? Function()? loadingNotes,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
  }) {
    return loadingNotes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult Function()? loadingNotes,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (loadingNotes != null) {
      return loadingNotes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent value) fetchNotes,
    required TResult Function(LoadingEvent value) loadingNotes,
    required TResult Function(EmptyResponseEvent value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent value)
        resetToInitialState,
    required TResult Function(ClearStateEvent value) clearState,
  }) {
    return loadingNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent value)? fetchNotes,
    TResult? Function(LoadingEvent value)? loadingNotes,
    TResult? Function(EmptyResponseEvent value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult? Function(ClearStateEvent value)? clearState,
  }) {
    return loadingNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent value)? fetchNotes,
    TResult Function(LoadingEvent value)? loadingNotes,
    TResult Function(EmptyResponseEvent value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult Function(ClearStateEvent value)? clearState,
    required TResult orElse(),
  }) {
    if (loadingNotes != null) {
      return loadingNotes(this);
    }
    return orElse();
  }
}

abstract class LoadingEvent implements UseCaseBlocEvent {
  factory LoadingEvent() = _$LoadingEventImpl;
}

/// @nodoc
abstract class _$$EmptyResponseEventImplCopyWith<$Res> {
  factory _$$EmptyResponseEventImplCopyWith(_$EmptyResponseEventImpl value,
          $Res Function(_$EmptyResponseEventImpl) then) =
      __$$EmptyResponseEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyResponseEventImplCopyWithImpl<$Res>
    extends _$UseCaseBlocEventCopyWithImpl<$Res, _$EmptyResponseEventImpl>
    implements _$$EmptyResponseEventImplCopyWith<$Res> {
  __$$EmptyResponseEventImplCopyWithImpl(_$EmptyResponseEventImpl _value,
      $Res Function(_$EmptyResponseEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyResponseEventImpl implements EmptyResponseEvent {
  _$EmptyResponseEventImpl();

  @override
  String toString() {
    return 'UseCaseBlocEvent.emptyResponse()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyResponseEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)
        fetchNotes,
    required TResult Function() loadingNotes,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
  }) {
    return emptyResponse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult? Function()? loadingNotes,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
  }) {
    return emptyResponse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult Function()? loadingNotes,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (emptyResponse != null) {
      return emptyResponse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent value) fetchNotes,
    required TResult Function(LoadingEvent value) loadingNotes,
    required TResult Function(EmptyResponseEvent value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent value)
        resetToInitialState,
    required TResult Function(ClearStateEvent value) clearState,
  }) {
    return emptyResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent value)? fetchNotes,
    TResult? Function(LoadingEvent value)? loadingNotes,
    TResult? Function(EmptyResponseEvent value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult? Function(ClearStateEvent value)? clearState,
  }) {
    return emptyResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent value)? fetchNotes,
    TResult Function(LoadingEvent value)? loadingNotes,
    TResult Function(EmptyResponseEvent value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult Function(ClearStateEvent value)? clearState,
    required TResult orElse(),
  }) {
    if (emptyResponse != null) {
      return emptyResponse(this);
    }
    return orElse();
  }
}

abstract class EmptyResponseEvent implements UseCaseBlocEvent {
  factory EmptyResponseEvent() = _$EmptyResponseEventImpl;
}

/// @nodoc
abstract class _$$ResetToInitialStateEventImplCopyWith<$Res> {
  factory _$$ResetToInitialStateEventImplCopyWith(
          _$ResetToInitialStateEventImpl value,
          $Res Function(_$ResetToInitialStateEventImpl) then) =
      __$$ResetToInitialStateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetToInitialStateEventImplCopyWithImpl<$Res>
    extends _$UseCaseBlocEventCopyWithImpl<$Res, _$ResetToInitialStateEventImpl>
    implements _$$ResetToInitialStateEventImplCopyWith<$Res> {
  __$$ResetToInitialStateEventImplCopyWithImpl(
      _$ResetToInitialStateEventImpl _value,
      $Res Function(_$ResetToInitialStateEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetToInitialStateEventImpl implements ResetToInitialStateEvent {
  _$ResetToInitialStateEventImpl();

  @override
  String toString() {
    return 'UseCaseBlocEvent.resetToInitialState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetToInitialStateEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)
        fetchNotes,
    required TResult Function() loadingNotes,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
  }) {
    return resetToInitialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult? Function()? loadingNotes,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
  }) {
    return resetToInitialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult Function()? loadingNotes,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (resetToInitialState != null) {
      return resetToInitialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent value) fetchNotes,
    required TResult Function(LoadingEvent value) loadingNotes,
    required TResult Function(EmptyResponseEvent value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent value)
        resetToInitialState,
    required TResult Function(ClearStateEvent value) clearState,
  }) {
    return resetToInitialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent value)? fetchNotes,
    TResult? Function(LoadingEvent value)? loadingNotes,
    TResult? Function(EmptyResponseEvent value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult? Function(ClearStateEvent value)? clearState,
  }) {
    return resetToInitialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent value)? fetchNotes,
    TResult Function(LoadingEvent value)? loadingNotes,
    TResult Function(EmptyResponseEvent value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult Function(ClearStateEvent value)? clearState,
    required TResult orElse(),
  }) {
    if (resetToInitialState != null) {
      return resetToInitialState(this);
    }
    return orElse();
  }
}

abstract class ResetToInitialStateEvent implements UseCaseBlocEvent {
  factory ResetToInitialStateEvent() = _$ResetToInitialStateEventImpl;
}

/// @nodoc
abstract class _$$ClearStateEventImplCopyWith<$Res> {
  factory _$$ClearStateEventImplCopyWith(_$ClearStateEventImpl value,
          $Res Function(_$ClearStateEventImpl) then) =
      __$$ClearStateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearStateEventImplCopyWithImpl<$Res>
    extends _$UseCaseBlocEventCopyWithImpl<$Res, _$ClearStateEventImpl>
    implements _$$ClearStateEventImplCopyWith<$Res> {
  __$$ClearStateEventImplCopyWithImpl(
      _$ClearStateEventImpl _value, $Res Function(_$ClearStateEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearStateEventImpl implements ClearStateEvent {
  _$ClearStateEventImpl();

  @override
  String toString() {
    return 'UseCaseBlocEvent.clearState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearStateEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)
        fetchNotes,
    required TResult Function() loadingNotes,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
  }) {
    return clearState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult? Function()? loadingNotes,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
  }) {
    return clearState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<List<NoteResponseModel>> result,
            bool initialListIsEmpty)?
        fetchNotes,
    TResult Function()? loadingNotes,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (clearState != null) {
      return clearState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent value) fetchNotes,
    required TResult Function(LoadingEvent value) loadingNotes,
    required TResult Function(EmptyResponseEvent value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent value)
        resetToInitialState,
    required TResult Function(ClearStateEvent value) clearState,
  }) {
    return clearState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent value)? fetchNotes,
    TResult? Function(LoadingEvent value)? loadingNotes,
    TResult? Function(EmptyResponseEvent value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult? Function(ClearStateEvent value)? clearState,
  }) {
    return clearState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent value)? fetchNotes,
    TResult Function(LoadingEvent value)? loadingNotes,
    TResult Function(EmptyResponseEvent value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent value)? resetToInitialState,
    TResult Function(ClearStateEvent value)? clearState,
    required TResult orElse(),
  }) {
    if (clearState != null) {
      return clearState(this);
    }
    return orElse();
  }
}

abstract class ClearStateEvent implements UseCaseBlocEvent {
  factory ClearStateEvent() = _$ClearStateEventImpl;
}

/// @nodoc
mixin _$UseCaseBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emptyState,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emptyState,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emptyState,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EmptyState value) emptyState,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EmptyState value)? emptyState,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EmptyState value)? emptyState,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UseCaseBlocStateCopyWith<$Res> {
  factory $UseCaseBlocStateCopyWith(
          UseCaseBlocState value, $Res Function(UseCaseBlocState) then) =
      _$UseCaseBlocStateCopyWithImpl<$Res, UseCaseBlocState>;
}

/// @nodoc
class _$UseCaseBlocStateCopyWithImpl<$Res, $Val extends UseCaseBlocState>
    implements $UseCaseBlocStateCopyWith<$Res> {
  _$UseCaseBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UseCaseBlocStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UseCaseBlocState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emptyState,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResponse,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emptyState,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResponse,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emptyState,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResponse,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EmptyState value) emptyState,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResponse,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EmptyState value)? emptyState,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResponse,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EmptyState value)? emptyState,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResponse,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UseCaseBlocState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UseCaseBlocStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UseCaseBlocState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emptyState,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResponse,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emptyState,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResponse,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emptyState,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResponse,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EmptyState value) emptyState,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResponse,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EmptyState value)? emptyState,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResponse,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EmptyState value)? emptyState,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResponse,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UseCaseBlocState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$EmptyStateImplCopyWith<$Res> {
  factory _$$EmptyStateImplCopyWith(
          _$EmptyStateImpl value, $Res Function(_$EmptyStateImpl) then) =
      __$$EmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyStateImplCopyWithImpl<$Res>
    extends _$UseCaseBlocStateCopyWithImpl<$Res, _$EmptyStateImpl>
    implements _$$EmptyStateImplCopyWith<$Res> {
  __$$EmptyStateImplCopyWithImpl(
      _$EmptyStateImpl _value, $Res Function(_$EmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyStateImpl implements _EmptyState {
  const _$EmptyStateImpl();

  @override
  String toString() {
    return 'UseCaseBlocState.emptyState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emptyState,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResponse,
  }) {
    return emptyState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emptyState,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResponse,
  }) {
    return emptyState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emptyState,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResponse,
    required TResult orElse(),
  }) {
    if (emptyState != null) {
      return emptyState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EmptyState value) emptyState,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResponse,
  }) {
    return emptyState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EmptyState value)? emptyState,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResponse,
  }) {
    return emptyState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EmptyState value)? emptyState,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResponse,
    required TResult orElse(),
  }) {
    if (emptyState != null) {
      return emptyState(this);
    }
    return orElse();
  }
}

abstract class _EmptyState implements UseCaseBlocState {
  const factory _EmptyState() = _$EmptyStateImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppError error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$UseCaseBlocStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final AppError error;

  @override
  String toString() {
    return 'UseCaseBlocState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emptyState,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResponse,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emptyState,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResponse,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emptyState,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResponse,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EmptyState value) emptyState,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResponse,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EmptyState value)? emptyState,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResponse,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EmptyState value)? emptyState,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResponse,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements UseCaseBlocState {
  const factory _Error(final AppError error) = _$ErrorImpl;

  AppError get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyResultImplCopyWith<$Res> {
  factory _$$EmptyResultImplCopyWith(
          _$EmptyResultImpl value, $Res Function(_$EmptyResultImpl) then) =
      __$$EmptyResultImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyResultImplCopyWithImpl<$Res>
    extends _$UseCaseBlocStateCopyWithImpl<$Res, _$EmptyResultImpl>
    implements _$$EmptyResultImplCopyWith<$Res> {
  __$$EmptyResultImplCopyWithImpl(
      _$EmptyResultImpl _value, $Res Function(_$EmptyResultImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyResultImpl implements _EmptyResult {
  const _$EmptyResultImpl();

  @override
  String toString() {
    return 'UseCaseBlocState.emptyResponse()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyResultImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emptyState,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResponse,
  }) {
    return emptyResponse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emptyState,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResponse,
  }) {
    return emptyResponse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emptyState,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResponse,
    required TResult orElse(),
  }) {
    if (emptyResponse != null) {
      return emptyResponse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EmptyState value) emptyState,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResponse,
  }) {
    return emptyResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EmptyState value)? emptyState,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResponse,
  }) {
    return emptyResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EmptyState value)? emptyState,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResponse,
    required TResult orElse(),
  }) {
    if (emptyResponse != null) {
      return emptyResponse(this);
    }
    return orElse();
  }
}

abstract class _EmptyResult implements UseCaseBlocState {
  const factory _EmptyResult() = _$EmptyResultImpl;
}
