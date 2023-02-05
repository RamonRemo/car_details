import 'package:flutter/material.dart';

class CarEntity {
  final Color color;
  final String year;
  final String brand;
  final String name;
  final String image;
  final String weight;
  final String tireSize;
  final String topSpeed;
  final String horsePower;
  final String description;
  final GlobalKey key;

  CarEntity(
    this.color,
    this.year,
    this.brand,
    this.name,
    this.image,
    this.weight,
    this.tireSize,
    this.topSpeed,
    this.horsePower,
    this.description,
    this.key,
  );
}
