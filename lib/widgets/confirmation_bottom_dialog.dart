import 'package:flutter/material.dart';
import 'package:vtscan/extensions/build_context_extensions.dart';
import 'package:vtscan/styles/app_dimens.dart';
import 'package:vtscan/widgets/primary_button/primary_button.dart';
import 'package:vtscan/widgets/primary_button/primary_button_type.dart';

class ConfirmationBottomDialog extends StatelessWidget {
  const ConfirmationBottomDialog({
    super.key,
    required this.title,
    required this.description,
    required this.confirmationText,
    required this.cancelText,
    required this.onTapConfirm,
    required this.onTapCancel,
    this.confirmationButtonType = PrimaryButtonType.normal,
  });

  final String title;
  final String description;
  final String confirmationText;
  final String cancelText;
  final VoidCallback onTapConfirm;
  final VoidCallback onTapCancel;
  final PrimaryButtonType confirmationButtonType;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.screenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,
              style: context.theme.textTheme.headlineMedium?.copyWith(
                color: context.theme.colorScheme.primary,
              ),
            ),
            Text(description, style: context.theme.textTheme.bodyLarge),
            Padding(
              padding: const EdgeInsets.only(top: AppDimens.l),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButton(
                    text: confirmationText,
                    onTap: onTapConfirm,
                    type: confirmationButtonType,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AppDimens.m),
                    child: GestureDetector(
                      onTap: onTapCancel,
                      child: Text(cancelText),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
