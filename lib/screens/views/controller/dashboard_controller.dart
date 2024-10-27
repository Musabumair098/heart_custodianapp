import '../model/carousel_image.dart';


class DashboardController {
  final List<CarouselImage> imageList = [
    CarouselImage(id: 1, imagePath: 'assets/images/banner.jpg'),
    CarouselImage(id: 2, imagePath: 'assets/images/banner_1.jpg'),
    CarouselImage(id: 3, imagePath: 'assets/images/banner_1.jpg'),
  ];

  int currentIndex = 0;

  void updateCurrentIndex(int index) {
    currentIndex = index;
  }
}
