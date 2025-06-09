import 'package:flutter/Material.dart';
import 'package:sizer/sizer.dart';

class CustomPriceSliderDemo extends StatefulWidget {
  final double maxValue;
  final double minValue;
  final double width;
  final Function(double  start,double end)onChange;



  const CustomPriceSliderDemo({required this.onChange,required this.width,required this.maxValue,required this.minValue,super.key});

  @override
  State<CustomPriceSliderDemo> createState() => _CustomPriceSliderDemoState();
}

class _CustomPriceSliderDemoState extends State<CustomPriceSliderDemo> {

  @override
  void initState() {
    sliderMin=widget.minValue;
    sliderMax=widget.maxValue;
    minValue=sliderMin;
    maxValue=sliderMax;
    _sliderWidth=widget.width;
    super.initState();
  }
  double minValue = 100;
  double maxValue = 500;
   double sliderMin = 0;
   double sliderMax = 1000;
  double thumbRadius = 12;
  double _sliderWidth=20.w;

  final GlobalKey _sliderKey = GlobalKey();

  double _valueToPosition(double value) {
    return (value - sliderMin) / (sliderMax - sliderMin) * _sliderWidth;
  }

  double _positionToValue(double dx) {
    return ((dx / _sliderWidth) * (sliderMax - sliderMin) + sliderMin)
        .clamp(sliderMin, sliderMax);
  }

  void _updateSliderWidth() {
    final RenderBox? renderBox =
    _sliderKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() {
        _sliderWidth = renderBox.size.width;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateSliderWidth());

    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: (_) {},
          child: SizedBox(
            height: 50,
            child: Stack(
              clipBehavior: Clip.none,
              key: _sliderKey,
              alignment: Alignment.centerLeft,
              children: [
                // Track
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                // Active range
                Positioned(
                  left: _valueToPosition(minValue),
                  right: _sliderWidth - _valueToPosition(maxValue),
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                // Left thumb
                Positioned(
                  left: _valueToPosition(minValue) - thumbRadius,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        minValue = _positionToValue(
                            _valueToPosition(minValue) +
                                details.delta.dx);
                        if (minValue > maxValue - 10) {
                          minValue = maxValue - 10;
                        }
                      });
                    },
                    child: _buildThumb('${minValue.round()}'),
                  ),
                ),
                // Right thumb
                Positioned(
                  left: _valueToPosition(maxValue) - thumbRadius,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        maxValue = _positionToValue(
                            _valueToPosition(maxValue) +
                                details.delta.dx);
                        if (maxValue < minValue + 10) {
                          maxValue = minValue + 10;
                        }
                        widget.onChange(minValue,maxValue);
                      });
                    },
                    child: _buildThumb('\$${maxValue.round()}'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildThumb(String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       // Text(label, style: const TextStyle(fontSize: 12)),
        Container(
          width: thumbRadius * 2,
          height: thumbRadius * 2,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}