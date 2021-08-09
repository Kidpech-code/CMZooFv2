// import 'package:cmzoofv2/Model/animal_model.dart';
// import 'package:cmzoofv2/responsive.dart';
// import 'package:cmzoofv2/service/data/animal_data/animal_menu_data.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AnimalMenu extends StatelessWidget {
//   final List<AnimalMenuModel> _menus = AnimalMenuData().getAnimalMenu();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 250,
//       padding: EdgeInsets.only(top: 15),
//       child: GridView.builder(
//         padding: EdgeInsets.symmetric(horizontal: 12),
//         scrollDirection: Axis.horizontal,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, childAspectRatio: 1),
//         itemBuilder: (context, index) {
//           final AnimalMenuModel menu = _menus[index];
//           return Column(
//             children: [
//               Container(
//                 width: 60,
//                 height: 60,
//                 // ignore: deprecated_member_use
//                 child: FlatButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     side: BorderSide(
//                       color: Colors.black12,
//                     ),
//                   ),
//                   padding: EdgeInsets.all(8),
//                   color: Colors.white,
//                   child: Image.asset(
//                     menu.image,
//                     color: menu.color,
//                   ),
//                   onPressed: () {
//                   },
//                 ),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 menu.title,
//                 style: GoogleFonts.merriweather(
//                   fontWeight: FontWeight.w600,
//                   fontSize: isTab(context) ? 20 : 16,
//                   color: Colors.green[900],
//                 ),
//                 maxLines: 2,
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           );
//         },
//         itemCount: _menus.length,
//       ),
//     );
//   }
// }
