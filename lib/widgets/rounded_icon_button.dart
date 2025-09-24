import 'package:flutter/material.dart';
import 'package:vtscan/extensions/build_context_extensions.dart';
import 'package:vtscan/styles/app_dimens.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.buttonPadding),
          child: Icon(
            icon,
            color: context.theme.primaryColor,
            size: AppDimens.iconButtonSize,
          ),
        ),
      ),
    );
  }
}
