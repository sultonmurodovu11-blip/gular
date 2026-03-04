import 'package:flutter/material.dart';
import 'services/pexels_service.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List<String> _avatarImages = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final images = await PexelsService.fetchImages('person avatar', 3);
    if (!mounted) return;
    setState(() {
      _avatarImages = images;
    });
  }

  String _img(int index) => index < _avatarImages.length ? _avatarImages[index] : '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        actions: [
          Icon(Icons.more_horiz, color: Colors.white),
          SizedBox(width: 20),
        ],
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        title: Text("Inbox"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: _img(0).isNotEmpty ? NetworkImage(_img(0)) : null,
                ),
                SizedBox(width: 20),
                Text(
                  "New Followers",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: _img(1).isNotEmpty ? NetworkImage(_img(1)) : null,
                ),
                SizedBox(width: 20),
                Text(
                  "Activites",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: _img(2).isNotEmpty ? NetworkImage(_img(2)) : null,
                ),
                SizedBox(width: 20),
                Text(
                  "System Notinfications",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
