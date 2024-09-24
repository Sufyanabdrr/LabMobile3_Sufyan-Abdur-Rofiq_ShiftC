import 'package:flutter/material.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mission Games Page'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          children: [
            _buildGameCard(context, 'Mobile Legends',
                'https://th.bing.com/th/id/OIP.6GTzx0apq8l1bpL3ILIneAHaD5?rs=1&pid=ImgDetMain'),
            _buildGameCard(context, 'PUBG',
                'https://cdn.pixabay.com/photo/2020/06/21/00/17/pubg-logo-5322826_1280.png'),
            _buildGameCard(context, 'Honor of Kings',
                'https://th.bing.com/th/id/OIP.I64hQh1iC8o-Yi7qlrN1gwHaHa?rs=1&pid=ImgDetMain'),
            _buildGameCard(context, 'Free Fire',
                'https://th.bing.com/th/id/OIP.sd607I1-Pyr_aROuAyw1RgAAAA?rs=1&pid=ImgDetMain'),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(
      BuildContext context, String gameName, String imageUrl) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: Icon(Icons.image_not_supported,
                      size: 50, color: Colors.grey[600]),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            gameName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GameDetailPage(gameName: gameName)),
              );
            },
            child: const Text('Start Mission'),
          ),
        ],
      ),
    );
  }
}

class GameDetailPage extends StatelessWidget {
  final String gameName;

  const GameDetailPage({Key? key, required this.gameName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameName),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          'Mission for $gameName started!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
