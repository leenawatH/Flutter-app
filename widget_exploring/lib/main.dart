import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '6388048',
      theme: ThemeData.light(useMaterial3: true),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('6388048'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.account_circle)),
              Tab(icon: Icon(Icons.featured_play_list_outlined)),
              Tab(icon: Icon(Icons.sync)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/student.jpg'),
                ),
                SizedBox(height: 16),
                Text(
                  'Leenawat Honglerdnapakul',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ListView(
              children: [
                foodTile(
                  'assets/food1.jpg',
                  'Steak A5',
                  'New York Steak House',
                ),
                foodTile(
                  'assets/food2.jpg',
                  'Burger',
                  'Burger King',
                ),
                foodTile(
                  'assets/food3.jpg',
                  'Sandwiches',
                  'Subway',
                ),
                foodTile(
                  'assets/food4.jpg',
                  'Shabu',
                  'Sousaku The Circle',
                ),
                foodTile(
                  'assets/food5.jpg',
                  'Sashimi Salmon',
                  'Sushi Hiro',
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter a message',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Message'),
                        content: Text('You typed: ${textController.text}'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Show Message'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget foodTile(String imagePath, String foodName, String shopName) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(foodName),
      subtitle: Text('Location: $shopName'),
    );
  }
}
