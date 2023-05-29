
import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldLogin extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? txt;
  String text = "";
  int maxLength = 10;
  TextFieldLogin(
      {Key? key,
        this.controller,
        this.validator,
        this.txt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: txt,
                  hintStyle:const TextStyle(color: Colors.black),
                  filled: false,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25, child: VerticalDivider(color: Colors.black)),
        Expanded(
          flex:5,
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
                        text = newVal;
                      }else{
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
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      hintText: "1234567890",
                    ),
                    // onSaved: (String? value) {},
                  ),
          ),
      ],
    );
  }
}