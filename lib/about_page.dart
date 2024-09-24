import 'package:flutter/material.dart';
import 'package:tugaspertemuan3/sidemenu.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool _isEditing = false;
  final TextEditingController _titleController =
      TextEditingController(text: 'SufyanGaming');
  final TextEditingController _subtitleController =
      TextEditingController(text: 'Level Up Your Mobile Gaming Journey');
  final TextEditingController _descriptionController = TextEditingController(
    text:
        'Selamat datang di SufyanGaming, di mana hasrat bertemu dengan permainan di genggaman tangan Anda. Koleksi game Android pilihan kami, panduan yang mendalam, dan komunitas yang hidup akan mengubah smartphone Anda menjadi portal hiburan tanpa batas. Dari petualangan penuh aksi hingga teka-teki yang memeras otak, kami siap memandu Anda melalui luasnya dunia gaming mobile dan membantu Anda menemukan game favorit berikutnya.',
  );

  Widget _showInput(TextEditingController controller, String label,
      String placeholder, bool isEditing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        isEditing
            ? TextField(
                controller: controller,
                style: const TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: const TextStyle(color: Colors.blue),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                textAlign: TextAlign.center,
              )
            : Text(
                controller.text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_esports, color: Colors.white, size: 30),
            SizedBox(width: 10),
            Text(
              'SufyanGaming - About',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://example.com/marvel_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.sports_esports,
                    size: 100,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                _showInput(
                    _titleController, 'Title :', 'Enter Title', _isEditing),
                const SizedBox(height: 10),
                _showInput(_subtitleController, 'Subtitle :', 'Enter Subtitle',
                    _isEditing),
                const SizedBox(height: 30),
                _showInput(_descriptionController, 'Description :',
                    'Enter Description', _isEditing),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    setState(() {
                      _isEditing = !_isEditing;
                    });
                  },
                  child: Text(
                    _isEditing ? 'Save' : 'Edit',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
