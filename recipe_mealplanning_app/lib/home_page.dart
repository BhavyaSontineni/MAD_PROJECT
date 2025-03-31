import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart'; //  marquee package
import 'recipe_category_screen.dart';
import 'profile_page.dart';
import 'meal_planning_screen.dart';
import 'grocery_list_screen.dart';

class HomePage extends StatefulWidget {
  final String userId;

  const HomePage({super.key, required this.userId});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> messages = [
    "Welcome to Recipe and Meal Planning",
    "Discover Recipe Specials That'll Make Your Taste Buds Do a Happy Dance!",
    "Exciting Meals That Won't Cook Themselves, But You Can!",
    "Unleash Your Inner Foodie and See What Happens!",
  ];

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      // Removed the "Explore Your Home" and other messages, keeping only the background
      Column(
        children: [
          Container(
            height: 50, // Height of the marquee container
            color: const Color(0xFFAF7AC5), // Background color of the marquee
            child: Marquee(
              text: messages.join('   |   '), // Join messages for scrolling
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 50.0,
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: PageView(
              children: const [
                
              ],
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ],
      ),
      RecipeCategoryScreen(
        userId: widget.userId,
      ), // Passing userId to RecipeCategoryScreen
      MealPlanningScreen(
        userId: widget.userId,
      ), // Add Meal Planning Screen
      GroceryListScreen(
        userId: widget.userId,
      ), // Add Grocery List Screen
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nourish Note'),
        centerTitle: true,
        backgroundColor: const Color(0xFFAF7AC5),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(userId: widget.userId),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/bg.jpeg', // Ensure you have an image in your assets folder
              fit: BoxFit.cover,
            ),
          ),
          // Main content on top of the background image
          _pages[_selectedIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt), // Recipe List icon
            label: 'Recipe List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule), // Meal Planning icon
            label: 'Meal Planning',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list), // Grocery List icon
            label: 'Grocery List',
          ),
        ],
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Update the selected index
        selectedItemColor: Colors.blue, // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
        backgroundColor:
            const Color(0xFFEBDEF0), // Background color for the navigation bar
      ),
    );
  }
}
