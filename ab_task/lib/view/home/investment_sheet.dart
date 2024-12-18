import 'package:ab_task/core/resources/strings.dart';
import 'package:ab_task/core/resources/styles.dart';
import 'package:ab_task/model/investment.dart';
import 'package:ab_task/view/widgets/c_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../core/resources/colors.dart';
import '../widgets/c_textform_field.dart';



class InvestmentBottomSheet extends StatefulWidget{
  final InvestmentModel investment;
  const InvestmentBottomSheet({ required this.investment,super.key});
  @override
  InvestmentBottomSheetState createState() => InvestmentBottomSheetState();
}

class InvestmentBottomSheetState extends State<InvestmentBottomSheet>  with TickerProviderStateMixin{
  AnimationController? controller ;

  @override
  void initState() {
    controller = BottomSheet.createAnimationController(this);
    controller!.duration = const Duration(milliseconds: 400);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  void openBottomSheet(BuildContext context,InvestmentModel investment ) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        transitionAnimationController: controller,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.85,
            child: InvestmentSheet(investment: investment)
         );
        }
    );
  }

  @override
  Widget build(BuildContext context){
    return Container();
  }
}


class InvestmentSheet extends StatefulWidget {
  final InvestmentModel investment;
  const InvestmentSheet({
    required this.investment,
    super.key
  });

  @override
  State<InvestmentSheet> createState() => _InvestmentSheetState();
}

class _InvestmentSheetState extends State<InvestmentSheet> {
  final phoneNumberController = TextEditingController();
  final customerController = TextEditingController();
  final pinController = TextEditingController();
  List<String> amounts = ['₦5,000', '₦10,000', '₦20,000', '₦50,000'];
  @override
  Widget build(BuildContext context) {
    final investment = widget.investment;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 8,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.greyFour,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            const Gap(20),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(investment.icon!)
                        )
                    ),
                  ),
                  Column(
                    children: [
                      Text(investment.percentage!,
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400
                      ),
                      ),
                      Text(investment.returns!,
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
              const Gap(35),
              Text(investment.name!,
                style: TextStyle(
                  color: AppColors.blackOne,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400
                ),
              ),
              const Gap(10),
              Text('by Property Vest',
                style: TextStyle(
                  color: AppColors.blackOne,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300
                ),
              ),
              const Gap(35),
              Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Wrap(
                spacing: 8.0, 
                runSpacing: 20.0, 
                children: [
                    ...List.generate(amounts.length, (index) {
                    final amount = amounts[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: _amountRow(
                        amount: amount
                      ),
                    );
                  }),
                  SizedBox(
                    width: 234,
                    child: CTextFormField(
                        hintText: AppStrings.search,
                        prefixIcon:const Icon(Icons.search, color: AppColors.grey, size: 18),
                        controller: phoneNumberController,
                        hintStyle: const TextStyle(
                          color: AppColors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                    ),
                  ),
                  ]
                ),
              ),
              const Gap(30),
              const Text(
                 AppStrings.phoneNumber,
                 style: AppStyles.inputTitleStyle
              ),
              const Gap(5),
              CTextFormField(
                  hintText: AppStrings.search,
                  prefixIcon:const Icon(Icons.search, color: AppColors.grey, size: 18),
                  controller: phoneNumberController,
                  hintStyle: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
              ),
              const Gap(20),
               const Text(
                 AppStrings.customerName,
                 style: AppStyles.inputTitleStyle
              ),
              const Gap(5),
               CTextFormField(
                  hintText: AppStrings.search,
                  prefixIcon:const Icon(Icons.search, color: AppColors.grey, size: 18),
                  controller: customerController,
                  hintStyle: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
              ),
              const Gap(20),
              const Text(
                 AppStrings.pin,
                 style: AppStyles.inputTitleStyle
              ),
              const Gap(5),
               CTextFormField(
                  hintText: AppStrings.search,
                  controller: pinController,
                  hintStyle: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
              ),
              const Gap(25),
               CButton(
                height: 40.h,
                width: double.infinity,
                onPressed: (){},
                fillColor: AppColors.primary,
                child: const Text(
                  'INVEST NOW',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Gap(20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.learnMore,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_outlined,
                    color: AppColors.primary,
                    size: 20,
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
  Widget _amountRow({required String amount}){
    return Container(
      width: 110,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.greyThree,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text(
        amount,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.blackOne
        ),
      ),
    );
  }
}