import 'package:ab_task/core/resources/icons.dart';
import 'package:ab_task/core/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../core/resources/colors.dart';
import '../../model/investment.dart';

class CCard extends StatelessWidget {
  final String icon;
  final String name;
  final String status;
  final String amount;
  final String unit;
  final String percentage;
  final String returns;
  const CCard({
    required this.icon,
    required this.name,
    required this.status,
    required this.amount,
    required this.unit,
    required this.percentage,
    required this.returns,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290.w,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.greyOne)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(icon)
                    )
                ),
              ),
              Column(
                children: [
                  Text(percentage,
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                  Text(returns,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300
                  ),
                  )
                ],
              )
            ],
          ),
          const Gap(25),
          Text(name,
            style: TextStyle(
              color: AppColors.blackOne,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(amount,
                  style: TextStyle(
                    color: AppColors.blackOne,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                  Text(unit,
                  style: TextStyle(
                    color: AppColors.blackOne,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300
                  ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: status == AppStrings.soldOut ? AppColors.lightRed: AppColors.lightGreen
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: status == AppStrings.soldOut ? AppColors.red: AppColors.green,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}












List<InvestmentModel> investments = [
  InvestmentModel(icon: PngIcons.estateIcon, name: 'Propertyvest Estate', status: AppStrings.stillSelling, amount: 'N5,000', unit: AppStrings.unit, percentage: '20%', returns: AppStrings.returns),
  InvestmentModel(icon: PngIcons.agriTechIcon, name: 'Cashew Nuts', status: AppStrings.soldOut, amount: 'N5,000', unit: AppStrings.unit, percentage: '30%', returns: AppStrings.returns),
  InvestmentModel(icon: PngIcons.thriveIcon, name: 'Cashew Nuts', status: AppStrings.soldOut, amount: 'N5,000', unit: AppStrings.unit, percentage: '30%', returns: AppStrings.returns),
  InvestmentModel(icon: PngIcons.estateIcon, name: 'Propertyvest Estate', status: AppStrings.stillSelling, amount: 'N5,000', unit: AppStrings.unit, percentage: '20%', returns: AppStrings.returns),
  InvestmentModel(icon: PngIcons.agriTechIcon, name: 'Cashew Nuts', status: AppStrings.soldOut, amount: 'N15,000', unit: AppStrings.unit, percentage: '30%', returns: AppStrings.returns), 
  InvestmentModel(icon: PngIcons.thriveIcon, name: 'Cashew Nuts', status: AppStrings.soldOut, amount: 'N15,000', unit: AppStrings.unit, percentage: '30%', returns: AppStrings.returns)
];