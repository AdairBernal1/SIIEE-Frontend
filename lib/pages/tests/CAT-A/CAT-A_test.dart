import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interfaz_siiee/pages/home.dart';

class CATAtest extends StatefulWidget {
  const CATAtest({Key? key}) : super(key: key);

  @override
  State<CATAtest> createState() => _CATAtestState();
}

class _CATAtestState extends State<CATAtest> {
  final double _toolbarHeight = 65;
  int _currentImageIndex = 0;
  String _userInput = '';
  final _controller = TextEditingController();
  late Timer _timer = Timer(Duration.zero, () {});
  int _start = 120;
  String? idEval;
  String? imageName;
  bool _isLoading = false;

  // List of image names. Replace these with your actual image names
  final List<String> _imageNames = [
    'CATA1.jpg',
    'CATA2.jpg',
    'CATA3.jpg',
    'CATA4.jpg',
    'CATA5.jpg',
    'CATA6.jpg',
    'CATA7.jpg',
    'CATA8.jpg',
    'CATA9.jpg',
    'CATA10.jpg',
  ];

  @override
  void initState() {
    super.initState();
    startEvaluation().then((_) {
      print('StartingEval:$idEval');
      imageName = _imageNames[_currentImageIndex].split('.')[0];
      print('StartingImageName:$imageName');
      startRecording(idEval!, imageName!);
      startTimer();
    });
  }

  void startTimer() {
    _start = 120;
    const oneSec = Duration(seconds: 1);
    _timer.cancel(); // Cancel the old timer
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            nextImage();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void nextImage() async {
    setState(() {
      _isLoading = true;
    });
    stopRecording().then((_) {
      Future.delayed(const Duration(seconds: 5));
      print('idEval: $idEval');
      if (idEval == null) {
        startEvaluation();
      }
      storeAnalysis(1, _userInput, idEval!, imageName!).then((_) {
        if (_currentImageIndex < _imageNames.length - 1) {
          _currentImageIndex++;
          imageName = _imageNames[_currentImageIndex].split('.')[0];
          startTimer();
          startRecording(idEval!, imageName!);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  Future<void> stopRecording() async {
    var url = 'http://localhost:5000/stop_recording';
    var response = await http.post(Uri.parse(url), body: {});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    await Future.delayed(const Duration(seconds: 2)); // Add delay here
  }

  Future<void> startRecording(String IDEval, String EstimuloName) async {
    var url = 'http://localhost:5000/start_recording';
    var headers = {"Content-Type": "application/json"};
    var body = jsonEncode({
      'filename': 'CAT-A_test_$EstimuloName$idEval.mp4',
      'IDEval': IDEval,
      "EstimuloName": EstimuloName,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    await Future.delayed(const Duration(seconds: 2)); // Add delay here
  }

  Future<void> startEvaluation() async {
    var url = 'http://localhost:5000/start_evaluation';
    var headers = {"Content-Type": "application/json"};
    var body = jsonEncode({'PruebaID': '1'});

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      idEval = jsonDecode(response.body)['IDEval'].toString();
    } else {
      throw Exception('Failed to start evaluation');
    }
    await Future.delayed(const Duration(seconds: 2)); // Add delay here
  }

  Future<void> storeAnalysis(int PruebaID, String RespuestaEstudiante,
      String IDEval, String EstimuloName) async {
    var url = 'http://localhost:5000/analyze_video';
    var headers = {"Content-Type": "application/json"};
    var body = jsonEncode({
      'IDEval': IDEval,
      'PruebaID': PruebaID.toString(),
      'EstimuloName': EstimuloName,
      'RespuestaEstudiante': RespuestaEstudiante,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Failed to store analysis');
    }
    await Future.delayed(const Duration(seconds: 2)); // Add delay here
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(232, 57, 137, 203),
        title: Center(
          child: SizedBox(
            height: _toolbarHeight,
            child: Image.asset(
              'assets/logos/logo-nobg.png',
            ),
          ),
        ),
        toolbarHeight: _toolbarHeight,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('$_start'),
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Center(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                            'assets/estimulos/${_imageNames[_currentImageIndex]}'),
                      ),
                    ),
                  ),
                ),
                TextField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      _userInput = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Describe what you see in the image',
                  ),
                  maxLines: 5,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _controller.clear();
                          nextImage();
                          _timer.cancel();
                        });
                      },
                      child: const Text('Siguiente'),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
