






import 'package:ab_task/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvestmentTypeWidget extends StatelessWidget {
  final String title;
  const InvestmentTypeWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.greyOne)
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          color: AppColors.blackOne,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}



List<String> investment = [ 'Real Estate', 'Agriculture', 'Gold', 'Transportation'];