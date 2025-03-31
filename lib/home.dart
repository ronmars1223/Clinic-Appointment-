import 'package:flutter/material.dart';
import 'dart:ui';
import 'item.dart';
import 'detail_page.dart';

// Data model for featured items
class FeaturedItem {
  final String name;
  final String location;
  final String gender;
  final String breed;
  final String image;

  FeaturedItem({
    required this.name,
    required this.location,
    required this.gender,
    required this.breed,
    required this.image,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int itemCount = 5; // Number of featured items
  late PageController _pageController;
  late int _currentIndex;

  // List of featured items
  final List<FeaturedItem> featuredItems = [
    FeaturedItem(
      name: 'Yumi',
      location: 'Cabantian, Davao City',
      gender: 'Female',
      breed: 'Golden Retriever',
      image: 'assets/doggie8.jpg',
    ),
    FeaturedItem(
      name: 'Max',
      location: 'Matina, Davao City',
      gender: 'Male',
      breed: 'Labrador',
      image: 'assets/catty1.jpg',
    ),
    FeaturedItem(
      name: 'Bellachao',
      location: 'Agdao, Davao City',
      gender: 'Female',
      breed: 'Beagle',
      image: 'assets/doggie9.jpg',
    ),
    FeaturedItem(
      name: 'Niki',
      location: 'Panacan, Davao City',
      gender: 'Female',
      breed: 'Beagle',
      image: 'assets/catty2.jpg',
    ),
    FeaturedItem(
      name: 'Sunshine',
      location: 'Sasa, Davao City',
      gender: 'Female',
      breed: 'Beagle',
      image: 'assets/catty3.jpg',
    ),
  ];

  final List<Item> items = [
    Item(
      name: 'Davao Animal Rescue Volunteers',
      image: 'assets/shelter1.png',
      description: 'DARV is a volunteer-driven organization focused on rescuing animals in distress. They provide temporary shelter, medical care, and help facilitate adoptions.',
    ),
    Item(
      name: 'Bantay Hayop Davao',
      image: 'assets/shelter2.png',
      description: 'Bantay Hayop Davao is dedicated to the protection and welfare of animals in Davao City. This organization is composed of volunteers who aim to rescue, rehabilitate, and provide shelter for stray and abandoned animals.',
    ),
    Item(
      name: 'Davao Animal Rescue Team',
      image: 'assets/shelter3.png',
      description: 'Davao Animal Rescue Team (DART) is a volunteer-based organization dedicated to rescuing, rehabilitating, and providing shelter for animals in distress in Davao City. We work to promote animal welfare and advocate for the humane treatment of all animals.',
    ),
    Item(
      name: 'ARRF',
      image: 'assets/shelter4.png',
      description: 'The Animal Rescue and Rehabilitation Foundation is a nonprofit organization that focuses on the rescue, rehabilitation, and adoption of animals in need. They work with local communities to promote animal welfare and responsible pet ownership.',
    ),
    Item(
      name: 'Happy Animals Club',
      image: 'assets/shelter5.png',
      description: 'Happy Animals Club is focused on improving the lives of abandoned and stray animals through rescue, rehabilitation, and adoption. We aim to create a community that values animal welfare and responsible pet ownership.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 1;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 220, 220),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Cabantian, Davao City',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 16),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Be a Hero,',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          'Adopt, Don’t Shop!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Every adoption helps save a life.',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            // Handle adopt action here
                          },
                          child: const Text(
                            'Adopt Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 18,
                            ),
                            backgroundColor: Color(0xFFEF6B39),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/adopt_us.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Shelters',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Horizontal ListView
            SizedBox(
              height: 100,
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                children: items.map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(item: item),
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 10, 12),
                      child: Container(
                        width: 75,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            item.image,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Featured Title
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Featured Section (Swipeable and Circular)
            Container(
              height: 420, // Set a height for the PageView
              child: PageView.builder(
                controller: _pageController,
                itemCount: featuredItems.length + 2,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                    if (index == 0) {
                      _pageController.jumpToPage(featuredItems.length);
                    } else if (index == featuredItems.length + 1) {
                      _pageController.jumpToPage(1);
                    }
                  });
                },
                itemBuilder: (context, index) {
                  double scale = index == _currentIndex ? 1.0 : 0.8;

                  // Get the current item or wrap around
                  final itemIndex = (index - 1) % featuredItems.length;
                  final item = featuredItems[itemIndex];

                  return Transform.scale(
                    scale: scale,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(item.image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Details section with BackdropFilter
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                height: 150,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)
                                          .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.name,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              item.location,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.white.withOpacity(0.2),
                                          ),
                                          padding: const EdgeInsets.all(8),
                                          child: const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Text(
                                            item.gender,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Text(
                                            item.breed,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Upcoming Events Title
            Container(
              margin: const EdgeInsets.fromLTRB(16, 20, 16,
                  5), // Only vertical margin on top, no margin at the bottom
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Upcoming Events',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Vertical ListView for Upcoming Events
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                // Event 1 Container
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x34090F13),
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.event, size: 40, color: Colors.blue),
                      title: const Text(
                        'Adoption Fair',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('October 30, 2024'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ),
                ),

                // Event 2 Container
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      16, 8, 16, 0), // Same reduced padding
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x34090F13),
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.event, size: 40, color: Colors.green),
                      title: const Text(
                        'Pet Care Workshop',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('November 5, 2024'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ),
                ),

                // Event 3 Container
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      16, 8, 16, 0), // Same reduced padding
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x34090F13),
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.event, size: 40, color: Colors.red),
                      title: const Text(
                        'Volunteering Day',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('November 12, 2024'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16), // Space before the bottom bar
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.pets),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.message),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.group),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
