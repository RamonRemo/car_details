import 'package:car_details_app/app/domain/models/entities/car_entity.dart';
import 'package:flutter/material.dart';

class Constants {
  static CarEntity car1 = CarEntity(
    const Color(0xffB1AEA7),
    '1960s',
    'CHEVROLET',
    'CORVETTE',
    'assets/corvete.jpg',
    '1,283 kg',
    '6.70 x 15',
    '140mph',
    '360hp',
    'The 1960 Chevrolet Corvette was a sports car produced by Chevrolet, the 2nd generation of the Chevrolet Corvette. It was available in several body styles including a convertible, hardtop and a unique, fastback-styled removable hardtop. It was powered by a range of engines including a 283 cubic inch V8 engine that produced 230-315 horsepower depending on the configuration. The car had a distinctive design, with dual headlights and a long hood, and was known for its handling and performance, making it a popular choice among sports car enthusiasts.'
        .replaceAll('.', '.\n\n'),
    GlobalKey(),
  );

  static CarEntity car2 = CarEntity(
    const Color(0xffCB962E),
    '1970s',
    'PORSHE',
    '917K',
    'assets/917k.jpeg',
    '1,100 kg',
    '16 x 13',
    '240mph',
    '720hp',
    "The Porsche 917 is a race car that was developed by Porsche in the late 1960s and early 1970s. The Porsche 917K (K stands for Kurzheck, which means short tail in German) was introduced in 1970 and was used in the Le Mans 24 hour endurance race and other major sports car racing events. The 917K was powered by a flat-12 engine that produced up to around 600 horsepower and could reach top speeds of over 220 mph. The car's aerodynamic design and lightweight construction made it incredibly fast and agile, and it quickly established itself as one of the most dominant race cars of its time. The Porsche 917K is now considered one of the most iconic race cars in history, and it has been featured in numerous movies, including the Steve McQueen film 'Le Mans'. Today, original Porsche 917Ks are highly sought after by collectors and are considered valuable investments."
        .replaceAll('.', '.\n\n'),
    GlobalKey(),
  );

  static CarEntity car3 = CarEntity(
    const Color(0xffD88482),
    '1960s',
    'CHEVROLET',
    'CAMARU',
    'assets/camaru.jpg',
    '1,247 kg',
    '6.50 x 14',
    '140mph',
    '375gp',
    'The Camaro is a sports car manufactured by Chevrolet, a division of General Motors. It was first introduced in 1966 as a 1967 model and has been in production ever since, with six generations of the car having been produced so far. The Camaro is available in a range of trim levels, from a basic sport coupe to high-performance models like the Camaro ZL1. Over the years, the Camaro has been offered with a variety of engines, including V6 and V8 engines, and has been available with both manual and automatic transmissions. The Camaro is known for its distinctive design, with a long hood and aggressive styling, as well as its handling and performance capabilities. It has been a popular choice among muscle car enthusiasts and has a strong following among car enthusiasts. In recent years, Chevrolet has made significant updates to the Camaro, including new engines, updated styling, and new technology features, making it a modern, high-performance sports car that continues to be a popular choice among drivers today.'
        .replaceAll('.', '.\n\n'),
    GlobalKey(),
  );

  static Color red = const Color(0xffAC2F35);

  static List<CarEntity> list = [car1, car2, car3];
}
