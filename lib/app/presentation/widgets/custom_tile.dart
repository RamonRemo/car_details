import 'package:car_details_app/app/domain/models/entities/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTile extends StatelessWidget {
  final CarEntity car;

  CustomTile({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: car.color,
        borderRadius: BorderRadius.circular(4),
      ),
      width: MediaQuery.of(context).size.width * 0.425,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        topSide(),
        bottomSide(),
      ]),
    );
  }

  topSide() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(car.year, style: yearStyle),
          const Divider(color: Color(0xff3A2700), thickness: 2),
        ],
      ),
    );
  }

  bottomSide() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(car.brand, style: brandStyle),
          Text(car.name, style: nameStyle),
          const SizedBox(width: double.infinity, height: 50)
        ],
      ),
    );
  }

  // TextStyle yearStyle = GoogleFonts.bebasNeue(fontSize: 60);
  // TextStyle yearStyle = GoogleFonts.metrophobic(fontSize: 45);
  // TextStyle yearStyle = GoogleFonts.marmelad(fontSize: 45);
  // TextStyle yearStyle = GoogleFonts.farro(fontSize: 45);
  // TextStyle yearStyle = GoogleFonts.sairaStencilOne(fontSize: 40);
  // TextStyle yearStyle = GoogleFonts.iceland(fontSize: 50);
  TextStyle yearStyle = GoogleFonts.goblinOne(fontSize: 30);

  TextStyle nameStyle = GoogleFonts.zenDots(fontSize: 19);
  TextStyle brandStyle = GoogleFonts.zenDots(
    fontSize: 19,
    foreground: Paint()
      ..color = Colors.grey[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5,
    fontWeight: FontWeight.bold,
  );
}
