import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtscan/features/overlay_loader/overlay_loader.dart';
import 'package:vtscan/features/overlay_loader/providers/overlay_provider.dart';

class OverlayLoaderWrapper extends ConsumerWidget {
  const OverlayLoaderWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(overlayLoaderNotifier, (previous, next) {
      if (next) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const OverlayLoader(),
        );
      }
    });
    return child;
  }
}
