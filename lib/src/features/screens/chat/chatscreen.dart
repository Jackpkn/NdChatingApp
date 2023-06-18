import 'package:chatapplication/src/features/models/auth/authmodel.dart';
import 'package:chatapplication/src/features/screens/chat/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ChatScreen extends StatefulWidget {
  final UserModel user;
  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75.0),
            child: AppBar(
              backgroundColor: const Color.fromARGB(255, 42, 27, 27),
              flexibleSpace: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    CupertinoIcons.back,
                    size: 32,
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Profile(
                            userModel: widget.user,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 28,
                          foregroundImage:
                              NetworkImage(widget.user.image.toString()),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.user.name.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Text(
                              'Online',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            LineAwesomeIcons.video_1,
                            size: 29,
                            color: Colors.white,
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          LineAwesomeIcons.phone,
                          size: 29,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // body: Column(
          //   children: [
          //     Expanded(child: ListView.builder(itemBuilder: (context, index) {
          //       return Container();
          //     })),
          //     _sendMessageArea(),
          //   ],
          // ),
          body: Stack(
            children: [
              // write side message from the server of the data
             
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 30, 48, 51),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions,
                              size: 34, color: Colors.white),
                        ),
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: const InputDecoration(),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.image,
                            size: 34,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(4),
                            color: Colors.blue,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// left side message
//   right side message
//   buildItem(int index, DocumentSnapshot? document) {
//     if (document != null) {
//       MessageChat messageChat = MessageChat.fromDocument(document);
//       if (messageChat.idFrom == user.uid) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             messageChat.type == ''
//                 ? Container(
//                     padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
//                     width: 200,
//                     decoration: BoxDecoration(
//                         color: Colors.amber,
//                         borderRadius: BorderRadius.circular(8)),
//                     margin: const EdgeInsets.only(bottom: 10),
//                     child: Text(
//                       messageChat.content,
//                       style: const TextStyle(color: Colors.orange),
//                     ),
//                   )
//                 : messageChat.type == 'TypeMessage.image'
//                     ?

//                     // Image
//                     Container(
//                         margin: const EdgeInsets.only(bottom: 9),
//                         child: OutlinedButton(
//                           onPressed: () {},
//                           style: ButtonStyle(
//                               padding: MaterialStateProperty.all<EdgeInsets>(
//                                   const EdgeInsets.all(0))),
//                           child: Material(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(8)),
//                             clipBehavior: Clip.hardEdge,
//                             child: Image.network(
//                               messageChat.content,
//                               loadingBuilder: (BuildContext context,
//                                   Widget child,
//                                   ImageChunkEvent? loadingProgress) {
//                                 if (loadingProgress == null) return child;
//                                 return Container(
//                                   decoration: const BoxDecoration(
//                                     color: Colors.green,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(8),
//                                     ),
//                                   ),
//                                   width: 200,
//                                   height: 200,
//                                   child: const Center(
//                                     child: CircularProgressIndicator(
//                                         color: Colors.green),
//                                   ),
//                                 );
//                               },
//                               errorBuilder: (context, object, stackTrace) {
//                                 return Material(
//                                   borderRadius: const BorderRadius.all(
//                                     Radius.circular(8),
//                                   ),
//                                   clipBehavior: Clip.hardEdge,
//                                   child: Image.asset(
//                                     'images/img_not_available.jpeg',
//                                     width: 200,
//                                     height: 200,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 );
//                               },
//                               width: 200,
//                               height: 200,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       )
//                     : Container(
//                         margin: const EdgeInsets.only(bottom: 10),
//                         child: Image.asset(
//                           'images/${messageChat.content}.gif',
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       )
//           ],
//         );
//       }
//     }
//   }

//   Widget buildListMessage() {
//     String groupChatId = '';
//     return Flexible(
//       child: groupChatId.isNotEmpty
//           ? StreamBuilder<QuerySnapshot>(
//               // stream: chatProvider.getChatStream(groupChatId, _limit),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasData) {
//                   List<QueryDocumentSnapshot> listMessage = snapshot.data!.docs;
//                   if (listMessage.isNotEmpty) {
//                     return ListView.builder(
//                       padding: const EdgeInsets.all(10),
//                       itemBuilder: (context, index) =>
//                           buildItem(index, snapshot.data?.docs[index]),
//                       itemCount: snapshot.data?.docs.length,
//                       reverse: true,
//                     );
//                   } else {
//                     return const Center(child: Text("No message here yet..."));
//                   }
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   );
//                 }
//               },
//             )
//           : const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.greenAccent,
//               ),
//             ),
//     );
//   }
// }

// _sendMessageArea() {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 8),
//     margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
//     height: 55,
//     color: Colors.white,
//     child: Row(
//       children: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.photo),
//           iconSize: 25,
//           onPressed: () {},
//         ),
//         const Expanded(
//           child: TextField(
//             decoration: InputDecoration.collapsed(
//               hintText: 'Send a message..',
//             ),
//             textCapitalization: TextCapitalization.sentences,
//           ),
//         ),
//         IconButton(
//           icon: const Icon(Icons.send),
//           iconSize: 25,
//           onPressed: () {},
//         ),
//       ],
//     ),
//   );
}

enum ChatMessageType {
  message,
  document,
  audio,
  video,
  gif,
  file,
  image,
}
