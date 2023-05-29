import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownLogin extends StatelessWidget {
  final TextEditingController? phoneController;
  final Function onChanged;
  final String? errorText;
  final String? txt;
  Widget? icon;
  DropDownLogin(
      {Key? key,
        required this.onChanged,
        this.errorText,
        this.phoneController,
        this.txt,
        this.icon
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 50.h,
          // decoration: const InputDecoration(),
          child: Row(
            children: [
              Container(
                child: icon,
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                //  flex: 3,
                child: Text('$txt' ,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
