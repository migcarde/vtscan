import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtscan/features/overlay_loader/providers/overlay_provider.dart';
import 'package:vtscan/styles/app_dimens.dart';

class OverlayLoader extends ConsumerWidget {
  const OverlayLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(overlayLoaderNotifier, (previous, next) {
      if (!next && Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    });
    return Center(
      child: Container(
        padding: const EdgeInsets.all(AppDimens.m),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimens.s),
        ),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
