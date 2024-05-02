import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  bool _isRunning = false;
  int _milliseconds = 0;
  late Stopwatch _stopwatch;
  late Timer _timer;
  List<String> _laps = [];

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(Duration(milliseconds: 100), _updateMilliseconds);
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer.cancel();
    super.dispose();
  }

  void _startStopwatch() {
    setState(() {
      _isRunning = true;
      _stopwatch.start();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _isRunning = false;
      _stopwatch.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _isRunning = false;
      _stopwatch.reset();
      _milliseconds = 0;
      _laps.clear();
    });
  }

  void _updateMilliseconds(Timer timer) {
    if (_isRunning) {
      setState(() {
        _milliseconds = _stopwatch.elapsedMilliseconds;
      });
    }
  }

  void _recordLap() {
    setState(() {
      _laps.add(_formatMilliseconds(_milliseconds));
    });
  }

  String _formatMilliseconds(int milliseconds) {
    int seconds = (milliseconds ~/ 1000) % 60;
    int minutes = (milliseconds ~/ (1000 * 60)) % 60;
    int hours = (milliseconds ~/ (1000 * 60 * 60)) % 24;
    int msecs = (milliseconds % 1000);

    String secondsStr = seconds.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String hoursStr = hours.toString().padLeft(2, '0');
    String msecsStr = msecs.toString().padLeft(3, '0');

    return '$hoursStr:$minutesStr:$secondsStr.$msecsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Waktu: ${_formatMilliseconds(_milliseconds)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? _stopStopwatch : _startStopwatch,
                  child: Text(_isRunning ? 'Stop' : 'Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  child: Text('Reset'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _isRunning ? _recordLap : null,
                  child: Text('Lap'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    _laps.length,
                        (index) => ListTile(
                      title: Text('Lap ${index + 1}: ${_laps[index]}'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
