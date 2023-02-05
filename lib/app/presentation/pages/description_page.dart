import 'package:car_details_app/app/domain/models/entities/car_entity.dart';
import 'package:car_details_app/app/presentation/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionPage extends StatelessWidget {
  final CarEntity car;
  DescriptionPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(context),
        backgroundColor: Colors.black,
      ),
    );
  }

  _body(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          _title(),
          _modelAndTire(context),
          _typeThing(),
          _description(),
        ]),
      ),
    );
  }

  _title() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 140,
      decoration: BoxDecoration(
        color: car.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Text(
              car.brand,
              style: brandStyle,
            ),
          ),
          SizedBox(
            width: double.maxFinite,
          ),
          Expanded(
            child: Text(
              car.name,
              style: nameStyle,
            ),
          ),
        ],
      ),
    );
  }

  _modelAndTire(context) {
    return Container(
      height: 135,
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          _backButton(context),
          SizedBox(width: 6),
          Expanded(
            flex: 120,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffD88482),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Size of tire',
                    style: titleStyle,
                  ),
                  Text(car.tireSize, style: descStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _typeThing() {
    return Container(
      height: 250,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Constants.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Weight',
                style: titleStyle,
              ),
              Text(
                car.weight,
                style: descStyle,
              ),
            ],
          ),
          Divider(thickness: 2, color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Horse Power',
                    style: titleStyle,
                  ),
                  Text(car.horsePower, style: descStyle)
                ],
              ),
              Container(
                color: Colors.black,
                height: 120,
                width: 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TopSpeed',
                    style: titleStyle,
                  ),
                  Text(car.topSpeed, style: descStyle)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        padding: EdgeInsets.all(25),
        // height: 500,
        decoration: BoxDecoration(
          color: Color(0xff9A9790),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          car.description,
          textAlign: TextAlign.justify,
          style: GoogleFonts.lora(fontSize: 25),
        ),
      ),
    );
  }

  Expanded _backButton(context) {
    return Expanded(
      flex: 70,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff96A969),
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Center(
              child: Icon(
            Icons.arrow_back,
            size: 40,
          )),
        ),
      ),
    );
  }

  TextStyle nameStyle = GoogleFonts.zenDots(fontSize: 40);
  TextStyle descStyle = GoogleFonts.zenDots(fontSize: 30);
  TextStyle titleStyle =
      GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.w600);
  TextStyle brandStyle = GoogleFonts.zenDots(
    fontSize: 40,
    foreground: Paint()
      ..color = Colors.grey[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5,
    fontWeight: FontWeight.bold,
  );
}
