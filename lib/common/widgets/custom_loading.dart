import 'package:flutter/material.dart';

class CustomLoading extends StatefulWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading> with TickerProviderStateMixin{
  late final AnimationController motionController;

  double size = 20;

  void initState() {

    super.initState();



    motionController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.5,
      animationBehavior: AnimationBehavior.preserve
    );
    motionController.forward();
    motionController.addListener(() {
      setState(() {
        size = (motionController.value * 22)+22;
      });

    });
  }
    @override
    void dispose() {
      motionController.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 45,
          height: 45,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    fit:BoxFit.cover,
                    image: AssetImage(
                      'assets/images/app_icon.png',))
            ),
          ),
        ),
        SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(color: Colors.black,))
      ],
    );
  }


}
