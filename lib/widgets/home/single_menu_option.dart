import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tulkit/constants/app_colors.dart';
import 'package:tulkit/constants/strings.dart';
import 'package:tulkit/pages/pomodoro/pair_pomodoro_timer.dart';
import 'package:tulkit/widgets/tags/menu_tag.dart';

class SingleMenuOption extends StatelessWidget {

  final String imageAsset;
  final String optionName;
  final String menuTag;

  SingleMenuOption({
    @required this.imageAsset,
    @required this.optionName,
    this.menuTag
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PairPomodoroTimerCircleAnimation()),
      );},
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: AppColors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(imageAsset),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      optionName,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontFamily: kMontserratFont,
                          fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MenuTag(
                        text: menuTag,
                        textColor: AppColors.darkPink,
                        containerColor: AppColors.lightPink
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
