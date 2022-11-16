// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app_1/transition.dart';
// import 'package:flutter_app_1/utils/shared_preferences.dart';
//
// // import 'home_page.dart';
// import 'models/filter_model.dart';
// import 'models/kurir_model.dart';
// import 'newkurirscreen.dart';
// import 'updatekurirscreen.dart';
//
// class ListItem extends StatefulWidget {
//   final Key key;
//   final Result item;
//   final Result1 item1;
//   final ValueChanged<bool> isSelected;
//
//   ListItem({this.item, this.item1, this.isSelected, this.key});
//
//   @override
//   _ListItemState createState() => _ListItemState();
// }
//
// class _ListItemState extends State<ListItem> {
//   bool isSelected = false;
//   bool isFilter = false;
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       SharedPreferencesHelper.readCariFilter().then((value) {
//         setState(() {
//           isFilter = true;
//         });
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           isSelected = !isSelected;
//           widget.isSelected(isSelected);
//         });
//       },
//       onLongPress: () {
//         if (isSelected == false) {
//           Navigator.of(context).push(ScaleRoute(page: UpdateKurirScreen()));
//           SharedPreferencesHelper.saveKurir(widget.item.name);
//           SharedPreferencesHelper.saveIdKurir(widget.item.id);
//         }
//       },
//       child: Container(
//         height: 80,
//         margin: new EdgeInsets.all(5.0),
//         child: Card(
//           color: isSelected ? Colors.lightBlueAccent : Colors.blue[50],
//           margin: EdgeInsets.only(top: 15.0),
//           child: Padding(
//             padding: EdgeInsets.only(
//                 left: MediaQuery.of(context).size.width * 0.20,
//                 top: MediaQuery.of(context).size.height * 0.025),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   widget.item.name,
//                   style: TextStyle(fontSize: 20),
//                   textAlign: TextAlign.start,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
