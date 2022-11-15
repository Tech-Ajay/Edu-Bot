import 'package:edu_bot/view/widget/EduText.dart';
import 'package:flutter/material.dart';

class EduLayout extends StatelessWidget {
  const EduLayout({Key? key, this.mobile, this.tab, this.large})
      : super(key: key);

  final Widget? mobile;
  final Widget? tab;
  final Widget? large;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 768) {
        if (mobile != null) {
          return mobile!;
        } else {
          return Center(
            child: EduText(text: 'No mobile design found'),
          );
        }
      } else {
        if (large != null) {
          return large!;
        } else {
          return Center(
            child: EduText(text: 'No large design found'),
          );
        }
      }
    });
  }
}
