import 'package:flutter/material.dart';
import '../../core/resources/colors.dart';

class CButton extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Color? fillColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final Widget? child;
  const CButton({
    this.onPressed,
    this.title,
    this.fillColor,
    this.textColor,
    this.height,
    this.width,
    this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: fillColor != null? Border.all(
            color: AppColors.primary,
            width: 1
        ): null,
        borderRadius: BorderRadius.circular(16),
        gradient: fillColor == null?
        const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF27A445), Color(0xFF42AA48), Color(0xFFF4D35E)],
        ): null,
      ),
      child: RawMaterialButton(
        fillColor: fillColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: child ?? Text(
          title!,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              color: textColor
          ),
        ),
      ),
    );
  }
}


class CTextButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final Widget? child;
  const CTextButton({
    this.text,
    this.onPressed,
    this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 0),
          alignment: Alignment.center
      ),
      onPressed: onPressed,
      child: child ?? Text(
        text.toString(),
        style: const TextStyle(
            color: AppColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}

class CIconButton extends StatelessWidget {
  final Function() onPressed;
  const CIconButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Transform.translate(
          offset: const Offset(-12, 0),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined, 
            color: AppColors.blackOne, 
            size: 20,
         ),
      )
    );
  }
}

