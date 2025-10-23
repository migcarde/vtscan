import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtscan/extensions/build_context_extensions.dart';
import 'package:vtscan/features/home/models/home_view_model.dart';
import 'package:vtscan/features/home/providers/home_provider.dart';
import 'package:vtscan/features/home/widgets/choose_type_to_scan_dialog.dart';
import 'package:vtscan/features/home/widgets/folder_tile.dart';
import 'package:vtscan/features/overlay_loader/providers/overlay_provider.dart';
import 'package:vtscan/l10n/app_localizations.dart';
import 'package:vtscan/styles/app_dimens.dart';
import 'package:vtscan/widgets/base/base_scaffold.dart';
import 'package:vtscan/widgets/confirmation_bottom_dialog.dart';
import 'package:vtscan/widgets/primary_button/primary_button_type.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    ref.listen(homeProvider.selectAsync((data) => data.status), (
      previous,
      next,
    ) async {
      final state = await next;

      if (context.mounted) {
        ref.read(overlayLoaderNotifier.notifier).hide();
        switch (state) {
          case HomeStatus.saveFolderSuccess:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  l10n.folder_saved_successfully,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
                backgroundColor: context.theme.primaryColor,
              ),
            );
            break;
          case HomeStatus.saveFolderFailure:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  l10n.failed_to_save_folder,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
                backgroundColor: context.theme.colorScheme.error,
              ),
            );
            break;
          case HomeStatus.deleteFolderSuccess:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  l10n.folder_deleted_successfully,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
                backgroundColor: context.theme.primaryColor,
              ),
            );
            break;
          case HomeStatus.deleteFolderFailure:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  l10n.failed_to_delete_folder,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            );
            break;
          case HomeStatus.loading:
            ref.read(overlayLoaderNotifier.notifier).show();
            break;
          case HomeStatus.none:
            break;
        }
      }
    });

    return BaseScaffold(
      title: l10n.folders_to_scan,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () async {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ChooseTypeToScanDialog(
                  onTapFile: () async {
                    await ref.read(homeProvider.notifier).openFilePicker();
                  },
                  onTapFolder: () async {
                    await ref.read(homeProvider.notifier).openFolderPicker();
                  },
                );
              },
            );
          },
        ),
      ],
      child: ref
          .watch(homeProvider)
          .when(
            data: (data) => ListView.separated(
              itemBuilder: (context, index) {
                final folderPath = data.folderPaths[index];

                return FolderTile(
                  path: folderPath.path,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ConfirmationBottomDialog(
                          onTapConfirm: () async {
                            ref
                                .read(homeProvider.notifier)
                                .removeFolder(folderPath);
                            Navigator.of(context).pop();
                          },
                          onTapCancel: () {
                            Navigator.of(context).pop();
                          },
                          title: l10n.are_you_sure,
                          description: l10n.this_action_cannot_be_undone,
                          confirmationText: l10n.delete,
                          cancelText: l10n.cancel,
                          confirmationButtonType: PrimaryButtonType.error,
                        );
                      },
                    );
                  },
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppDimens.m),
              itemCount: data.folderPaths.length,
            ),
            error: (_, _) => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
