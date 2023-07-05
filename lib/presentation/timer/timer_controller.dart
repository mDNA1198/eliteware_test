import 'dart:async';

import 'package:eliteware_test/presentation/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

class TimerController extends BaseController {
  final Logger _logger = Logger('TimerController');

  @override
  void onInit() {
    _logger.fine('onInit');
    super.onInit();
  }

  RxString timerTime = '00:00'.obs;
  Timer? _timer;
  final RxInt _counter = (0 * 60).obs;

  void startStopWatch() {
    if (_timer != null) return;
    _logger.fine('startStopWatch');
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _counter.call(++_counter.value);
      timerTime.call(getFormatDuration(Duration(seconds: _counter.value)));
    });
  }

  void resetStopWatch() {
    if (_timer == null) return;
    _logger.fine('resetStopWatch');
    if (_timer != null) {
      _timer?.cancel();
      timerTime.call('00:00');
      _counter.call(0);
      _timer = null;
    }
  }

  String getFormatDuration(Duration duration) {
    var twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    var twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    }
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  String twoDigits(int n) => n.toString().padLeft(2, "0");

  final TextEditingController inputControllerForMinutes =
      TextEditingController(text: '0');
  final TextEditingController inputControllerForSeconds =
      TextEditingController(text: '0');

  RxString countDownTimerTime = '00:00'.obs;

  Timer? _countDownTimer;
  final RxInt _countDownCounter = 0.obs;

  void startCountDownTimer(void Function() onTimerEnd) {
    if (isCountDownInputValid()) {
      if (_countDownTimer != null) return;
      _logger.fine('startCountDownTimer');
      convertInputToSeconds();
      _countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _countDownCounter.call(--_countDownCounter.value);
        if (_countDownCounter.value.isNegative) {
          resetCountDownTimer();
          onTimerEnd.call();
          return;
        }
        countDownTimerTime.call(
            getFormatDuration(Duration(seconds: _countDownCounter.value)));
      });
    } else {
      showToast('Please enter proper values for minutes and seconds');
    }
  }

  void convertInputToSeconds() {
    final seconds = Duration(
            minutes: int.parse(inputControllerForMinutes.text),
            seconds: int.parse(inputControllerForSeconds.text))
        .inSeconds;
    inputControllerForMinutes.text = '0';
    inputControllerForSeconds.text = '0';
    _countDownCounter.call(seconds);
  }

  void resetCountDownTimer() {
    if (_countDownTimer == null) return;
    _logger.fine('resetCountDownTimer');
    if (_countDownTimer != null) {
      _countDownTimer?.cancel();
      countDownTimerTime.call('00:00');
      _countDownCounter.call(0);
      _countDownTimer = null;
    }
  }

  bool isCountDownInputValid() {
    return inputControllerForMinutes.text.isNotEmpty &&
        inputControllerForMinutes.text.isNumericOnly &&
        inputControllerForSeconds.text.isNotEmpty &&
        inputControllerForSeconds.text.isNumericOnly &&
        int.parse(inputControllerForSeconds.text) > 0;
  }

  @override
  void onClose() {
    _logger.fine('onClose');
    _timer?.cancel();
    _countDownTimer?.cancel();
    super.onClose();
  }
}
