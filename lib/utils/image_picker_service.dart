import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerServiceProvider = Provider<ImagePickerService>((ref) {
  return ImagePickerService();
});

class ImagePickerService {
  final _picker = ImagePicker();

  Future<XFile?> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    return pickedFile;
  }
}
