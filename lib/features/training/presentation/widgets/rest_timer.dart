import 'dart:async';
import 'package:flutter/material.dart';

class AutoRestTimer extends StatefulWidget {
  final int durationSeconds;
  final VoidCallback onTimerFinished;

  const AutoRestTimer({
    super.key,
    required this.durationSeconds,
    required this.onTimerFinished,
  });

  @override
  State<AutoRestTimer> createState() => _AutoRestTimerState();
}

class _AutoRestTimerState extends State<AutoRestTimer> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.durationSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
        widget.onTimerFinished();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _timerString {
    final minutes = (_remainingSeconds / 60).floor();
    final seconds = _remainingSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.timer, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            'Rest: $_timerString',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              // Add 30s
              setState(() {
                _remainingSeconds += 30;
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('+30s', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
          ),
          InkWell(
            onTap: () {
              // Skip
              _timer?.cancel();
              widget.onTimerFinished();
            },
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.skip_next, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper to show the overlay
void showRestTimer(BuildContext context, int seconds) {
  OverlayEntry? entry;
  
  entry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 100,
      left: 0,
      right: 0,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: AutoRestTimer(
            durationSeconds: seconds,
            onTimerFinished: () {
              entry?.remove();
            },
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(entry);
}
