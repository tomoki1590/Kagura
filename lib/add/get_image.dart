import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_image.freezed.dart';

@freezed
class GetImage with _$GetImage {
  const factory GetImage({
    //画像ファイル
    File? imageFile,
  }) = _GetImage;
}
