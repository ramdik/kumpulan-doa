import 'dart:math';

abstract class ImgRand {
  static final random = Random();

  static String randomPictureUrl() {
    final randInt = random.nextInt(1000);
    return 'https://picsum.photos/1920/1080?random=$randInt';
  }
}
