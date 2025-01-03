import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'app_state.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:typed_data';

class Scan extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<Scan> {
  final TextEditingController _manualEntryController = TextEditingController();
  CameraController? _cameraController;
  bool _isScanning = false;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    await _cameraController!.initialize();
    setState(() {});
  }

  void _startScanning() {
    setState(() {
      _isScanning = true;
    });
    _captureFrame();
  }

  void _stopScanning() {
    setState(() {
      _isScanning = false;
    });
  }

  void _captureFrame() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        final image = await _cameraController!.takePicture();
        final imageBytes = await image.readAsBytes();

        final response = await http.post(
          Uri.parse('http://192.168.146.1:8000/scan'),
          headers: {'Content-Type': 'application/octet-stream'},
          body: imageBytes,
        );

        if (response.statusCode == 200) {
          final detectedText = jsonDecode(response.body)['detected_text'];
          _manualEntryController.text = detectedText;
          _stopScanning();
        } else {
          _showErrorDialog('Failed to recognize number plate');
        }
      } catch (e) {
        _showErrorDialog('An error occurred while capturing the frame');
      }
    }
  }

  void _searchNumberPlate() async {
    final appState = AppState.of(context);
    final email = appState.email;
    final communityCode = appState.communityCode;
    final numberPlate = _manualEntryController.text;

    try {
      final response = await http.post(
        Uri.parse('http://192.168.146.1:5000/vehicle-details'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'community_code': communityCode,
          'number_plate': numberPlate,
        }),
      );

      if (response.statusCode == 200) {
        final vehicleDetails = jsonDecode(response.body)['vehicle'];
        _showVehicleDetails(vehicleDetails);
      } else {
        _showErrorDialog('Vehicle not found');
      }
    } catch (e) {
      _showErrorDialog('An error occurred');
    }
  }

  void _showVehicleDetails(Map<String, dynamic> vehicle) {
    final phoneNumber = vehicle['contact_info'].toString();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Vehicle Details'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Owner: ${vehicle['owner_name']}'),
            GestureDetector(
              onTap: () async {
                final uri = Uri(scheme: 'tel', path: phoneNumber);
                await launchUrlString(uri.toString());
              },
              child: Text(
                'Contact: $phoneNumber',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Text('Address: ${vehicle['address']}'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/home');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/register');
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/scan');
          break;
        case 3:
          Navigator.pushReplacementNamed(context, '/admin');
          break;
      }
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _manualEntryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Number Plate'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _isScanning ? _stopScanning : _startScanning,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _cameraController != null && _cameraController!.value.isInitialized
                ? CameraPreview(_cameraController!)
                : Center(child: CircularProgressIndicator()),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _manualEntryController,
                  decoration: InputDecoration(
                    labelText: 'Detected Text',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _searchNumberPlate,
                  child: Text('Search Number Plate'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Register'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Scan'),
          BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings), label: 'Admin'),
        ],
      ),
    );
  }
}
