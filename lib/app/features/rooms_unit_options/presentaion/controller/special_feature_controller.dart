import 'package:get/get.dart';
import 'package:project/app/config/routes/app_pages.dart';
import 'package:project/app/features/rooms_unit_special/data/repositories/room_special_features_repositories.dart';

import '../../data/repositories/unit_options_repositories.dart';
import '../../domain/entities/unit_option.dart';
import '../../domain/usecases/get_all_unit_features.dart';

class UnitOptionController extends GetxController
    with StateMixin<List<UnitOptionEntity>> {
  @override
  void onInit() async {
    getAllUnitOptions();
    return super.onInit();
  }

  void getAllUnitOptions() async {
    GetAllUnitOptionUseCase getAllUnitOptionUseCase =
        GetAllUnitOptionUseCase(UnitOptionRepositoryImpl());
    var data = await getAllUnitOptionUseCase.call();
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (unitOptions) {
        if (unitOptions.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(unitOptions, status: RxStatus.success());
        }
      },
    );
  }

  void addUnitOption(UnitOptionEntity featureEntity) async {
    var data = await UnitOptionRepositoryImpl().addUnitOption(featureEntity);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (feature) {
        change(null, status: RxStatus.success());
        getAllUnitOptions();
      },
    );
  }

  void updateUnitOption({
    required UnitOptionEntity oldFeature,
    required UnitOptionEntity newFeature,
  }) async {
    var data = await UnitOptionRepositoryImpl()
        .updateUnitOption(oldFeature, newFeature);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (feature) {
        change(null, status: RxStatus.success());
        getAllUnitOptions();
      },
    );
  }

  void deleteFeatureSpecial(UnitOptionEntity featureEntity) async {
    var data = await UnitOptionRepositoryImpl().deleteUnitOption(featureEntity);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (feature) {
        change(null, status: RxStatus.success());
        getAllUnitOptions();
      },
    );
  }

  void viewUnitOption(UnitOptionEntity unitOptionEntity) {
    Get.toNamed(
      Routes.UnitOptionView,
      arguments: unitOptionEntity,
    );
  }

  void editUnitOption(UnitOptionEntity unitOptionEntity) {
    Get.toNamed(
      Routes.UnitOptionAddOrEditView,
      arguments: unitOptionEntity,
    );
  }
}
