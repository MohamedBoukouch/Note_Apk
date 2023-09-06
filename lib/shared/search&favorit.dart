// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class Search_favorit extends StatefulWidget {
//   const Search_favorit({super.key});

//   @override
//   State<Search_favorit> createState() => _Search_favoritState();
// }

// class _Search_favoritState extends State<Search_favorit> {
//   bool isfav = false;
//   TextEditingController searchController = TextEditingController();
//   bool isSearchEmpty = true;

//   void handleSearch(String value) {
//     if (value.isNotEmpty) {
//       setState(() {
//         isSearchEmpty = false;
//       });
//     } else {
//       setState(() {
//         isSearchEmpty = true;
//       });
//     }
//   }

//   void cancelSearch() {
//     FocusScope.of(context).requestFocus(new FocusNode());
//     setState(() {
//       searchController.clear();
//       isSearchEmpty = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               isfav = !isfav;
//             });
//           },
//           child: AnimatedContainer(
//             duration: Duration(milliseconds: 160),
//             height: 50,
//             width: 50,
//             curve: Curves.slowMiddle,
//             decoration: BoxDecoration(
//                 color: isfav ? Colors.blue : Colors.transparent,
//                 border: Border.all(
//                   width: isfav ? 2 : 1,
//                   color: isfav ? Colors.blue.shade700 : Colors.white,
//                 ),
//                 borderRadius: BorderRadius.all(Radius.circular(16))),
//             child: Icon(
//               Icons.flag,
//               color: isfav ? Colors.white : Colors.white,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             alignment: Alignment.center,
//             margin: EdgeInsets.only(left: 8),
//             padding: EdgeInsets.only(left: 16),
//             height: 50,
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.white),
//                 borderRadius: BorderRadius.all(Radius.circular(16))),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: searchController,
//                     maxLines: 1,
//                     onChanged: (value) {
//                       handleSearch(value);
//                     },
//                     autofocus: false,
//                     keyboardType: TextInputType.text,
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//                     textInputAction: TextInputAction.search,
//                     decoration: InputDecoration.collapsed(
//                       hintText: 'Search',
//                       hintStyle: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(isSearchEmpty ? Icons.search : Icons.cancel,
//                       color: Colors.white),
//                   onPressed: cancelSearch,
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
