



import 'package:ab_task/core/resources/colors.dart';
import 'package:ab_task/core/resources/strings.dart';
import 'package:ab_task/view/home/home_widgets.dart';
import 'package:ab_task/view/home/investment_sheet.dart';
import 'package:ab_task/view/widgets/c_button.dart';
import 'package:ab_task/view/widgets/c_card.dart';
import 'package:ab_task/view/widgets/c_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchInvestmentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16, top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CIconButton(
              onPressed: (){
                
              }
            ),
            const Gap(10),
            Text(
              AppStrings.investmentTitle,
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.black.withOpacity(0.5)
              ),
            ),
            const Gap(10),
            RichText(
              text: TextSpan(
                text: AppStrings.investmentSubTitle, 
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.blackOne,
                ),
                children: [
                  TextSpan(
                    text: AppStrings.investmentSubTitleTwo,
                    style:  TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            CTextFormField(
              hintText: AppStrings.search,
              prefixIcon:const Icon(Icons.search, color: AppColors.grey, size: 18),
              controller: searchInvestmentController,
              hintStyle: const TextStyle(
                color: AppColors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
            ),
            const Gap(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(investment.length, (index) {
                    final item = investment[index];
                   // final isSelected = selectedIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: InvestmentTypeWidget(
                      title: item, 
                    ),
                  );
                }),
              ),
            ),
            const Gap(15),
            Expanded(
              child: ListView(
               scrollDirection: Axis.vertical,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children:List.generate(investments.length, (index) {
                        final investmentOne = investments[index];
                        final investmentTwo = investments[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  InvestmentBottomSheetState().openBottomSheet(context,investmentOne);
                                },
                                child: CCard(
                                  icon: investmentOne.icon!, 
                                  name: investmentOne.name!, 
                                  status: investmentOne.status!, 
                                  amount: investmentOne.amount!, 
                                  unit: investmentOne.unit!, 
                                  percentage: investmentOne.percentage!, 
                                  returns: investmentOne.returns!
                                ),
                              ),
                              const Gap(20),
                              GestureDetector(
                                onTap: (){
                                  InvestmentBottomSheetState().openBottomSheet(context,investmentTwo);
                                },
                                child: CCard(
                                  icon: investmentTwo.icon.toString(), 
                                  name: investmentTwo.name!, 
                                  status: investmentTwo.status!, 
                                  amount: investmentTwo.amount!, 
                                  unit: investmentTwo.unit!, 
                                  percentage: investmentTwo.percentage!, 
                                  returns: investmentTwo.returns!
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}