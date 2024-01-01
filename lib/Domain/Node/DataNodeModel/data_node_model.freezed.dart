// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_node_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataNode {
  String? get key => throw _privateConstructorUsedError;
  ValueType get valueType => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataNodeCopyWith<DataNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataNodeCopyWith<$Res> {
  factory $DataNodeCopyWith(DataNode value, $Res Function(DataNode) then) =
      _$DataNodeCopyWithImpl<$Res, DataNode>;
  @useResult
  $Res call({String? key, ValueType valueType, dynamic value});
}

/// @nodoc
class _$DataNodeCopyWithImpl<$Res, $Val extends DataNode>
    implements $DataNodeCopyWith<$Res> {
  _$DataNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? valueType = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      valueType: null == valueType
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as ValueType,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataNodeImplCopyWith<$Res>
    implements $DataNodeCopyWith<$Res> {
  factory _$$DataNodeImplCopyWith(
          _$DataNodeImpl value, $Res Function(_$DataNodeImpl) then) =
      __$$DataNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? key, ValueType valueType, dynamic value});
}

/// @nodoc
class __$$DataNodeImplCopyWithImpl<$Res>
    extends _$DataNodeCopyWithImpl<$Res, _$DataNodeImpl>
    implements _$$DataNodeImplCopyWith<$Res> {
  __$$DataNodeImplCopyWithImpl(
      _$DataNodeImpl _value, $Res Function(_$DataNodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? valueType = null,
    Object? value = freezed,
  }) {
    return _then(_$DataNodeImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      valueType: null == valueType
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as ValueType,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$DataNodeImpl implements _DataNode {
  const _$DataNodeImpl(
      {required this.key, required this.valueType, required this.value});

  @override
  final String? key;
  @override
  final ValueType valueType;
  @override
  final dynamic value;

  @override
  String toString() {
    return 'DataNode(key: $key, valueType: $valueType, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataNodeImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.valueType, valueType) ||
                other.valueType == valueType) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, key, valueType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataNodeImplCopyWith<_$DataNodeImpl> get copyWith =>
      __$$DataNodeImplCopyWithImpl<_$DataNodeImpl>(this, _$identity);
}

abstract class _DataNode implements DataNode {
  const factory _DataNode(
      {required final String? key,
      required final ValueType valueType,
      required final dynamic value}) = _$DataNodeImpl;

  @override
  String? get key;
  @override
  ValueType get valueType;
  @override
  dynamic get value;
  @override
  @JsonKey(ignore: true)
  _$$DataNodeImplCopyWith<_$DataNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
