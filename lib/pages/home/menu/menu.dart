import 'package:flutter/material.dart';
import 'package:tulkit/constants/app_colors.dart';
import 'package:tulkit/constants/strings.dart';
import 'package:tulkit/widgets/home/single_menu_option.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  double padding = kMenuPadding * 1.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: AppColors.grey,
      ),
      padding: EdgeInsets.symmetric(horizontal: kMenuPadding),
      width: double.infinity,
      height: double.infinity,
      child: GridView.count(
        childAspectRatio: (0.8),
        crossAxisCount: 3,
        children: [
          SingleMenuOption(),
          SingleMenuOption(),
          SingleMenuOption(),
          SingleMenuOption(),
          SingleMenuOption(),
          SingleMenuOption(),
          SingleMenuOption(),
        ],
      ),
    );
  }
}
