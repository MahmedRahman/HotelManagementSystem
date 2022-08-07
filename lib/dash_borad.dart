import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/features/customers/presentation/pages/list.dart';
import 'package:project/app/features/dashBoard/presentation/pages/dashBoard.dart';

import 'app/core/color/app_color.dart';

class DashBoard extends GetView {
  var IndexedStackIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Obx(
            () {
              return Flexible(
                flex: 2,
                child: Container(
                  child: Drawer(
                    elevation: 5,
                    child: ListView(
                      children: [
                        buildMenuImage(
                          icon: EvaIcons.monitor,
                        ),
                        buildMenuRow(
                          iconLeading: EvaIcons.infoOutline,
                          title: 'الرئسية',
                          isSelected: IndexedStackIndex == 0,
                          onTap: () {
                            IndexedStackIndex.value = 0;
                          },
                        ),
                        buildMenuRow(
                          iconLeading: EvaIcons.infoOutline,
                          title: 'العملاء',
                          isSelected: IndexedStackIndex == 1,
                          onTap: () {
                            IndexedStackIndex.value = 1;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Flexible(
            flex: 10,
            child: Obx(
              () {
                return IndexedStack(
                  index: IndexedStackIndex.value,
                  children: [
                    DashBoardView(),
                    CustomersListView(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuImage({required IconData icon}) {
    return DrawerHeader(
      child: Center(
        child: Icon(
          icon,
          size: 32,
          color: KSecondary,
        ),
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
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
