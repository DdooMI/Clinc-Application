import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var favoriteDoctors = <Map<String, dynamic>>[].obs;

  void toggleFavorite(Map<String, dynamic> doctor) {
    if (isFavorite(doctor)) {
      favoriteDoctors
          .removeWhere((element) => element['name'] == doctor['name']);
    } else {
      favoriteDoctors.add(doctor);
    }
  }

  bool isFavorite(Map<String, dynamic> doctor) {
    return favoriteDoctors.any((element) => element['name'] == doctor['name']);
  }
}
