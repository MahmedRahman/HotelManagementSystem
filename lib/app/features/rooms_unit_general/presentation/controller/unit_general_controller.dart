import 'package:get/get.dart';
import 'package:project/app/config/routes/app_pages.dart';
import 'package:project/app/features/rooms_unit_general/data/repositories/unit_general_repositories.dart';
import 'package:project/app/features/rooms_unit_general/domain/entities/unit_general_entites.dart';


class UnitGeneralController extends GetxController with StateMixin<List<UnitGeneral>> {
  @override
  void onInit() async {
    getAllUnitGeneral();
    return super.onInit();
  }

  void getAllUnitGeneral() async {
    var data = await await UnitGeneralRepositoryImpl().getAllUnitGeneral();
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

  void addUnitGeneral(UnitGeneral unitGeneral) async {
    var data = await UnitGeneralRepositoryImpl().addUnitGeneral(unitGeneral);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (UnitGenerals) {
        change(null, status: RxStatus.success());
        getAllUnitGeneral();
      },
    );
  }

  void updateUnitGeneral({
    required UnitGeneral unitGeneral,
  }) async {
    var data = await UnitGeneralRepositoryImpl().updateUnitGeneral(unitGeneral);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(null, status: RxStatus.success());
        getAllUnitGeneral();
      },
    );
  }

  void viewUnitGeneral(UnitGeneral unitGeneral) {
    Get.toNamed(
      Routes.UnitGeneralView,
      arguments: unitGeneral,
    );
  }

  void editUnitGeneral(UnitGeneral unitGeneral) {
    Get.toNamed(
      Routes.UnitGeneralAddorEditView,
      arguments: unitGeneral,
    );
  }

  void deleteUnitGeneral(UnitGeneral unitGeneral) async {
    var data = await UnitGeneralRepositoryImpl().deleteUnitGeneral(unitGeneral);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(null, status: RxStatus.success());
        getAllUnitGeneral();
      },
    );
  }
}
