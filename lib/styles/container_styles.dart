import 'package:flutter/material.dart';
import 'package:vtscan/extensions/build_context_extensions.dart';

class ContainerStyles {
  static BoxDecoration cardDecoration(BuildContext context) => BoxDecoration(
    color: context.theme.colorScheme.secondaryContainer,
    borderRadius: BorderRadius.circular(10.0),
  );
}
