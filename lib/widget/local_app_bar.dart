import 'package:ecom/widget/theme.dart' as theme;
import 'package:flutter/material.dart';

import '../localization/translation_data.dart';

class LocalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? labelKey;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? arrowColor;
  final List<Widget>? actions;
  final Widget? titleWidget;

  const LocalAppBar(
      {super.key,
      this.labelKey,
      this.backgroundColor = theme.backgroundColor,
      this.labelColor,
      this.arrowColor = theme.textColor,
      this.actions,
      this.titleWidget});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        splashRadius: 25,
        icon: Icon(Icons.arrow_back, color: arrowColor, size: 25),
        onPressed: () => Navigator.of(context).pop(),
      ),
      shadowColor: Colors.transparent,
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      title: titleWidget ??
          (labelKey != null
              ? Text(
                  TranslationData.of(context).text(labelKey!),
                  style: const TextStyle(color: theme.textColor, fontSize: 20),
                )
              : const SizedBox()),
      actions: actions,
    );
  }
}
