import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/responsive.dart';
import 'package:project/app/features/company/presentation/pages/list.dart';
import 'package:project/app/features/customers/presentation/pages/list.dart';
import 'package:project/app/features/dashBoard/presentation/pages/dashBoard.dart';
import 'package:project/app/features/rooms_levels/presentation/pages/list.dart';
import 'package:project/app/features/rooms_unit_general/presentation/pages/list.dart';
import 'package:project/app/features/rooms_unit_special/presentaion/pages/list_special_feature.dart';

import 'app/core/color/app_color.dart';

class DashBoard extends GetView {
  var IndexedStackIndex = 0.obs;
  var openDrawer = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: Text('نظام فندقة لإدارة الوحدات العقارية'),
              elevation: 0,
              backgroundColor: KMain,
            )
          : null,
      drawer: Responsive.isMobile(context) ? _drawer() : null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.blueGrey,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Obx(
              () {
                return Responsive.isMobile(context)
                    ? SizedBox.shrink()
                    : openDrawer.value
                        ? Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: _drawer(),
                          )
                        : SizedBox.shrink();
              },
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        child: _header(
                          textCenter: 'نظام فندقة لإدارة الوحدات العقارية',
                          onMenuPressed: () {
                            openDrawer.value = !openDrawer.value;
                          },
                          onLeftMenuPressed: () {},
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 12,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        child: Obx(
                          () {
                            return IndexedStack(
                              index: IndexedStackIndex.value,
                              children: [
                                DashBoardView(),
                                CustomersListView(),
                                CompanyListView(),
                                UnitGeneralListView(),
                                SpecialFeaturesListView(),
                                RoomsLevelsListView(),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        //color: Colors.blue,
                        child: _footer(
                          textCenter: 'مرحبا بك في نظام فندقة لإدارة الوحدات العقارية',
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header({
    required String textCenter,
    required void Function()? onMenuPressed,
    required void Function()? onLeftMenuPressed,
  }) {
    return Container(
      width: double.infinity,
      color: KMain,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              EvaIcons.menu,
              color: KWhite,
            ),
            onPressed: onMenuPressed,
          ),
          SizedBox(width: 10),
          Text(
            textCenter,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: KWhite,
              height: 1.5,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              EvaIcons.settings,
              color: KWhite,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_on,
              color: KWhite,
            ),
          ),
          IconButton(
            onPressed: onLeftMenuPressed,
            icon: Icon(
              EvaIcons.menu2,
              color: KWhite,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _footer({required String textCenter}) {
    return Container(
      color: KMain,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              EvaIcons.info,
              color: KWhite,
            ),
            SizedBox(width: 10),
            Text(
              textCenter,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer _drawer() {
    return Drawer(
      backgroundColor: KWhite70,
      elevation: 5,
      child: ListView(
        children: [
          buildMenuImage(
            icon: EvaIcons.monitor,
          ),
          buildMenuRow(
            iconLeading: EvaIcons.home,
            title: 'الرئسية',
            isSelected: IndexedStackIndex == 0,
            onTap: () {
              IndexedStackIndex.value = 0;
            },
          ),
          buildMenuRow(
            iconLeading: EvaIcons.person,
            title: 'العملاء',
            isSelected: IndexedStackIndex == 1,
            onTap: () {
              IndexedStackIndex.value = 1;
            },
          ),
          buildMenuRow(
            iconLeading: EvaIcons.cornerDownLeft,
            title: 'الشركات',
            isSelected: IndexedStackIndex == 2,
            onTap: () {
              IndexedStackIndex.value = 2;
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                color: KWhite70,
                child: Row(
                  children: [
                    kSizedBoxSpaceW10(),
                    Text(
                      'الوحدات',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: KMain,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  buildMenuRow(
                    iconLeading: EvaIcons.cornerDownLeft,
                    title: 'المميزات العامة',
                    isSelected: IndexedStackIndex == 3,
                    onTap: () {
                      IndexedStackIndex.value = 3;
                    },
                  ),
                  buildMenuRow(
                    iconLeading: EvaIcons.cornerDownLeft,
                    title: 'المميزات الخاصة',
                    isSelected: IndexedStackIndex == 4,
                    onTap: () {
                      IndexedStackIndex.value = 4;
                    },
                  ),
                  buildMenuRow(
                    iconLeading: EvaIcons.cornerDownLeft,
                    title: 'الطوابق',
                    isSelected: IndexedStackIndex == 5,
                    onTap: () {
                      IndexedStackIndex.value = 5;
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMenuImage({required IconData icon}) {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              icon,
              size: 32,
              color: KWhite70,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'نظام فندقة لإدارة الوحدات العقارية',
            style: TextStyle(
              color: KWhite70,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: buildMenuImageColor,
      ),
    );
  }

  Widget buildMenuRow({
    required String title,
    required IconData iconLeading,
    bool isSelected = false,
    required Function() onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? menuRowSelectedColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          dense: true,
          onTap: onTap,
          leading: Icon(
            iconLeading,
            size: 16,
            color: iconSelectColor,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
