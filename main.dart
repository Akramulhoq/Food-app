import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodDetails(),
    );
  }
}


class FoodDetails extends StatefulWidget {
  @override
  FoodDetailsState createState() => FoodDetailsState();
}
class FoodDetailsState extends State<FoodDetails>{
  double spicyValue = 0.5;
  int portion = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff), // Screen background
      body: SafeArea(
        child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                      Icons.arrow_back,
                  size: 28,
                  color: Colors.black,
                  ),
                  Icon(
                    Icons.search,
                    size: 28,
                    color: Colors.black,
                  ),
                ],
              ),

              SizedBox(height: 30),

              Center(
                child: Image.asset(
                  "assets/burger_pic.jpg",
                  height: 355.13,
                ),
              ),

              SizedBox(height: 20),

              Text(
                "Cheeseburger Wendy's Burger",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(color: Colors.black.withOpacity(0.3),
                    offset: Offset(2, 3),
                    blurRadius: 4,
                    ),
                  ]
                ),
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20,
                  ),
                 //
                  SizedBox(width: 5),

                  Text(
                    "4.9",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(width: 10),

                  Text(
                    "- 26 mins",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              // Description Tex
              SizedBox(height: 15),

              Text(
                "The Cheeseburger Wend's Burger is a classic fast food burger that packs a punch of flavor in every bit.Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
                style: TextStyle(
                  fontSize: 13,
                  height: 1.5,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 20),

              /// Spicy + Portion Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /// Spicy Slider
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Spicy",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),


                      /// Slider
                      SizedBox(
                        width: 160,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: CustomSliderThumb(width: 14, height: 18),
                          ),
                          child: Slider(
                            padding: EdgeInsets.zero,
                            value: spicyValue,
                            min: 0,
                            max: 1,
                            activeColor: Colors.red,
                            inactiveColor: Colors.grey.shade300,
                            onChanged: (value){
                              setState(() {
                                spicyValue = value;
                              });
                            },
                          ),
                        ),
                      ),


                      // Mild ---- Hot
                      SizedBox(
                          width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Mild",
                            style: TextStyle(
                              color: Color(0xff1CC019),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "Hot",
                            style: TextStyle(
                                color: Color(0xffff2A39),
                            fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      ),
                    ],
                  ),

                  /// Portion
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Portion",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [

                          /// Minus
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(color: Colors.yellow.withOpacity(0.5),
                                  blurRadius: 7,
                                  offset: Offset(0, 2),)]
                            ),
                            child: IconButton(
                              icon: Icon(Icons.remove, color: Colors.white),
                              onPressed: (){
                                setState(() {
                                  if(portion>1) portion--;
                                });
                              },
                            ),
                          ),

                          SizedBox(width: 10),

                          Text(
                            portion.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(width: 10),

                          /// Plus
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(color: Colors.yellow.withOpacity(0.5),
                                    blurRadius: 7,
                                    offset: Offset(0, 2),)]
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add, color: Colors.white),
                              onPressed: (){
                                setState(() {
                                  portion++;
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(height: 30),

              /// Bottom Buttons
              Row(
                children: [

                  /// Price Button
                  Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(1),
                            blurRadius: 7,
                            offset: Offset(4, 4),)]
                    ),
                    child: Center(
                      child: Text(
                        "\$8.24",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 20),

                  /// Order Now
                  Expanded(child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xff3E2723),
                      borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(1),
                            blurRadius: 7,
                            offset: Offset(4, 4),)]
                    ),
                    child: Center(
                      child: Text(
                        "ORDER NOW",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  )

                ],
              )

            ],
          ),
        ),
      ),
      ),
    );
  }
}



class CustomSliderThumb extends SliderComponentShape {
  final double width;
  final double height;

  CustomSliderThumb({this.width = 10, this.height = 14});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(width, height);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {

    final Canvas canvas = context.canvas;

    final Paint fillPaint = Paint()
      ..color = Colors.red; 

    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Rect rect = Rect.fromCenter(
      center: center,
      width: width,
      height: height,
    );

    RRect rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(4), 
    );

    canvas.drawRRect(rRect, fillPaint);   
    canvas.drawRRect(rRect, borderPaint); 
  }
}


