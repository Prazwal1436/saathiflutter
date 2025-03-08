import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';

class LogoComponent extends StatelessWidget {
  final double width;
  final double height;

  const LogoComponent({Key? key, required this.width, required this.height})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppThemeExtension>()!;

    return Image.asset(
      theme.logoPath,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.error,
          size: width,
          color: Colors.red,
        ); // Shows fallback icon
      },
    );
  }
}
