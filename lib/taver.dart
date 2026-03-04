import 'package:flutter/material.dart';
import 'services/pexels_service.dart';

class Taver extends StatefulWidget {
  const Taver({super.key});

  @override
  State<Taver> createState() => _TaverState();
}

class _TaverState extends State<Taver> {
  final List<Map<String, String>> _stories = const [
    {'name': 'Wutherin...'},
    {'name': 'Zenless Z...'},
    {'name': 'PUBG M...'},
    {'name': 'PUBG M...'},
    {'name': 'BGM! On...'},
  ];

  List<String> _storyImages = [];
  String _mainPostImage = '';
  String _headerAvatarImage = '';
  String _secondImage = '';

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final stories = await PexelsService.fetchImages('gaming avatar', 5);
    final posts = await PexelsService.fetchImages('mobile game action', 3);
    final avatar = await PexelsService.fetchImages('gamer portrait', 1);
    if (!mounted) return;
    setState(() {
      _storyImages = stories;
      _mainPostImage = posts.isNotEmpty ? posts[0] : '';
      _headerAvatarImage = avatar.isNotEmpty ? avatar[0] : '';
      _secondImage = posts.length > 1 ? posts[1] : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 20,
        title: const Row(
          children: [
            Text(
              'Following',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 36 / 2,
              ),
            ),
            SizedBox(width: 34 / 2),
            Text(
              'For You',
              style: TextStyle(color: Color(0xFF6E6E6E), fontSize: 36 / 2),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.tune, color: Colors.white, size: 26),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            SizedBox(
              height: 96,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                itemCount: _stories.length,
                itemBuilder: (context, index) {
                  final story = _stories[index];
                  final imageUrl = index < _storyImages.length ? _storyImages[index] : '';
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        Container(
                          width: 66,
                          height: 66,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFFF1B7B),
                              width: 2.3,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundImage: imageUrl.isNotEmpty
                                ? NetworkImage(imageUrl)
                                : null,
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: 66,
                          child: Text(
                            story['name']!,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            _buildMainPost(),
            const SizedBox(height: 14),
            _buildSmallPostHeader(),
            const SizedBox(height: 8),
            _buildSecondImage(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMainPost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _mainPostImage.isNotEmpty
            ? Image.network(
                _mainPostImage,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              )
            : Container(
                width: double.infinity,
                height: 300,
                color: Colors.grey[900],
                child: const Center(child: CircularProgressIndicator()),
              ),
        const SizedBox(height: 14),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'PUBG MOBILE: n.kb ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34 / 2,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFF3AC567),
                child: Icon(Icons.add, color: Colors.white),
              ),
              SizedBox(width: 10),
              Text(
                'Chotki · 11/11/24',
                style: TextStyle(color: Color(0xFFACACAC), fontSize: 30 / 2),
              ),
              Spacer(),
              Icon(Icons.thumb_up_alt_outlined, color: Colors.white, size: 20),
              SizedBox(width: 6),
              Text('0', style: TextStyle(color: Colors.white70)),
              SizedBox(width: 10),
              Icon(Icons.more_horiz, color: Colors.white, size: 22),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSmallPostHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: _headerAvatarImage.isNotEmpty
                ? NetworkImage(_headerAvatarImage)
                : null,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sprout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'sprout_gaming · 2d',
                  style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 16),
                ),
              ],
            ),
          ),
          const Icon(Icons.favorite_border, color: Colors.white, size: 28),
          const SizedBox(width: 6),
          const Text('24', style: TextStyle(color: Colors.white70, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildSecondImage() {
    return Stack(
      children: [
        _secondImage.isNotEmpty
            ? Image.network(
                _secondImage,
                width: double.infinity,
                height: 340,
                fit: BoxFit.cover,
              )
            : Container(
                width: double.infinity,
                height: 340,
                color: Colors.grey[900],
                child: const Center(child: CircularProgressIndicator()),
              ),
        const Positioned(
          top: 10,
          right: 12,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.45),
            child: Icon(Icons.pause, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
