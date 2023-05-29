import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeInput extends StatelessWidget {
  final FocusNode? focusNode0;
  TextEditingController controller = TextEditingController();
  bool first;
  bool last;

  CodeInput({Key? key, this.focusNode0, required this.controller,required this.first,required this.last})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
      child: TextField(
        scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 200.h),
        cursorColor: basicPink,
        controller: controller,

        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        focusNode: focusNode0,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(color: basicPink),
        onChanged: (str) {
          if (str.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if(str.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: bblack, width: 2.3),
          ),
          hintStyle: TextStyle(color: Colors.grey),
          counterText: "",
          focusColor: basicPink,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: basicPink, width: 3.0),
          ),
        ),
      ),
    );
  }
}
