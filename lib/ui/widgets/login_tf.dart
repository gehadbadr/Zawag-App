
import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldLogin extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? txt;
  String text = "";
  int maxLength = 11;
  TextFieldLogin(
      {Key? key,
        this.controller,
        this.validator,
        this.txt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child:
                  Text(
                    txt!,
                    style: GoogleFonts.cairo(
                      color: Colors.black,
                    ))
            ),
          ),
        ),
        const SizedBox(height: 25, child: VerticalDivider(color: Colors.black)),
        Expanded(
          flex:6,
          child: TextFormField(
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom +165.h
                    ),
                    controller: controller,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    // maxLength: 10,
                    validator: validator,
                    onChanged: (String newVal) {
                      if(newVal.length <= maxLength){
                        print("sadasdasd");
                        text = newVal;
                      }else{
                        print("too long");
                        controller?.value = TextEditingValue(
                            text: text,
                            selection: TextSelection(
                                baseOffset: maxLength,
                                extentOffset: maxLength,
                                affinity: TextAffinity.downstream,
                                isDirectional: false
                            ),
                            composing: TextRange(
                                start: 0, end: maxLength
                            )
                        );
                        controller?.text = text;
                      }
                    },
                    cursorColor: basicPink,
            style: GoogleFonts.cairo(),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      hintText: "رقم الهاتف",
                    ),
                    // onSaved: (String? value) {},
                  ),
          ),
      ],
    );
  }
}