import 'package:flutter/material.dart';

import '../../../../core/color/app_color.dart';

class FavTab {
  final String? title;

  FavTab({required this.title});
}

class AuthTypeSelector extends StatefulWidget {
  const AuthTypeSelector(
      {@required this.selectedIndexCallBack, @required this.initValue});

  final int? initValue;
  final ValueChanged<int>? selectedIndexCallBack;

  @override
  State<AuthTypeSelector> createState() => _AuthTypeSelectorState();
}

class _AuthTypeSelectorState extends State<AuthTypeSelector> {
  ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);
  List<FavTab> _authTabs = [
    FavTab(title: "تسجيل دخول"),
    FavTab(title: "عضو جديد"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.initValue != null) {
      _selectedIndexNotifier.value = widget.initValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _selectedIndexNotifier,
        builder: (BuildContext context, int selectedIndex, _) => SizedBox(
              width: 320,
              child: Row(
                children: _authTabs.map((e) {
                  int index = _authTabs.indexOf(e);
                  bool selected = selectedIndex == index;
                  return Expanded(
                    flex: 3,
                    child: GestureDetector(
                        onTap: () {
                          _selectedIndexNotifier.value = index;
                          widget.selectedIndexCallBack!.call(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: selected ? KMain : Colors.grey[200],
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e.title!,
                                      style: TextStyle(
                                          color:
                                              selected ? Colors.white : null),
                                    )
                                  ],
                                ),
                              )),
                        )),
                  );
                }).toList(),
              ),
            ));
  }
}
