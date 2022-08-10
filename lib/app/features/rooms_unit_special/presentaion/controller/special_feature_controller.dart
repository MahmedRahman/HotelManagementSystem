import 'package:get/get.dart';
import 'package:project/app/config/routes/app_pages.dart';
import 'package:project/app/features/customers/data/repositories/customer_repositories.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/domain/usecases/get_all_customer.dart';
import 'package:project/app/features/rooms_unit_special/data/repositories/room_special_features_repositories.dart';
import 'package:project/app/features/rooms_unit_special/domain/entities/room_special_features.dart';
import 'package:project/app/features/rooms_unit_special/domain/usecases/get_all_special_feature.dart';

class SpecialFeatureController extends GetxController
    with StateMixin<List<SpecialFeatureEntity>> {
  @override
  void onInit() async {
    getAllSpecialFeatures();
    return super.onInit();
  }

  void getAllSpecialFeatures() async {
    GetAllSpecialFeatureUseCase getAllSpecialFeatureUseCase =
        GetAllSpecialFeatureUseCase(SpecialFeatureRepositoryImpl());
    var data = await getAllSpecialFeatureUseCase.call();
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (features) {
        if (features.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(features, status: RxStatus.success());
        }
      },
    );
  }

  void addSpecialFeature(SpecialFeatureEntity featureEntity) async {
    var data =
        await SpecialFeatureRepositoryImpl().addSpecialFeature(featureEntity);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (feature) {
        change(null, status: RxStatus.success());
        getAllSpecialFeatures();
      },
    );
  }

  void updateSpecialFeature({
    required SpecialFeatureEntity oldFeature,
    required SpecialFeatureEntity newFeature,
  }) async {
    var data = await SpecialFeatureRepositoryImpl()
        .updateSpecialFeature(oldFeature, newFeature);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (feature) {
        change(null, status: RxStatus.success());
        getAllSpecialFeatures();
      },
    );
  }

  void deleteFeatureSpecial(SpecialFeatureEntity featureEntity) async {
    var data =
        await SpecialFeatureRepositoryImpl().deleteSpecialFeature(featureEntity);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (feature) {
        change(null, status: RxStatus.success());
        getAllSpecialFeatures();
      },
    );
  }

  void viewSpecialFeature(SpecialFeatureEntity featureEntity) {
    Get.toNamed(
      Routes.SpecialFeatureView,
      arguments: featureEntity,
    );
  }

  void editSpecialFeature(SpecialFeatureEntity featureEntity) {
    Get.toNamed(
      Routes.SpecialFeatureAddOrEditView,
      arguments: featureEntity,
    );
  }
}
