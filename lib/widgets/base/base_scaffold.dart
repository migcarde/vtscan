import 'package:flutter/material.dart';
import 'package:vtscan/extensions/build_context_extensions.dart';
import 'package:vtscan/widgets/base/base_screen.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    this.title,
    required this.child,
    this.actions,
  });

  final String? title;
  final List<IconButton>? actions;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar:
          (title != null && title?.isNotEmpty == true) ||
              (title != null && actions != null && actions!.isNotEmpty)
          ? AppBar(
              iconTheme: theme.iconTheme.copyWith(
                color: theme.colorScheme.primary,
              ),
              title: Text(
                title!,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              actionsIconTheme: theme.iconTheme.copyWith(
                color: theme.colorScheme.primary,
              ),
              actions: actions,
            )
          : null,
      body: SafeArea(child: BaseScreen(child: child)),
    );
  }
}
