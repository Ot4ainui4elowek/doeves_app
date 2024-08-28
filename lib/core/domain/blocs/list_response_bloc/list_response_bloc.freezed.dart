// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_response_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListResponseBlocEvent<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UseCaseResult<ListResponseModel<T>> result, bool initialListIsEmpty)
        fetch,
    required TResult Function() loading,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult? Function()? loading,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult Function()? loading,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent<T> value) fetch,
    required TResult Function(LoadingEvent<T> value) loading,
    required TResult Function(EmptyResponseEvent<T> value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent<T> value)
        resetToInitialState,
    required TResult Function(ClearStateEvent<T> value) clearState,
    required TResult Function(ErrorEvent<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent<T> value)? fetch,
    TResult? Function(LoadingEvent<T> value)? loading,
    TResult? Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult? Function(ClearStateEvent<T> value)? clearState,
    TResult? Function(ErrorEvent<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent<T> value)? fetch,
    TResult Function(LoadingEvent<T> value)? loading,
    TResult Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult Function(ClearStateEvent<T> value)? clearState,
    TResult Function(ErrorEvent<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListResponseBlocEventCopyWith<T, $Res> {
  factory $ListResponseBlocEventCopyWith(ListResponseBlocEvent<T> value,
          $Res Function(ListResponseBlocEvent<T>) then) =
      _$ListResponseBlocEventCopyWithImpl<T, $Res, ListResponseBlocEvent<T>>;
}

/// @nodoc
class _$ListResponseBlocEventCopyWithImpl<T, $Res,
        $Val extends ListResponseBlocEvent<T>>
    implements $ListResponseBlocEventCopyWith<T, $Res> {
  _$ListResponseBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchDataEventImplCopyWith<T, $Res> {
  factory _$$FetchDataEventImplCopyWith(_$FetchDataEventImpl<T> value,
          $Res Function(_$FetchDataEventImpl<T>) then) =
      __$$FetchDataEventImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call(
      {UseCaseResult<ListResponseModel<T>> result, bool initialListIsEmpty});
}

/// @nodoc
class __$$FetchDataEventImplCopyWithImpl<T, $Res>
    extends _$ListResponseBlocEventCopyWithImpl<T, $Res,
        _$FetchDataEventImpl<T>>
    implements _$$FetchDataEventImplCopyWith<T, $Res> {
  __$$FetchDataEventImplCopyWithImpl(_$FetchDataEventImpl<T> _value,
      $Res Function(_$FetchDataEventImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? initialListIsEmpty = null,
  }) {
    return _then(_$FetchDataEventImpl<T>(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as UseCaseResult<ListResponseModel<T>>,
      initialListIsEmpty: null == initialListIsEmpty
          ? _value.initialListIsEmpty
          : initialListIsEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FetchDataEventImpl<T> implements FetchDataEvent<T> {
  _$FetchDataEventImpl(
      {required this.result, required this.initialListIsEmpty});

  @override
  final UseCaseResult<ListResponseModel<T>> result;
  @override
  final bool initialListIsEmpty;

  @override
  String toString() {
    return 'ListResponseBlocEvent<$T>.fetch(result: $result, initialListIsEmpty: $initialListIsEmpty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDataEventImpl<T> &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.initialListIsEmpty, initialListIsEmpty) ||
                other.initialListIsEmpty == initialListIsEmpty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result, initialListIsEmpty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDataEventImplCopyWith<T, _$FetchDataEventImpl<T>> get copyWith =>
      __$$FetchDataEventImplCopyWithImpl<T, _$FetchDataEventImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UseCaseResult<ListResponseModel<T>> result, bool initialListIsEmpty)
        fetch,
    required TResult Function() loading,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
    required TResult Function(String message) error,
  }) {
    return fetch(result, initialListIsEmpty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult? Function()? loading,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
    TResult? Function(String message)? error,
  }) {
    return fetch?.call(result, initialListIsEmpty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult Function()? loading,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(result, initialListIsEmpty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent<T> value) fetch,
    required TResult Function(LoadingEvent<T> value) loading,
    required TResult Function(EmptyResponseEvent<T> value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent<T> value)
        resetToInitialState,
    required TResult Function(ClearStateEvent<T> value) clearState,
    required TResult Function(ErrorEvent<T> value) error,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent<T> value)? fetch,
    TResult? Function(LoadingEvent<T> value)? loading,
    TResult? Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult? Function(ClearStateEvent<T> value)? clearState,
    TResult? Function(ErrorEvent<T> value)? error,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent<T> value)? fetch,
    TResult Function(LoadingEvent<T> value)? loading,
    TResult Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult Function(ClearStateEvent<T> value)? clearState,
    TResult Function(ErrorEvent<T> value)? error,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchDataEvent<T> implements ListResponseBlocEvent<T> {
  factory FetchDataEvent(
      {required final UseCaseResult<ListResponseModel<T>> result,
      required final bool initialListIsEmpty}) = _$FetchDataEventImpl<T>;

  UseCaseResult<ListResponseModel<T>> get result;
  bool get initialListIsEmpty;
  @JsonKey(ignore: true)
  _$$FetchDataEventImplCopyWith<T, _$FetchDataEventImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingEventImplCopyWith<T, $Res> {
  factory _$$LoadingEventImplCopyWith(_$LoadingEventImpl<T> value,
          $Res Function(_$LoadingEventImpl<T>) then) =
      __$$LoadingEventImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingEventImplCopyWithImpl<T, $Res>
    extends _$ListResponseBlocEventCopyWithImpl<T, $Res, _$LoadingEventImpl<T>>
    implements _$$LoadingEventImplCopyWith<T, $Res> {
  __$$LoadingEventImplCopyWithImpl(
      _$LoadingEventImpl<T> _value, $Res Function(_$LoadingEventImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingEventImpl<T> implements LoadingEvent<T> {
  _$LoadingEventImpl();

  @override
  String toString() {
    return 'ListResponseBlocEvent<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingEventImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UseCaseResult<ListResponseModel<T>> result, bool initialListIsEmpty)
        fetch,
    required TResult Function() loading,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult? Function()? loading,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult Function()? loading,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    TResult Function(String message)? error,
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
    required TResult Function(FetchDataEvent<T> value) fetch,
    required TResult Function(LoadingEvent<T> value) loading,
    required TResult Function(EmptyResponseEvent<T> value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent<T> value)
        resetToInitialState,
    required TResult Function(ClearStateEvent<T> value) clearState,
    required TResult Function(ErrorEvent<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent<T> value)? fetch,
    TResult? Function(LoadingEvent<T> value)? loading,
    TResult? Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult? Function(ClearStateEvent<T> value)? clearState,
    TResult? Function(ErrorEvent<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent<T> value)? fetch,
    TResult Function(LoadingEvent<T> value)? loading,
    TResult Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult Function(ClearStateEvent<T> value)? clearState,
    TResult Function(ErrorEvent<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingEvent<T> implements ListResponseBlocEvent<T> {
  factory LoadingEvent() = _$LoadingEventImpl<T>;
}

/// @nodoc
abstract class _$$EmptyResponseEventImplCopyWith<T, $Res> {
  factory _$$EmptyResponseEventImplCopyWith(_$EmptyResponseEventImpl<T> value,
          $Res Function(_$EmptyResponseEventImpl<T>) then) =
      __$$EmptyResponseEventImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$EmptyResponseEventImplCopyWithImpl<T, $Res>
    extends _$ListResponseBlocEventCopyWithImpl<T, $Res,
        _$EmptyResponseEventImpl<T>>
    implements _$$EmptyResponseEventImplCopyWith<T, $Res> {
  __$$EmptyResponseEventImplCopyWithImpl(_$EmptyResponseEventImpl<T> _value,
      $Res Function(_$EmptyResponseEventImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyResponseEventImpl<T> implements EmptyResponseEvent<T> {
  _$EmptyResponseEventImpl();

  @override
  String toString() {
    return 'ListResponseBlocEvent<$T>.emptyResponse()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyResponseEventImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UseCaseResult<ListResponseModel<T>> result, bool initialListIsEmpty)
        fetch,
    required TResult Function() loading,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
    required TResult Function(String message) error,
  }) {
    return emptyResponse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult? Function()? loading,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
    TResult? Function(String message)? error,
  }) {
    return emptyResponse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult Function()? loading,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    TResult Function(String message)? error,
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
    required TResult Function(FetchDataEvent<T> value) fetch,
    required TResult Function(LoadingEvent<T> value) loading,
    required TResult Function(EmptyResponseEvent<T> value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent<T> value)
        resetToInitialState,
    required TResult Function(ClearStateEvent<T> value) clearState,
    required TResult Function(ErrorEvent<T> value) error,
  }) {
    return emptyResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent<T> value)? fetch,
    TResult? Function(LoadingEvent<T> value)? loading,
    TResult? Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult? Function(ClearStateEvent<T> value)? clearState,
    TResult? Function(ErrorEvent<T> value)? error,
  }) {
    return emptyResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent<T> value)? fetch,
    TResult Function(LoadingEvent<T> value)? loading,
    TResult Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult Function(ClearStateEvent<T> value)? clearState,
    TResult Function(ErrorEvent<T> value)? error,
    required TResult orElse(),
  }) {
    if (emptyResponse != null) {
      return emptyResponse(this);
    }
    return orElse();
  }
}

abstract class EmptyResponseEvent<T> implements ListResponseBlocEvent<T> {
  factory EmptyResponseEvent() = _$EmptyResponseEventImpl<T>;
}

/// @nodoc
abstract class _$$ResetToInitialStateEventImplCopyWith<T, $Res> {
  factory _$$ResetToInitialStateEventImplCopyWith(
          _$ResetToInitialStateEventImpl<T> value,
          $Res Function(_$ResetToInitialStateEventImpl<T>) then) =
      __$$ResetToInitialStateEventImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResetToInitialStateEventImplCopyWithImpl<T, $Res>
    extends _$ListResponseBlocEventCopyWithImpl<T, $Res,
        _$ResetToInitialStateEventImpl<T>>
    implements _$$ResetToInitialStateEventImplCopyWith<T, $Res> {
  __$$ResetToInitialStateEventImplCopyWithImpl(
      _$ResetToInitialStateEventImpl<T> _value,
      $Res Function(_$ResetToInitialStateEventImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetToInitialStateEventImpl<T> implements ResetToInitialStateEvent<T> {
  _$ResetToInitialStateEventImpl();

  @override
  String toString() {
    return 'ListResponseBlocEvent<$T>.resetToInitialState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetToInitialStateEventImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UseCaseResult<ListResponseModel<T>> result, bool initialListIsEmpty)
        fetch,
    required TResult Function() loading,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
    required TResult Function(String message) error,
  }) {
    return resetToInitialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult? Function()? loading,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
    TResult? Function(String message)? error,
  }) {
    return resetToInitialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult Function()? loading,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    TResult Function(String message)? error,
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
    required TResult Function(FetchDataEvent<T> value) fetch,
    required TResult Function(LoadingEvent<T> value) loading,
    required TResult Function(EmptyResponseEvent<T> value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent<T> value)
        resetToInitialState,
    required TResult Function(ClearStateEvent<T> value) clearState,
    required TResult Function(ErrorEvent<T> value) error,
  }) {
    return resetToInitialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent<T> value)? fetch,
    TResult? Function(LoadingEvent<T> value)? loading,
    TResult? Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult? Function(ClearStateEvent<T> value)? clearState,
    TResult? Function(ErrorEvent<T> value)? error,
  }) {
    return resetToInitialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent<T> value)? fetch,
    TResult Function(LoadingEvent<T> value)? loading,
    TResult Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult Function(ClearStateEvent<T> value)? clearState,
    TResult Function(ErrorEvent<T> value)? error,
    required TResult orElse(),
  }) {
    if (resetToInitialState != null) {
      return resetToInitialState(this);
    }
    return orElse();
  }
}

abstract class ResetToInitialStateEvent<T> implements ListResponseBlocEvent<T> {
  factory ResetToInitialStateEvent() = _$ResetToInitialStateEventImpl<T>;
}

/// @nodoc
abstract class _$$ClearStateEventImplCopyWith<T, $Res> {
  factory _$$ClearStateEventImplCopyWith(_$ClearStateEventImpl<T> value,
          $Res Function(_$ClearStateEventImpl<T>) then) =
      __$$ClearStateEventImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ClearStateEventImplCopyWithImpl<T, $Res>
    extends _$ListResponseBlocEventCopyWithImpl<T, $Res,
        _$ClearStateEventImpl<T>>
    implements _$$ClearStateEventImplCopyWith<T, $Res> {
  __$$ClearStateEventImplCopyWithImpl(_$ClearStateEventImpl<T> _value,
      $Res Function(_$ClearStateEventImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearStateEventImpl<T> implements ClearStateEvent<T> {
  _$ClearStateEventImpl();

  @override
  String toString() {
    return 'ListResponseBlocEvent<$T>.clearState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearStateEventImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UseCaseResult<ListResponseModel<T>> result, bool initialListIsEmpty)
        fetch,
    required TResult Function() loading,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
    required TResult Function(String message) error,
  }) {
    return clearState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult? Function()? loading,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
    TResult? Function(String message)? error,
  }) {
    return clearState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult Function()? loading,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    TResult Function(String message)? error,
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
    required TResult Function(FetchDataEvent<T> value) fetch,
    required TResult Function(LoadingEvent<T> value) loading,
    required TResult Function(EmptyResponseEvent<T> value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent<T> value)
        resetToInitialState,
    required TResult Function(ClearStateEvent<T> value) clearState,
    required TResult Function(ErrorEvent<T> value) error,
  }) {
    return clearState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent<T> value)? fetch,
    TResult? Function(LoadingEvent<T> value)? loading,
    TResult? Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult? Function(ClearStateEvent<T> value)? clearState,
    TResult? Function(ErrorEvent<T> value)? error,
  }) {
    return clearState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent<T> value)? fetch,
    TResult Function(LoadingEvent<T> value)? loading,
    TResult Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult Function(ClearStateEvent<T> value)? clearState,
    TResult Function(ErrorEvent<T> value)? error,
    required TResult orElse(),
  }) {
    if (clearState != null) {
      return clearState(this);
    }
    return orElse();
  }
}

abstract class ClearStateEvent<T> implements ListResponseBlocEvent<T> {
  factory ClearStateEvent() = _$ClearStateEventImpl<T>;
}

/// @nodoc
abstract class _$$ErrorEventImplCopyWith<T, $Res> {
  factory _$$ErrorEventImplCopyWith(
          _$ErrorEventImpl<T> value, $Res Function(_$ErrorEventImpl<T>) then) =
      __$$ErrorEventImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorEventImplCopyWithImpl<T, $Res>
    extends _$ListResponseBlocEventCopyWithImpl<T, $Res, _$ErrorEventImpl<T>>
    implements _$$ErrorEventImplCopyWith<T, $Res> {
  __$$ErrorEventImplCopyWithImpl(
      _$ErrorEventImpl<T> _value, $Res Function(_$ErrorEventImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorEventImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorEventImpl<T> implements ErrorEvent<T> {
  _$ErrorEventImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ListResponseBlocEvent<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorEventImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorEventImplCopyWith<T, _$ErrorEventImpl<T>> get copyWith =>
      __$$ErrorEventImplCopyWithImpl<T, _$ErrorEventImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            UseCaseResult<ListResponseModel<T>> result, bool initialListIsEmpty)
        fetch,
    required TResult Function() loading,
    required TResult Function() emptyResponse,
    required TResult Function() resetToInitialState,
    required TResult Function() clearState,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult? Function()? loading,
    TResult? Function()? emptyResponse,
    TResult? Function()? resetToInitialState,
    TResult? Function()? clearState,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<ListResponseModel<T>> result,
            bool initialListIsEmpty)?
        fetch,
    TResult Function()? loading,
    TResult Function()? emptyResponse,
    TResult Function()? resetToInitialState,
    TResult Function()? clearState,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDataEvent<T> value) fetch,
    required TResult Function(LoadingEvent<T> value) loading,
    required TResult Function(EmptyResponseEvent<T> value) emptyResponse,
    required TResult Function(ResetToInitialStateEvent<T> value)
        resetToInitialState,
    required TResult Function(ClearStateEvent<T> value) clearState,
    required TResult Function(ErrorEvent<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchDataEvent<T> value)? fetch,
    TResult? Function(LoadingEvent<T> value)? loading,
    TResult? Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult? Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult? Function(ClearStateEvent<T> value)? clearState,
    TResult? Function(ErrorEvent<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDataEvent<T> value)? fetch,
    TResult Function(LoadingEvent<T> value)? loading,
    TResult Function(EmptyResponseEvent<T> value)? emptyResponse,
    TResult Function(ResetToInitialStateEvent<T> value)? resetToInitialState,
    TResult Function(ClearStateEvent<T> value)? clearState,
    TResult Function(ErrorEvent<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorEvent<T> implements ListResponseBlocEvent<T> {
  factory ErrorEvent(final String message) = _$ErrorEventImpl<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorEventImplCopyWith<T, _$ErrorEventImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListResponseBlocState {
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
abstract class $ListResponseBlocStateCopyWith<$Res> {
  factory $ListResponseBlocStateCopyWith(ListResponseBlocState value,
          $Res Function(ListResponseBlocState) then) =
      _$ListResponseBlocStateCopyWithImpl<$Res, ListResponseBlocState>;
}

/// @nodoc
class _$ListResponseBlocStateCopyWithImpl<$Res,
        $Val extends ListResponseBlocState>
    implements $ListResponseBlocStateCopyWith<$Res> {
  _$ListResponseBlocStateCopyWithImpl(this._value, this._then);

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
    extends _$ListResponseBlocStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ListResponseBlocState.initial()';
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

abstract class _Initial implements ListResponseBlocState {
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
    extends _$ListResponseBlocStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ListResponseBlocState.loading()';
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

abstract class _Loading implements ListResponseBlocState {
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
    extends _$ListResponseBlocStateCopyWithImpl<$Res, _$EmptyStateImpl>
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
    return 'ListResponseBlocState.emptyState()';
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

abstract class _EmptyState implements ListResponseBlocState {
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
    extends _$ListResponseBlocStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'ListResponseBlocState.error(error: $error)';
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

abstract class _Error implements ListResponseBlocState {
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
    extends _$ListResponseBlocStateCopyWithImpl<$Res, _$EmptyResultImpl>
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
    return 'ListResponseBlocState.emptyResponse()';
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

abstract class _EmptyResult implements ListResponseBlocState {
  const factory _EmptyResult() = _$EmptyResultImpl;
}
