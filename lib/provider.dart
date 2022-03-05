import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'add/get_image.dart';
import 'add/get_image_notifier.dart';

final picker = ImagePicker();
final getImageProvider = StateNotifierProvider<GetImageNotifier, GetImage>(
    (ref) => GetImageNotifier(ref.read));

String input = "";
final getHomeName = StateProvider((ref) {
  return input;
});
