import 'package:flutter/material.dart';
import 'package:elrawdah/constants.dart';
import 'package:elrawdah/screens/widgets/bottom_sheet_header_title.dart';
import 'package:elrawdah/screens/widgets/exercise_tile.dart';
import 'package:elrawdah/screens/widgets/greet.dart';
import 'package:elrawdah/screens/widgets/search_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elegant Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<void> initializationFuture;

  @override
  void initState() {
    super.initState();
    initializationFuture = initialization();
  }

  Future<void> initialization() async {
    // Simulate some initialization work
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: FutureBuilder<void>(
          future: initializationFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const HomeContent();
            }
          },
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Greet(),
          const SizedBox(height: 25.0),
          // const SearchField(),
          const SizedBox(height: 25.0),
          const SizedBox(height: 20.0),
          const Expanded(
            child: ExerciseList(),
          ),
        ],
      ),
    );
  }
}

class ExerciseList extends StatelessWidget {
  const ExerciseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ExerciseCard(
          exercise: ' الاستعلام عن القبر',
          icon: Icons.menu_book,
          color: Colors.pink,
        ),
        ExerciseCard(
          exercise: ' المكتبة الاعلامية',
          icon: Icons.video_library,
          color: Colors.pink,
        ),
        ExerciseCard(
          exercise: ' التنبيهات',
          icon: Icons.notifications,
          color: Colors.pink,
        ),
        ExerciseCard(
          exercise: ' المكتبة',
          icon: Icons.library_books,
          color: Colors.pink,
        ),
        ExerciseCard(
          exercise: 'مواقع المقابر ',
          icon: Icons.location_on,
          color: Colors.orange,
        ),
      ],
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String exercise;
  final IconData icon;
  final Color color;

  const ExerciseCard({
    Key? key,
    required this.exercise,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: Icon(icon, color: color, size: 32),
        title: Text(
          exercise,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
