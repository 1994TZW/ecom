import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [],
      ),
    );
  }
}

// Widget getMenuItem({
//   required String title,
//   required BuildContext context,
//   required GestureTapCallback onTap,
//   ImageIcon? imgIcon,
//   IconData? iconData,
//   Widget? iconWidget,
// }) {
//   return InkWell(
//     onTap: () {
//       onTap();
//     },
//     child: Padding(
//       padding: const EdgeInsets.only(left: 17.0, right: 25.0, top: 2.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           iconWidget ??
//               (iconData == null && imgIcon == null
//                   ? Container()
//                   : iconData != null
//                       ? Icon(
//                           iconData,
//                           color: primaryColor,
//                         )
//                       : imgIcon!),
//           const SizedBox(width: 15),
//           Flexible(
//               child: ListTile(
//             title: LocalText(context, title, color: Colors.black),
//           )),
//         ],
//       ),
//     ),
//   );
// }
