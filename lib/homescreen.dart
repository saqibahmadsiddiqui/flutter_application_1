import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Destination> destinations = [
    Destination(
      imageUrl: 'https://via.placeholder.com/300x200',
      title: 'Niladri Reservoir',
      location: 'Tekergat, Sunamgnj',
      rating: 4.7,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/301x200',
      title: 'Darma Valley',
      location: 'Darma, India',
      rating: 4.5,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/302x200',
      title: 'Lake Louise',
      location: 'Banff, Canada',
      rating: 4.8,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/303x200',
      title: 'Machu Picchu',
      location: 'Cuzco, Peru',
      rating: 4.9,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/304x200',
      title: 'Great Barrier Reef',
      location: 'Queensland, Australia',
      rating: 4.6,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/305x200',
      title: 'Santorini',
      location: 'Cyclades, Greece',
      rating: 4.7,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/306x200',
      title: 'Tokyo',
      location: 'Japan',
      rating: 4.8,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/307x200',
      title: 'Paris',
      location: 'France',
      rating: 4.9,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/308x200',
      title: 'New York City',
      location: 'USA',
      rating: 4.5,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/309x200',
      title: 'Rome',
      location: 'Italy',
      rating: 4.7,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/311x200',
      title: 'Cairo',
      location: 'Egypt',
      rating: 4.6,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/312x200',
      title: 'Rio de Janeiro',
      location: 'Brazil',
      rating: 4.9,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/313x200',
      title: 'Cape Town',
      location: 'South Africa',
      rating: 4.7,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/314x200',
      title: 'Dubai',
      location: 'UAE',
      rating: 4.8,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/316x200',
      title: 'Amsterdam',
      location: 'Netherlands',
      rating: 4.6,
    ),
    Destination(
      imageUrl: 'https://via.placeholder.com/318x200',
      title: 'Prague',
      location: 'Czech Republic',
      rating: 4.8,
    ),
  ];

  List<Destination> visibleDestinations = [];

  @override
  void initState() {
    super.initState();
    visibleDestinations =
        destinations.take(8).toList(); // Show first 8 initially
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Replace with your logged-in user profile image
              ),
              SizedBox(width: 8),
              Text('Leonardo'),
            ],
          ),
        ),
        leadingWidth: 150,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notification press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore the\nBeautiful world!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best Destination',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AllDestinationsScreen(destinations: destinations),
                      ),
                    );
                  },
                  child: Text('View all'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: visibleDestinations.length,
                itemBuilder: (context, index) {
                  return DestinationCard(
                      destination: visibleDestinations[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle bottom navigation item tap
        },
      ),
    );
  }
}

class AllDestinationsScreen extends StatelessWidget {
  final List<Destination> destinations;

  AllDestinationsScreen({required this.destinations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Destinations'),
      ),
      body: ListView.builder(
        itemCount: destinations.length, // Show all 20 places
        itemBuilder: (context, index) {
          return DestinationCard(destination: destinations[index]);
        },
      ),
    );
  }
}

class Destination {
  final String imageUrl;
  final String title;
  final String location;
  final double rating;

  Destination({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.rating,
  });
}

class DestinationCard extends StatelessWidget {
  final Destination destination;

  DestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              destination.imageUrl,
              height: 150,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            destination.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(destination.location),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, size: 16, color: Colors.amber),
              SizedBox(width: 4),
              Text(destination.rating.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
