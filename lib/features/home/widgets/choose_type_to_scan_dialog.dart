import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:vtscan/extensions/build_context_extensions.dart';
import 'package:vtscan/l10n/app_localizations.dart';
import 'package:vtscan/styles/app_dimens.dart';
import 'package:vtscan/widgets/rounded_icon_button.dart';

class ChooseTypeToScanDialog extends StatelessWidget {
  const ChooseTypeToScanDialog({
    super.key,
    required this.onTapFile,
    required this.onTapFolder,
  });

  final VoidCallback onTapFile;
  final VoidCallback onTapFolder;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppDimens.screenPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            l10n.what_do_you_want_to_scan,
            style: context.theme.textTheme.headlineMedium?.copyWith(
              color: context.theme.colorScheme.primary,
            ),
          ),
          Text(
            l10n.take_in_count_that_os_folders_like_downloads_or_photos_cannot_be_selected,
            style: context.theme.textTheme.bodyLarge,
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppDimens.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    RoundedIconButton(
                      icon: PhosphorIcons.file(),
                      onTap: () {
                        onTapFile();
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(l10n.file),
                  ],
                ),
                Column(
                  children: [
                    RoundedIconButton(
                      icon: PhosphorIcons.folder(),
                      onTap: () {
                        onTapFolder();
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(l10n.folder),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
