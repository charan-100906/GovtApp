import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isSecondary;
  final bool isLoading;
  final double height;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isSecondary = false,
    this.isLoading = false,
    this.height = 52,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final Color foregroundColor =
        isSecondary ? AppColors.primary : Colors.white;

    final Color backgroundColor =
        isSecondary ? Colors.white : AppColors.primary;

    return LayoutBuilder(
      builder: (context, constraints) {
        double? buttonWidth = width;

        // If no width was supplied, use the available width
        // only when the parent provides a finite width.
        //
        // This prevents:
        // "BoxConstraints forces an infinite width"
        // when CustomButton is placed inside a Row/Wrap.
        if (buttonWidth == null && constraints.hasBoundedWidth) {
          buttonWidth = constraints.maxWidth;
        }

        return SizedBox(
          width: buttonWidth,
          height: height,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              disabledBackgroundColor: isSecondary
                  ? Colors.white
                  : AppColors.primary.withOpacity(0.6),
              disabledForegroundColor: isSecondary
                  ? AppColors.primary.withOpacity(0.6)
                  : Colors.white,
              elevation: isSecondary ? 0 : 2,
              side: isSecondary
                  ? const BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    )
                  : BorderSide.none,
              minimumSize: Size(0, height),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: isLoading
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        foregroundColor,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (icon != null) ...[
                        Icon(
                          icon,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}