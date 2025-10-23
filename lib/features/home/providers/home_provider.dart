import 'dart:async';
import 'dart:io';

import 'package:domain/domain.dart';
import 'package:domain/repositories/folder_path/models/folder_path_entity.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtscan/features/home/models/home_view_model.dart';

class HomeNotifier extends AsyncNotifier<HomeViewModel> {
  HomeNotifier();

  @override
  FutureOr<HomeViewModel> build() async {
    final result = await ref.read(getFolderPathsProvider).call(NoParams());

    result.ifSuccess((data) {
      return HomeViewModel(folderPaths: data);
    });

    return HomeViewModel(folderPaths: []);
  }

  Future<void> openFilePicker() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.paths.isNotEmpty) {
      // TODO: Send selected files to virus total
      debugPrint(result.paths.toString());

      await sendFile(result.paths.first!);
    }
  }

  Future<void> openFolderPicker() async {
    final result = await FilePicker.platform.getDirectoryPath();

    if (result != null) {
      final saveResult = await ref.read(saveFolderPathProvider).call(result);

      saveResult.when(
        (_) async {
          if (state.value != null) {
            final result = await ref
                .read(getFolderPathsProvider)
                .call(NoParams());

            result.ifSuccess((folderPaths) {
              state = AsyncData(
                state.value!.copyWith(
                  toastState: HomeStatus.saveFolderSuccess,
                  folderPaths: folderPaths,
                ),
              );
            });
          }
        },
        (failure) {
          if (state.value != null) {
            state = AsyncData(
              state.value!.copyWith(toastState: HomeStatus.saveFolderFailure),
            );
          }
        },
      );
    }
  }

  Future<void> sendFile(String path) async {
    state = const AsyncValue.loading();

    final result = await ref.read(postFile).call(File(path));

    // Handle result
    result.ifSuccess((success) {
      debugPrint('aux: $success');
    });
  }

  Future<void> removeFolder(FolderPathEntity folderPath) async {
    state.whenData((data) async {
      state = AsyncData(data.copyWith(toastState: HomeStatus.loading));
      final result = await ref
          .read(deleteFolderPathProvider)
          .call(folderPath.id);

      result.when(
        (_) async {
          final folderPaths = [...data.folderPaths];
          folderPaths.remove(folderPath);
          state = AsyncData(
            data.copyWith(
              toastState: HomeStatus.deleteFolderSuccess,
              folderPaths: folderPaths,
            ),
          );
        },
        (_) => state = AsyncData(
          data.copyWith(toastState: HomeStatus.deleteFolderFailure),
        ),
      );
    });
  }
}

final homeProvider = AsyncNotifierProvider<HomeNotifier, HomeViewModel>(
  () => HomeNotifier(),
);
