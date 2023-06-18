import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter/material.dart';

class GlassySnackBar extends StatelessWidget {
  final String message;

  const GlassySnackBar({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 300,
      height: 60,
      borderRadius: 20,
      blur: 20,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.white38.withOpacity(0.2),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white24.withOpacity(0.2),
          Colors.white70.withOpacity(0.2),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white.withOpacity(0.8),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: GlassySnackBar(message: text),
    ),
  );
}

showDeleteContactDialog({
  required BuildContext context,
  required VoidCallback onTapC,
  required VoidCallback onTapD,
  required Widget title,
  required Widget content,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        content: Container(
          width: 200.0,
          height: 150.0,
          padding: const EdgeInsets.all(7),
          decoration:   BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(255, 42, 60, 64),
            // borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delete this chat',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Do you want to delete this contact \nUser photo, message , video will be delete from this chat ',
                style: TextStyle(
                  // fontSize: 23,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(204, 251, 245, 245),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: onTapC,
                    child: Container(
                      height: 41,
                      width: 95,
                      alignment: Alignment.center,
                      // color: Colors.green,F
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          // fontSize: 23,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  InkWell(
                    onTap: onTapD,
                    child: Container(
                      height: 41,
                      width: 95,
                      alignment: Alignment.center,
                      // color: Colors.green,
                      child: const Text(
                        'Delete chat',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

// void showAlert() {
//   AlertDialog dialog = AlertDialog(
//     content: Container(
//       width: 260.0,
//       height: 230.0,
//       decoration: const BoxDecoration(
//         shape: BoxShape.rectangle,
//         color: Color(0x00ffffff),
//         borderRadius: BorderRadius.all(Radius.circular(32.0)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           // dialog top
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   // padding: new EdgeInsets.all(10.0),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   child: const Text(
//                     'Rate',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18.0,
//                       fontFamily: 'helvetica_neue_light',
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // dialog centre
//           Expanded(
//             flex: 2,
//             child: Container(
//                 child: TextField(
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 filled: false,
//                 contentPadding: const EdgeInsets.only(
//                     left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
//                 hintText: ' add review',
//                 hintStyle: TextStyle(
//                   color: Colors.grey.shade500,
//                   fontSize: 12.0,
//                   fontFamily: 'helvetica_neue_light',
//                 ),
//               ),
//             )),
//           ),

//           // dialog bottom
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               decoration: const BoxDecoration(
//                 color: Color(0xFF33b17c),
//               ),
//               child: const Text(
//                 'Rate product',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18.0,
//                   fontFamily: 'helvetica_neue_light',
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );

//   showDialog(builder: (context) => dialog, context: context);
// }
