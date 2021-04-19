// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'scope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Scope _$ScopeFromJson(Map<String, dynamic> json) {
  return _Scope.fromJson(json);
}

/// @nodoc
class _$ScopeTearOff {
  const _$ScopeTearOff();

  _Scope call(
      {required String branch, String? year = "NA", String? section = "NA"}) {
    return _Scope(
      branch: branch,
      year: year,
      section: section,
    );
  }

  Scope fromJson(Map<String, Object> json) {
    return Scope.fromJson(json);
  }
}

/// @nodoc
const $Scope = _$ScopeTearOff();

/// @nodoc
mixin _$Scope {
  String get branch => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  String? get section => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScopeCopyWith<Scope> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScopeCopyWith<$Res> {
  factory $ScopeCopyWith(Scope value, $Res Function(Scope) then) =
      _$ScopeCopyWithImpl<$Res>;
  $Res call({String branch, String? year, String? section});
}

/// @nodoc
class _$ScopeCopyWithImpl<$Res> implements $ScopeCopyWith<$Res> {
  _$ScopeCopyWithImpl(this._value, this._then);

  final Scope _value;
  // ignore: unused_field
  final $Res Function(Scope) _then;

  @override
  $Res call({
    Object? branch = freezed,
    Object? year = freezed,
    Object? section = freezed,
  }) {
    return _then(_value.copyWith(
      branch: branch == freezed
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      section: section == freezed
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ScopeCopyWith<$Res> implements $ScopeCopyWith<$Res> {
  factory _$ScopeCopyWith(_Scope value, $Res Function(_Scope) then) =
      __$ScopeCopyWithImpl<$Res>;
  @override
  $Res call({String branch, String? year, String? section});
}

/// @nodoc
class __$ScopeCopyWithImpl<$Res> extends _$ScopeCopyWithImpl<$Res>
    implements _$ScopeCopyWith<$Res> {
  __$ScopeCopyWithImpl(_Scope _value, $Res Function(_Scope) _then)
      : super(_value, (v) => _then(v as _Scope));

  @override
  _Scope get _value => super._value as _Scope;

  @override
  $Res call({
    Object? branch = freezed,
    Object? year = freezed,
    Object? section = freezed,
  }) {
    return _then(_Scope(
      branch: branch == freezed
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      section: section == freezed
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Scope implements _Scope {
  const _$_Scope({required this.branch, this.year = "NA", this.section = "NA"});

  factory _$_Scope.fromJson(Map<String, dynamic> json) =>
      _$_$_ScopeFromJson(json);

  @override
  final String branch;
  @JsonKey(defaultValue: "NA")
  @override
  final String? year;
  @JsonKey(defaultValue: "NA")
  @override
  final String? section;

  @override
  String toString() {
    return 'Scope(branch: $branch, year: $year, section: $section)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Scope &&
            (identical(other.branch, branch) ||
                const DeepCollectionEquality().equals(other.branch, branch)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.section, section) ||
                const DeepCollectionEquality().equals(other.section, section)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(branch) ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(section);

  @JsonKey(ignore: true)
  @override
  _$ScopeCopyWith<_Scope> get copyWith =>
      __$ScopeCopyWithImpl<_Scope>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ScopeToJson(this);
  }
}

abstract class _Scope implements Scope {
  const factory _Scope(
      {required String branch, String? year, String? section}) = _$_Scope;

  factory _Scope.fromJson(Map<String, dynamic> json) = _$_Scope.fromJson;

  @override
  String get branch => throw _privateConstructorUsedError;
  @override
  String? get year => throw _privateConstructorUsedError;
  @override
  String? get section => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScopeCopyWith<_Scope> get copyWith => throw _privateConstructorUsedError;
}
