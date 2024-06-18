import 'package:flutter/material.dart';
import 'api_service.dart'; // Update with correct import path

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final APIService apiService = APIService();

  List<String> _locations = [];
  String _selectedOrigin = '';
  String _selectedDestination = '';

  @override
  void initState() {
    super.initState();
    _fetchLocations();
  }

  Future<void> _fetchLocations() async {
    try {
      List<String> locations = await apiService.fetchLocations();
      setState(() {
        _locations = locations;
      });
    } catch (e) {
      // Handle error
      print('Failed to fetch locations: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Search'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _originController,
              decoration: InputDecoration(
                labelText: 'Origin',
                suffixIcon: Icon(Icons.location_on),
              ),
              onTap: () {
                _showLocationPicker(context, true);
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(
                labelText: 'Destination',
                suffixIcon: Icon(Icons.location_on),
              ),
              onTap: () {
                _showLocationPicker(context, false);
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement your search logic here
                _searchFlights();
              },
              child: Text('Search Flights'),
            ),
          ],
        ),
      ),
    );
  }

  void _showLocationPicker(BuildContext context, bool isOrigin) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          child: ListView.builder(
            itemCount: _locations.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_locations[index]),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    if (isOrigin) {
                      _selectedOrigin = _locations[index];
                      _originController.text = _selectedOrigin;
                    } else {
                      _selectedDestination = _locations[index];
                      _destinationController.text = _selectedDestination;
                    }
                  });
                },
              );
            },
          ),
        );
      },
    );
  }

  void _searchFlights() {
    // Implement your flight search logic based on _selectedOrigin and _selectedDestination
    String origin = _selectedOrigin;
    String destination = _selectedDestination;
    String selectedDate = '10 June 2024'; // Replace with your selected date logic

    // Perform further actions like API calls or navigation based on selected values
    print('Origin: $origin, Destination: $destination, Date: $selectedDate');
  }
}
