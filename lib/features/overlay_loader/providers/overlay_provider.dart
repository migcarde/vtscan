import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayLoaderNotifier extends Notifier<bool> {
  @override
  build() {
    return false;
  }

  void show() => state = true;
  void hide() => state = false;
}

final overlayLoaderNotifier = NotifierProvider<OverlayLoaderNotifier, bool>(
  () => OverlayLoaderNotifier(),
);
