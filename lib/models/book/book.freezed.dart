// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
class _$BookTearOff {
  const _$BookTearOff();

  _Book call(
      {required String bookName,
      required String bookCode,
      int? remainingCopies = 0,
      List<String>? contents = const []}) {
    return _Book(
      bookName: bookName,
      bookCode: bookCode,
      remainingCopies: remainingCopies,
      contents: contents,
    );
  }

  Book fromJson(Map<String, Object> json) {
    return Book.fromJson(json);
  }
}

/// @nodoc
const $Book = _$BookTearOff();

/// @nodoc
mixin _$Book {
  String get bookName => throw _privateConstructorUsedError;
  String get bookCode => throw _privateConstructorUsedError;
  int? get remainingCopies => throw _privateConstructorUsedError;
  List<String>? get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res>;
  $Res call(
      {String bookName,
      String bookCode,
      int? remainingCopies,
      List<String>? contents});
}

/// @nodoc
class _$BookCopyWithImpl<$Res> implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  final Book _value;
  // ignore: unused_field
  final $Res Function(Book) _then;

  @override
  $Res call({
    Object? bookName = freezed,
    Object? bookCode = freezed,
    Object? remainingCopies = freezed,
    Object? contents = freezed,
  }) {
    return _then(_value.copyWith(
      bookName: bookName == freezed
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      bookCode: bookCode == freezed
          ? _value.bookCode
          : bookCode // ignore: cast_nullable_to_non_nullable
              as String,
      remainingCopies: remainingCopies == freezed
          ? _value.remainingCopies
          : remainingCopies // ignore: cast_nullable_to_non_nullable
              as int?,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) then) =
      __$BookCopyWithImpl<$Res>;
  @override
  $Res call(
      {String bookName,
      String bookCode,
      int? remainingCopies,
      List<String>? contents});
}

/// @nodoc
class __$BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(_Book _value, $Res Function(_Book) _then)
      : super(_value, (v) => _then(v as _Book));

  @override
  _Book get _value => super._value as _Book;

  @override
  $Res call({
    Object? bookName = freezed,
    Object? bookCode = freezed,
    Object? remainingCopies = freezed,
    Object? contents = freezed,
  }) {
    return _then(_Book(
      bookName: bookName == freezed
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      bookCode: bookCode == freezed
          ? _value.bookCode
          : bookCode // ignore: cast_nullable_to_non_nullable
              as String,
      remainingCopies: remainingCopies == freezed
          ? _value.remainingCopies
          : remainingCopies // ignore: cast_nullable_to_non_nullable
              as int?,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Book implements _Book {
  const _$_Book(
      {required this.bookName,
      required this.bookCode,
      this.remainingCopies = 0,
      this.contents = const []})
      : assert(
            (bookName != " ") & (bookName != ""), 'bookName cannot be  empty'),
        assert(
            (bookCode != " ") & (bookCode != ""), 'bookCode cannot be empty');

  factory _$_Book.fromJson(Map<String, dynamic> json) =>
      _$_$_BookFromJson(json);

  @override
  final String bookName;
  @override
  final String bookCode;
  @JsonKey(defaultValue: 0)
  @override
  final int? remainingCopies;
  @JsonKey(defaultValue: const [])
  @override
  final List<String>? contents;

  @override
  String toString() {
    return 'Book(bookName: $bookName, bookCode: $bookCode, remainingCopies: $remainingCopies, contents: $contents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Book &&
            (identical(other.bookName, bookName) ||
                const DeepCollectionEquality()
                    .equals(other.bookName, bookName)) &&
            (identical(other.bookCode, bookCode) ||
                const DeepCollectionEquality()
                    .equals(other.bookCode, bookCode)) &&
            (identical(other.remainingCopies, remainingCopies) ||
                const DeepCollectionEquality()
                    .equals(other.remainingCopies, remainingCopies)) &&
            (identical(other.contents, contents) ||
                const DeepCollectionEquality()
                    .equals(other.contents, contents)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bookName) ^
      const DeepCollectionEquality().hash(bookCode) ^
      const DeepCollectionEquality().hash(remainingCopies) ^
      const DeepCollectionEquality().hash(contents);

  @JsonKey(ignore: true)
  @override
  _$BookCopyWith<_Book> get copyWith =>
      __$BookCopyWithImpl<_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BookToJson(this);
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {required String bookName,
      required String bookCode,
      int? remainingCopies,
      List<String>? contents}) = _$_Book;

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override
  String get bookName => throw _privateConstructorUsedError;
  @override
  String get bookCode => throw _privateConstructorUsedError;
  @override
  int? get remainingCopies => throw _privateConstructorUsedError;
  @override
  List<String>? get contents => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BookCopyWith<_Book> get copyWith => throw _privateConstructorUsedError;
}
