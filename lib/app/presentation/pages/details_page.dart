// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_details_app/app/presentation/constants.dart';
import 'package:car_details_app/app/presentation/pages/description_page.dart';
import 'package:flutter/material.dart';

import 'package:car_details_app/app/domain/models/entities/car_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  final CarEntity car;

  DetailsPage({
    Key? key,
    required this.car,
  }) : super(key: key);

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
    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _header(context),
            _image(),
            _bottom(context),
          ],
        ));
  }

  _header(context) {
    return Expanded(
      flex: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, _createRoute());
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: car.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    car.year,
                    style: yearStyle,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 35,
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
                color: Colors.black,
              ),
              Expanded(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      car.brand,
                      style: brandStyle,
                    ),
                    Text(
                      car.name,
                      style: nameStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _image() {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset(car.image, fit: BoxFit.fill),
        ),
      ),
    );
  }

  _bottom(context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: [
          _backButton(context),
          const SizedBox(width: 5),
          _artistContainer()
        ],
      ),
    );
  }

  Expanded _artistContainer() {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xffCB962E),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Details & Story by ',
                  style: GoogleFonts.goblinOne(fontSize: 10),
                ),
                Text(
                  'Chad Gepte',
                  style: GoogleFonts.nothingYouCouldDo(fontSize: 22),
                ),
              ],
            ),
            const Opacity(
              opacity: 0.7,
              child: CircleAvatar(
                maxRadius: 35,
                backgroundImage: AssetImage('assets/cage.jpg'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _backButton(context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Constants.red,
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

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          DescriptionPage(car: car),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  TextStyle yearStyle = GoogleFonts.goblinOne(fontSize: 60);
  TextStyle nameStyle = GoogleFonts.zenDots(fontSize: 40);
  TextStyle brandStyle = GoogleFonts.zenDots(
    fontSize: 40,
    foreground: Paint()
      ..color = Colors.grey[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5,
    fontWeight: FontWeight.bold,
  );
}



// marca / modelo / ano / cavalaria / força de torque / 