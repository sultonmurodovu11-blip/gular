import 'package:flutter/material.dart';
import 'services/pexels_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _images = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final images = await PexelsService.fetchImages('gaming', 3);
    if (!mounted) return;
    setState(() {
      _images = images;
    });
  }

  String _img(int index) => index < _images.length ? _images[index] : '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: TextField(
          cursorColor: Colors.grey[500],
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.white),
            hintText: "Qidiruv...",
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        actions: [
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "Discover",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Top Charts",
                      style: TextStyle(color: Colors.grey[500], fontSize: 18),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Calendar",
                      style: TextStyle(color: Colors.grey[500], fontSize: 18),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Gamelist",
                      style: TextStyle(color: Colors.grey[500], fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 75,
                height: 8,
                margin: EdgeInsets.only(top: 15),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "For You",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 130,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Editors' Choice",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 80,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Arcade",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 80,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Street",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 350,
                  height: 350,
                  margin: EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        height: 250,
                        decoration: BoxDecoration(
                          image: _img(0).isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(_img(0)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          color: _img(0).isEmpty ? Colors.grey[900] : null,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: _img(0).isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 350,
                  height: 350,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                image: _img(1).isNotEmpty
                                    ? DecorationImage(
                                        image: NetworkImage(_img(1)),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                                color: _img(1).isEmpty ? Colors.grey[900] : null,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: _img(1).isEmpty
                                  ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
                                  : null,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Lone Necromancer",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Idle Rpg",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          Container(
                            width: 85,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.green, width: 3),
                            ),
                            child: Center(
                              child: Text(
                                "Download",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 350,
                        height: 250,
                        decoration: BoxDecoration(
                          image: _img(2).isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(_img(2)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          color: _img(2).isEmpty ? Colors.grey[900] : null,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: _img(2).isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
