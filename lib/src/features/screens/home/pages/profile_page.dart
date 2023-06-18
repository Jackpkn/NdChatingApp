// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 46,
                          width: 46,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 42, 60, 64),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              CupertinoIcons.back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 46,
                          width: 46,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 42, 60, 64),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        // color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.3,
                        ),
                      ),
                      child: CachedNetworkImage(
                        //   height: 120,
                        // width: 120,
                        imageUrl: auth.currentUser!.photoURL.toString(),
                        imageBuilder: (context, imageProvider) => Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text(
                      auth.currentUser!.displayName.toString(),
                      style:
                          GoogleFonts.acme(fontSize: 22, color: Colors.green),
                    ),
                    Text(
                      auth.currentUser!.email.toString(),
                      style: const TextStyle(color: Colors.amber, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                // const Text('Setting'),
                const ListTileData(
                  title: 'Chat settings',
                  content: 'Chat settings',
                  icon: CupertinoIcons.chat_bubble,
                ),
                const SizedBox(
                  height: 2.6,
                ),
                const ListTileData(
                  title: 'Chat settings',
                  content: 'Chat settings',
                  icon: Icons.privacy_tip_outlined,
                ),
                const SizedBox(
                  height: 2.6,
                ),
                const ListTileData(
                  title: 'Help',
                  content: 'Help center, contact us, privacy policy',
                  icon: Icons.help_outline,
                ),
                const SizedBox(
                  height: 2.6,
                ),
                const ListTileData(
                  title: 'Invite a friend ',
                  content: 'Help center, contact us, privacy policy',
                  icon: Icons.share,
                ),
                const SizedBox(
                  height: 2.6,
                ),
                const ListTileData(
                  title: 'Notifications settings',
                  content: 'Notifications settings',
                  icon: Icons.notifications_none_outlined,
                ),
                const SizedBox(
                  height: 2.6,
                ),
                const ListTileData(
                  title: 'Data and storage',
                  content: 'Notifications settings',
                  icon: Icons.data_usage,
                ),
                const SizedBox(
                  height: 2.6,
                ),
                const ListTileData(
                  title: 'Logout',
                  content: 'Notifications settings',
                  icon: Icons.logout_rounded,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Version 1.0.0 amo_64',
              style: TextStyle(
                color: Color(0x99FFFFFF),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListTileData extends StatelessWidget {
  final String title;
  final String content;
  final IconData? icon;
  const ListTileData({
    Key? key,
    required this.title,
    required this.content,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: const Color.fromARGB(255, 42, 60, 64),
      ),
      child: ListTile(
        minLeadingWidth: 9,
        visualDensity: const VisualDensity(vertical: -1.7),
        contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          content,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - 20;
    final highPoint = size.height - 40;
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
