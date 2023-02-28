import 'dart:convert';

import 'package:flutter/foundation.dart';

class CuacaWilayah {
  final String jamCuaca, kodeCuaca, cuaca, humidity, tempF, tempC;

  CuacaWilayah({
    required this.jamCuaca,
    required this.kodeCuaca,
    required this.cuaca,
    required this.humidity,
    required this.tempC,
    required this.tempF,
  });

  factory CuacaWilayah.fromJson(Map<String, dynamic> json) {
    return CuacaWilayah(
        jamCuaca: json['jamCuaca'],
        kodeCuaca: json['kodeCuaca'],
        cuaca: json['cuaca'],
        humidity: json['humidity'],
        tempC: json['tempC'],
        tempF: json['tempF']);
  }
}
