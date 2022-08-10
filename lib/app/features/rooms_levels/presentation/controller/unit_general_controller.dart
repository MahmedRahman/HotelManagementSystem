import 'package:get/get.dart';
import 'package:project/app/config/routes/app_pages.dart';
import 'package:project/app/features/rooms_levels/data/repositories/rooms_levels_repositories.dart';
import 'package:project/app/features/rooms_levels/domain/entities/rooms_levels.dart';
import 'package:project/app/features/rooms_unit_general/data/repositories/unit_general_repositories.dart';
import 'package:project/app/features/rooms_unit_general/domain/entities/unit_general_entites.dart';


class RoomsLevelsController extends GetxController with StateMixin<List<RoomsLevels>> {
  @override
  void onInit() async {
    getAllRoomsLevels();
    return super.onInit();
  }

  void getAllRoomsLevels() async {
    var data = await await RoomsLevelsRepositoryImpl().getAllRoomsLevels();
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        if (customers.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(customers, status: RxStatus.success());
        }
      },
    );
  }

  void addRoomsLevels(RoomsLevels roomsLevels) async {
    var data = await RoomsLevelsRepositoryImpl().addRoomsLevels(roomsLevels);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (roomsLevels) {
        change(null, status: RxStatus.success());
        getAllRoomsLevels();
      },
    );
  }

  void updateRoomsLevels({
    required RoomsLevels RoomsLevels,
  }) async {
    var data = await RoomsLevelsRepositoryImpl().updateRoomsLevels(RoomsLevels);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(null, status: RxStatus.success());
        getAllRoomsLevels();
      },
    );
  }

  void viewRoomsLevels(RoomsLevels RoomsLevels) {
    Get.toNamed(
      Routes.RoomsLevelsView,
      arguments: RoomsLevels,
    );
  }

  void editRoomsLevels(RoomsLevels RoomsLevels) {
    Get.toNamed(
      Routes.RoomsLevelsAddorEditView,
      arguments: RoomsLevels,
    );
  }

  void deleteRoomsLevels(RoomsLevels roomsLevels) async {
    var data = await RoomsLevelsRepositoryImpl().deleteRoomsLevels(roomsLevels);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(null, status: RxStatus.success());
        getAllRoomsLevels();
      },
    );
  }
}
