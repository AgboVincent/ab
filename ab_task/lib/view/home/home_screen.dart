import 'package:ab_task/core/resources/colors.dart';
import 'package:ab_task/core/resources/strings.dart';
import 'package:ab_task/model/investment.dart';
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

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final searchInvestmentController = TextEditingController();
  late AnimationController _controller;
  List<InvestmentModel> items = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
 
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _addItemsWithAnimation();
  }

  void _addItemsWithAnimation() async {
    for (int i = 0; i < investments.length; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      items.add(investments[i]);
      _listKey.currentState?.insertItem(i);
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
              prefixIcon:const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 10),
                child: Icon(Icons.search, color: AppColors.greyTwo, size: 20),
              ),
              borderRadius: BorderRadius.circular(12),
              borderSide: const  BorderSide(width: 1, color: AppColors.greyThree),
              fillColor: AppColors.greyThree,
              controller: searchInvestmentController,
              hintStyle: const TextStyle(
                color: AppColors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w300
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
                      children:List.generate((investments.length/2).ceil(), (index) {
                        final investmentOne = investments[index * 2];
                        final investmentTwo = (index * 2 + 1 < investments.length) ? investments[index * 2 + 1]: null;
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
                              investmentTwo != null ?
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
                              ):
                              SizedBox( width: 290.w,)
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