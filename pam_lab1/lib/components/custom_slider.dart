import 'package:flutter/material.dart';
import './custom_slider_thumb.dart';

class CustomSlider extends StatefulWidget {
  final int durationMonths;
  final Function(double) onChanged;

  const CustomSlider({
    Key? key,
    required this.durationMonths,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Color(0xFF246AFE),
            inactiveTrackColor: Color(0xFF246AFE).withOpacity(0.1),
            trackHeight: 8.0,
            thumbShape: CustomSliderThumbWithShadow(),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            thumbColor: Color(0xFF1427C5),
            overlayColor: Color(0xFFFFFFFF),
          ),
          child: Slider(
            min: 1,
            max: 60,
            divisions: 59,
            value: widget.durationMonths.toDouble(),
            onChanged: widget.onChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF667085),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "${widget.durationMonths.toInt()} luni",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF667085),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
