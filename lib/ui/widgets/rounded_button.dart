import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
        required this.mywidget,
        required this.raduis,
        required this.myfun,
        required this.color})
      : super(key: key);

  final Function() myfun;
  final double raduis;
  final Widget mywidget;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: myfun,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Center(child:mywidget ,),
        // other properties
      ),
    );
  }
}
// TextButton(
//
// style: TextButton.styleFrom(
// backgroundColor: color,
// shape: const RoundedRectangleBorder(
// borderRadius: BorderRadius.all(Radius.circular(12))),
// ),
// onPressed: myfun,
// child: mywidget);