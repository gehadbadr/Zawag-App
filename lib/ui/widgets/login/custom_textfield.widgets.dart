import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String title;
  final TextEditingController controller;
  final Function(String?)? onClick;
  final IconData icon;
  final bool isPass;
  bool? passwordIcon;
  bool isNum;

  CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
    required this.isPass,
    required this.controller,
    this.onClick,
    this.passwordIcon,
    required this.isNum,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorMessage(String str) {
    if (widget.hint == "nameHint".tr) {
      return "nameRequired".tr;
    } else if (widget.hint == "phoneHint".tr) {
      return "phoneRequired".tr;    
    } else if (widget.hint == "ageHint".tr) {
      return "ageRequired".tr; 
    } else if (widget.hint == "emailHint".tr) {
      return "emailRequired".tr;
    } else if (widget.hint == "passwordHint".tr) {
      return "passwordRequired".tr;
    } else if (widget.hint == "repasswordHint".tr) {
      return "repasswordRequired".tr;
    } else if (widget.hint == "oldPasswordHint".tr) {
      return "oldPasswordRequired".tr;
    } else if (widget.hint == "newPasswordHint".tr) {
      return "newPasswordRequired".tr;
    }
   
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 10,
      ),
      Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              
          validator: (value) {
            if (value!.isEmpty) {
              return errorMessage(widget.hint);
            }
          
            if (widget.title ==  "password".tr &&  value.length < 6 ) {
              return "weakPassword".tr;
            }  
            
            
            return null;
          },
          keyboardType: widget.isNum ? const TextInputType.numberWithOptions() :TextInputType.text,
         
              cursorColor: basicPink,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 20.h, horizontal: 15.w),
                hintStyle: GoogleFonts.cairo(fontSize: 14.sp),
                   suffixIcon: widget.isPass == true
                  ? InkWell(
                      onTap: () {
                        widget.passwordIcon = !widget.passwordIcon!;
                        setState(() {});
                      },
                      child: widget.passwordIcon!
                          ? const Icon(
                              Icons.visibility_off,
                              color: basicPink,
                            )
                          : const Icon(Icons.visibility))
                  : null,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: grey, width: 2.w),
                  borderRadius:
                  BorderRadius.all(Radius.circular(15.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: basicPink, width: 1.5.w),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusColor: basicPink,
              ),
              
              controller: widget.controller,
              onSaved: widget.onClick,
            ),
          ),
    
       SizedBox(
        height: 10.h,
      ),
    ]);
  }
}