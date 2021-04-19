// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'borrowed_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BorrowedBook _$BorrowedBookFromJson(Map<String, dynamic> json) {
  return _BorrowedBook.fromJson(json);
}

/// @nodoc
class _$BorrowedBookTearOff {
  const _$BorrowedBookTearOff();

  _BorrowedBook call(
      {required String email,
      required Book book,
      required DateTime startTime}) {
    return _BorrowedBook(
      email: email,
      book: book,
      startTime: startTime,
    );
  }

  BorrowedBook fromJson(Map<String, Object> json) {
    return BorrowedBook.fromJson(json);
  }
}

/// @nodoc
const $BorrowedBook = _$BorrowedBookTearOff();

/// @nodoc
mixin _$BorrowedBook {
  String get email => throw _privateConstructorUsedError;
  Book get book => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BorrowedBookCopyWith<BorrowedBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BorrowedBookCopyWith<$Res> {
  factory $BorrowedBookCopyWith(
          BorrowedBook value, $Res Function(BorrowedBook) then) =
      _$BorrowedBookCopyWithImpl<$Res>;
  $Res call({String email, Book book, DateTime startTime});

  $BookCopyWith<$Res> get book;
}

/// @nodoc
class _$BorrowedBookCopyWithImpl<$Res> implements $BorrowedBookCopyWith<$Res> {
  _$BorrowedBookCopyWithImpl(this._value, this._then);

  final BorrowedBook _value;
  // ignore: unused_field
  final $Res Function(BorrowedBook) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? book = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $BookCopyWith<$Res> get book {
    return $BookCopyWith<$Res>(_value.book, (value) {
      return _then(_value.copyWith(book: value));
    });
  }
}

/// @nodoc
abstract class _$BorrowedBookCopyWith<$Res>
    implements $BorrowedBookCopyWith<$Res> {
  factory _$BorrowedBookCopyWith(
          _BorrowedBook value, $Res Function(_BorrowedBook) then) =
      __$BorrowedBookCopyWithImpl<$Res>;
  @override
  $Res call({String email, Book book, DateTime startTime});

  @override
  $BookCopyWith<$Res> get book;
}

/// @nodoc
class __$BorrowedBookCopyWithImpl<$Res> extends _$BorrowedBookCopyWithImpl<$Res>
    implements _$BorrowedBookCopyWith<$Res> {
  __$BorrowedBookCopyWithImpl(
      _BorrowedBook _value, $Res Function(_BorrowedBook) _then)
      : super(_value, (v) => _then(v as _BorrowedBook));

  @override
  _BorrowedBook get _value => super._value as _BorrowedBook;

  @override
  $Res call({
    Object? email = freezed,
    Object? book = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_BorrowedBook(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_BorrowedBook implements _BorrowedBook {
  const _$_BorrowedBook(
      {required this.email, required this.book, required this.startTime});

  factory _$_BorrowedBook.fromJson(Map<String, dynamic> json) =>
      _$_$_BorrowedBookFromJson(json);

  @override
  final String email;
  @override
  final Book book;
  @override
  final DateTime startTime;

  @override
  String toString() {
    return 'BorrowedBook(email: $email, book: $book, startTime: $startTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BorrowedBook &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.book, book) ||
                const DeepCollectionEquality().equals(other.book, book)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(book) ^
      const DeepCollectionEquality().hash(startTime);

  @JsonKey(ignore: true)
  @override
  _$BorrowedBookCopyWith<_BorrowedBook> get copyWith =>
      __$BorrowedBookCopyWithImpl<_BorrowedBook>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BorrowedBookToJson(this);
  }
}

abstract class _BorrowedBook implements BorrowedBook {
  const factory _BorrowedBook(
      {required String email,
      required Book book,
      required DateTime startTime}) = _$_BorrowedBook;

  factory _BorrowedBook.fromJson(Map<String, dynamic> json) =
      _$_BorrowedBook.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  Book get book => throw _privateConstructorUsedError;
  @override
  DateTime get startTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BorrowedBookCopyWith<_BorrowedBook> get copyWith =>
      throw _privateConstructorUsedError;
}
