import 'package:flutter/material.dart';
import 'services/pexels_service.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  List<String> _gameImages = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadImages();
  }

  Future<void> _loadImages() async {
    final images = await PexelsService.fetchImages('mobile game', 8);
    if (!mounted) return;
    setState(() {
      _gameImages = images;
    });
  }

  String _img(int index) =>
      index < _gameImages.length ? _gameImages[index] : '';

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _gameCard({
    required int imageIndex,
    required String title,
    required String genre,
    required String rating,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: _img(imageIndex).isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(_img(imageIndex)),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: Colors.grey[900],
                ),
                child: _img(imageIndex).isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : null,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 0.7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFF00E7C0),
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            genre,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121315),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121315),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(46),
          child: TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFF00E7C0),
            indicatorWeight: 3,
            dividerColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            tabs: const [
              Tab(text: 'Games'),
              Tab(text: 'Recently'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
            child: Column(
              children: [
                Row(children: [
                  _gameCard(imageIndex: 0, title: 'Fantasy World Lucky King', genre: 'RPG · Idle', rating: '6.9'),
                  const SizedBox(width: 10),
                  _gameCard(imageIndex: 1, title: 'Backpacker', genre: 'Roguelike · Merge', rating: '8.7'),
                ]),
                const SizedBox(height: 14),
                Row(children: [
                  _gameCard(imageIndex: 2, title: 'BagMerge', genre: 'Merge · Roguelike', rating: '8.3'),
                  const SizedBox(width: 10),
                  _gameCard(imageIndex: 3, title: 'Relax Even in the Apocalyp...', genre: 'Casual', rating: '5.8'),
                ]),
                const SizedBox(height: 14),
                Row(children: [
                  _gameCard(imageIndex: 4, title: 'MonsterMonster', genre: 'RPG · Idle', rating: '6.8'),
                  const SizedBox(width: 10),
                  _gameCard(imageIndex: 5, title: 'Hammer.io', genre: 'Action · Multiplayer', rating: '8.5'),
                ]),
                const SizedBox(height: 14),
                Row(children: [
                  _gameCard(imageIndex: 6, title: 'LuckyTD', genre: 'Strategy · Tower Defense', rating: '6.9'),
                  const SizedBox(width: 10),
                  _gameCard(imageIndex: 7, title: 'Doomsday: Brave the Mon...', genre: 'Action · Survival', rating: '7.2'),
                ]),
              ],
            ),
          ),
          const Center(
            child: Text(
              'No recent games',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
