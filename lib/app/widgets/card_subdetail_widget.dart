import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';
import '../theme/style.dart';

class CardSubDetailWidget extends StatelessWidget {
  final Function onTap;
  final String title;
  final Color color;
  const CardSubDetailWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: poppins.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: secondaryJadwalSeminar,
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.assignment_add,
                    color: Colors.white,
                    size: 28.w,
                  ),
                  Text(
                    title,
                    style: poppins.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
