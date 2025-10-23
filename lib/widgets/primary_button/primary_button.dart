import 'package:flutter/material.dart';
import 'package:vtscan/extensions/build_context_extensions.dart';
import 'package:vtscan/styles/app_dimens.dart';
import 'package:vtscan/widgets/primary_button/primary_button_type.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.leftIcon,
    this.type = PrimaryButtonType.normal,
  });

  final String text;
  final VoidCallback onTap;
  final IconData? leftIcon;
  final PrimaryButtonType type;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: AppDimens.buttonHeight,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(AppDimens.buttonPadding),
          decoration: BoxDecoration(
            color: type.getColor(context),
            borderRadius: BorderRadius.circular(AppDimens.cardRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leftIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: AppDimens.s),
                  child: Icon(
                    leftIcon,
                    color: theme.buttonTheme.colorScheme?.surface,
                  ),
                ),
              Text(
                text,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.buttonTheme.colorScheme?.surface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
