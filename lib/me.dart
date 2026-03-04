import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.brown,
              child: Center(
                child: Text(
                  "S",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                Text("Sultonmurodov", style: TextStyle(color: Colors.white)),
                Text(
                  "Id : 162842982",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ],
        ),
        actions: [
          Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
          SizedBox(width: 10),
        ],
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
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
                        "Installed",
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
                        "Updates",
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
                        "Pre rehister",
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
                        "Wished",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text(
                  "Play Time",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(width: 15),
                Container(
                  width: 35,
                  child: Center(
                    child: Text("Off", style: TextStyle(color: Colors.white)),
                  ),
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text(
                            "Pubg Mobile",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Viewed 01/02/26",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 15),
                      child: Container(
                        width: 35,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[700],
                        ),
                        child: Center(child: Text("KR")),
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.more_vert, color: Colors.white),
                    Container(
                      width: 75,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          "Play",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text(
                            "Mobile Legend",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Viewed 02/07/20",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 15),
                      child: Container(
                        width: 35,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[700],
                        ),
                        child: Center(child: Text("UZ")),
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.more_vert, color: Colors.white),
                    Container(
                      width: 75,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          "Play",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text(
                            "Memory game",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Viewed 18/09/25",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 15),
                      child: Container(
                        width: 35,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[700],
                        ),
                        child: Center(child: Text("TJ")),
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.more_vert, color: Colors.white),
                    Container(
                      width: 75,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          "Play",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text(
                            "Blur Game",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Viewed 15/07/26",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 15),
                      child: Container(
                        width: 35,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[700],
                        ),
                        child: Center(child: Text("KG")),
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.more_vert, color: Colors.white),
                    Container(
                      width: 75,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          "Play",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
