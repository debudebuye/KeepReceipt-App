import 'package:flutter_test/flutter_test.dart';
import 'package:keep_receipt/core/utils/image_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ImageHelper', () {
    test('imageExists returns false for non-existent file', () async {
      // arrange
      const nonExistentPath = '/non/existent/path.jpg';

      // act
      final result = await ImageHelper.imageExists(nonExistentPath);

      // assert
      expect(result, false);
    });

    test('deleteImage handles non-existent file gracefully', () async {
      // arrange
      const nonExistentPath = '/non/existent/path.jpg';

      // act & assert - should not throw
      await ImageHelper.deleteImage(nonExistentPath);
    });
  });
}
