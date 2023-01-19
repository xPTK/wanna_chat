import 'dart:math';

abstract class Helpers {
  static Random random = Random();

  static String randomImageUrl() {
    int randomInt = random.nextInt(100);

    return 'https://picsum.photos/seed/$randomInt/300/300';
  }

  static DateTime randomDate() {
    DateTime currentDate = DateTime.now();

    return currentDate.subtract(
      Duration(seconds: random.nextInt(100000)),
    );
  }
}
