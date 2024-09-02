// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revenue.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RevenueModel _$RevenueModelFromJson(Map<String, dynamic> json) {
  return _RevenueModel.fromJson(json);
}

/// @nodoc
mixin _$RevenueModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  String get nameOfRevenue => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RevenueModelCopyWith<RevenueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RevenueModelCopyWith<$Res> {
  factory $RevenueModelCopyWith(
          RevenueModel value, $Res Function(RevenueModel) then) =
      _$RevenueModelCopyWithImpl<$Res, RevenueModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id, String nameOfRevenue, int amount});
}

/// @nodoc
class _$RevenueModelCopyWithImpl<$Res, $Val extends RevenueModel>
    implements $RevenueModelCopyWith<$Res> {
  _$RevenueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameOfRevenue = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nameOfRevenue: null == nameOfRevenue
          ? _value.nameOfRevenue
          : nameOfRevenue // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RevenueModelImplCopyWith<$Res>
    implements $RevenueModelCopyWith<$Res> {
  factory _$$RevenueModelImplCopyWith(
          _$RevenueModelImpl value, $Res Function(_$RevenueModelImpl) then) =
      __$$RevenueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id, String nameOfRevenue, int amount});
}

/// @nodoc
class __$$RevenueModelImplCopyWithImpl<$Res>
    extends _$RevenueModelCopyWithImpl<$Res, _$RevenueModelImpl>
    implements _$$RevenueModelImplCopyWith<$Res> {
  __$$RevenueModelImplCopyWithImpl(
      _$RevenueModelImpl _value, $Res Function(_$RevenueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameOfRevenue = null,
    Object? amount = null,
  }) {
    return _then(_$RevenueModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nameOfRevenue: null == nameOfRevenue
          ? _value.nameOfRevenue
          : nameOfRevenue // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RevenueModelImpl implements _RevenueModel {
  _$RevenueModelImpl(
      {@JsonKey(name: 'id') this.id,
      required this.nameOfRevenue,
      required this.amount});

  factory _$RevenueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RevenueModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  final String nameOfRevenue;
  @override
  final int amount;

  @override
  String toString() {
    return 'RevenueModel(id: $id, nameOfRevenue: $nameOfRevenue, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevenueModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameOfRevenue, nameOfRevenue) ||
                other.nameOfRevenue == nameOfRevenue) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameOfRevenue, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RevenueModelImplCopyWith<_$RevenueModelImpl> get copyWith =>
      __$$RevenueModelImplCopyWithImpl<_$RevenueModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RevenueModelImplToJson(
      this,
    );
  }
}

abstract class _RevenueModel implements RevenueModel {
  factory _RevenueModel(
      {@JsonKey(name: 'id') final String? id,
      required final String nameOfRevenue,
      required final int amount}) = _$RevenueModelImpl;

  factory _RevenueModel.fromJson(Map<String, dynamic> json) =
      _$RevenueModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  String get nameOfRevenue;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$RevenueModelImplCopyWith<_$RevenueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
