import 'package:vtp_appcaulong/config/config.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final bool outlineButton;
  final String title;
  const CustomElevatedButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.outlineButton = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultWidgetHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: outlineButton
            ? ElevatedButton.styleFrom(
                surfaceTintColor: Colors.white,
                backgroundColor: Colors.white,
                side: BorderSide(
                    width: 2,
                    color:
                        primaryColor.withOpacity(0.5)), // Đường viền màu xanh
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      defaultBorderRadius), // Điều chỉnh độ cong của nút
                ),
              )
            : ElevatedButton.styleFrom(
                backgroundColor: outlineButton ? Colors.white : primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
              ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: outlineButton ? primaryColor : Colors.white,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
