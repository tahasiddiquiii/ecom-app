import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utilz/colors.dart';

class StyledCustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String name;
  final bool isLoading;
  final Color? bgColor;
  final Color? textColor;

  StyledCustomButton({
    Key? key,
    required this.onTap,
    required this.name,
    this.isLoading = false,
    this.bgColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: Adaptive.h(6),
        width: Adaptive.w(45),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          border:
              Border.all(color: bgColor ?? buttonColor // Default button color
                  ),
          color: bgColor ?? Colors.white, // Default background color
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(textColor ?? Colors.blue),
                )
              : Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 15.px,
                    color: textColor ?? buttonColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
