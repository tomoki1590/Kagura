import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliver_appbar/add/get_image.dart';

class GetImageNotifier extends StateNotifier<GetImage> {
  final Reader _read;
  GetImageNotifier(this._read) : super(const GetImage());
  setImageFile(File imageFile) {
    state = state.copyWith(imageFile: imageFile);
  }
}
