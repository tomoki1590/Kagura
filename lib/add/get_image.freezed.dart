// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GetImageTearOff {
  const _$GetImageTearOff();

  _GetImage call({File? imageFile}) {
    return _GetImage(
      imageFile: imageFile,
    );
  }
}

/// @nodoc
const $GetImage = _$GetImageTearOff();

/// @nodoc
mixin _$GetImage {
//画像ファイル
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetImageCopyWith<GetImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetImageCopyWith<$Res> {
  factory $GetImageCopyWith(GetImage value, $Res Function(GetImage) then) =
      _$GetImageCopyWithImpl<$Res>;
  $Res call({File? imageFile});
}

/// @nodoc
class _$GetImageCopyWithImpl<$Res> implements $GetImageCopyWith<$Res> {
  _$GetImageCopyWithImpl(this._value, this._then);

  final GetImage _value;
  // ignore: unused_field
  final $Res Function(GetImage) _then;

  @override
  $Res call({
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
abstract class _$GetImageCopyWith<$Res> implements $GetImageCopyWith<$Res> {
  factory _$GetImageCopyWith(_GetImage value, $Res Function(_GetImage) then) =
      __$GetImageCopyWithImpl<$Res>;
  @override
  $Res call({File? imageFile});
}

/// @nodoc
class __$GetImageCopyWithImpl<$Res> extends _$GetImageCopyWithImpl<$Res>
    implements _$GetImageCopyWith<$Res> {
  __$GetImageCopyWithImpl(_GetImage _value, $Res Function(_GetImage) _then)
      : super(_value, (v) => _then(v as _GetImage));

  @override
  _GetImage get _value => super._value as _GetImage;

  @override
  $Res call({
    Object? imageFile = freezed,
  }) {
    return _then(_GetImage(
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_GetImage implements _GetImage {
  const _$_GetImage({this.imageFile});

  @override //画像ファイル
  final File? imageFile;

  @override
  String toString() {
    return 'GetImage(imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetImage &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(imageFile));

  @JsonKey(ignore: true)
  @override
  _$GetImageCopyWith<_GetImage> get copyWith =>
      __$GetImageCopyWithImpl<_GetImage>(this, _$identity);
}

abstract class _GetImage implements GetImage {
  const factory _GetImage({File? imageFile}) = _$_GetImage;

  @override //画像ファイル
  File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$GetImageCopyWith<_GetImage> get copyWith =>
      throw _privateConstructorUsedError;
}
