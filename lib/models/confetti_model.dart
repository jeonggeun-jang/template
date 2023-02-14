import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiModel extends ChangeNotifier {
  final ConfettiController confettiController = ConfettiController();

  bool isPlaying = false;
}
