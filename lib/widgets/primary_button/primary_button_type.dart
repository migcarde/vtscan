import 'package:flutter/material.dart';
import 'package:vtscan/extensions/build_context_extensions.dart';

enum PrimaryButtonType {
  normal,
  error;

  Color getColor(BuildContext context) {
    switch (this) {
      case PrimaryButtonType.normal:
        return context.theme.buttonTheme.colorScheme?.primary ??
            context.theme.primaryColor;
      case PrimaryButtonType.error:
        return context.theme.colorScheme.error;
    }
  }
}
