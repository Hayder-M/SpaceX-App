import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../services/api_service.dart';
import '../models/launch.dart';
import 'details_screen.dart';
import 'package:intl/intl.dart'; // Import intl package

class LaunchListScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SpaceX Launches')),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchLaunches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final launches =
                snapshot.data!.map((e) => Launch.fromJson(e)).toList();
            return CarouselSlider.builder(
              itemCount: launches.length,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.6,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              itemBuilder: (context, index, realIndex) {
                final launch = launches[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(launch: launch),
                    ),
                  ),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://via.placeholder.com/300x200?text=${launch.name}',
                                ),
                                fit: BoxFit.cover,
                              ),
                              gradient: LinearGradient(
                                colors: [Colors.black54, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                launch.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              // Format the date using DateFormat
                              Text(
                                launch.date != null
                                    ? 'Date: ${DateFormat('yyyy-MM-dd').format(launch.date!)}'
                                    : '2024-08-05',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                launch.details ?? 'No details available',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
