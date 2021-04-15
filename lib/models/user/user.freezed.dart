// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String email,
      required String name,
      required bool isAuthorized,
      required String scope,
      int? year,
      int? section,
      String? hallticketNumber,
      String? designation}) {
    return _User(
      email: email,
      name: name,
      isAuthorized: isAuthorized,
      scope: scope,
      year: year,
      section: section,
      hallticketNumber: hallticketNumber,
      designation: designation,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isAuthorized => throw _privateConstructorUsedError;
  String get scope => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  int? get section => throw _privateConstructorUsedError;
  String? get hallticketNumber => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String name,
      bool isAuthorized,
      String scope,
      int? year,
      int? section,
      String? hallticketNumber,
      String? designation});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? isAuthorized = freezed,
    Object? scope = freezed,
    Object? year = freezed,
    Object? section = freezed,
    Object? hallticketNumber = freezed,
    Object? designation = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthorized: isAuthorized == freezed
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
      scope: scope == freezed
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      section: section == freezed
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as int?,
      hallticketNumber: hallticketNumber == freezed
          ? _value.hallticketNumber
          : hallticketNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: designation == freezed
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String name,
      bool isAuthorized,
      String scope,
      int? year,
      int? section,
      String? hallticketNumber,
      String? designation});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? isAuthorized = freezed,
    Object? scope = freezed,
    Object? year = freezed,
    Object? section = freezed,
    Object? hallticketNumber = freezed,
    Object? designation = freezed,
  }) {
    return _then(_User(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isAuthorized: isAuthorized == freezed
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
      scope: scope == freezed
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      section: section == freezed
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as int?,
      hallticketNumber: hallticketNumber == freezed
          ? _value.hallticketNumber
          : hallticketNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: designation == freezed
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_User implements _User {
  const _$_User(
      {required this.email,
      required this.name,
      required this.isAuthorized,
      required this.scope,
      this.year,
      this.section,
      this.hallticketNumber,
      this.designation});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String email;
  @override
  final String name;
  @override
  final bool isAuthorized;
  @override
  final String scope;
  @override
  final int? year;
  @override
  final int? section;
  @override
  final String? hallticketNumber;
  @override
  final String? designation;

  @override
  String toString() {
    return 'User(email: $email, name: $name, isAuthorized: $isAuthorized, scope: $scope, year: $year, section: $section, hallticketNumber: $hallticketNumber, designation: $designation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isAuthorized, isAuthorized) ||
                const DeepCollectionEquality()
                    .equals(other.isAuthorized, isAuthorized)) &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.section, section) ||
                const DeepCollectionEquality()
                    .equals(other.section, section)) &&
            (identical(other.hallticketNumber, hallticketNumber) ||
                const DeepCollectionEquality()
                    .equals(other.hallticketNumber, hallticketNumber)) &&
            (identical(other.designation, designation) ||
                const DeepCollectionEquality()
                    .equals(other.designation, designation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isAuthorized) ^
      const DeepCollectionEquality().hash(scope) ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(section) ^
      const DeepCollectionEquality().hash(hallticketNumber) ^
      const DeepCollectionEquality().hash(designation);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {required String email,
      required String name,
      required bool isAuthorized,
      required String scope,
      int? year,
      int? section,
      String? hallticketNumber,
      String? designation}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  bool get isAuthorized => throw _privateConstructorUsedError;
  @override
  String get scope => throw _privateConstructorUsedError;
  @override
  int? get year => throw _privateConstructorUsedError;
  @override
  int? get section => throw _privateConstructorUsedError;
  @override
  String? get hallticketNumber => throw _privateConstructorUsedError;
  @override
  String? get designation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
