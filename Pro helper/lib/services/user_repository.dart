
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
}

class Get {
  static find() {}
}

class GetxController {}
