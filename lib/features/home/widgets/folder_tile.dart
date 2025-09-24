import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:vtscan/extensions/build_context_extensions.dart';
import 'package:vtscan/styles/app_dimens.dart';
import 'package:vtscan/styles/container_styles.dart';

class FolderTile extends StatelessWidget {
  const FolderTile({super.key, required this.path, required this.onTap});

  final String path;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final name = path.split('/').last;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.cardPaddingHorizontal,
        vertical: AppDimens.cardPaddingVertical,
      ),
      decoration: ContainerStyles.cardDecoration(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: context.theme.textTheme.titleMedium?.copyWith(
                  color: context.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                path,
                style: context.theme.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.outline,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Icon(
              PhosphorIcons.trash(),
              color: context.colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
