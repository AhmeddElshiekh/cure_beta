import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  Widget _getIndicatorWidget(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return Center(
          child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[400],
              ),
              child: const Center(child: CupertinoActivityIndicator())),
        );
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      default:
        return Center(
          child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[400],
              ),
              child: const Center(child: CircularProgressIndicator())),
        );
    }
  }

  @override
  Widget build(BuildContext context) =>
      _getIndicatorWidget(Theme.of(context).platform);
}
