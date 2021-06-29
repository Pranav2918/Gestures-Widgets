import 'package:flutter/material.dart';

class VolumeSlider extends StatefulWidget {
  @override
  _VolumeSliderState createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  int _value = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Set Volume',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0)),
          Text(
            _value.toString(),
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Row(children: [
              _value >= 50
                  ? Icon(Icons.volume_up, size: 40)
                  : Icon(Icons.volume_down, size: 40),
              SizedBox(width: 10),
              Expanded(
                  child: Slider(
                      min: 0.0,
                      max: 100.0,
                      activeColor: Colors.pink,
                      inactiveColor: Colors.grey,
                      value: _value.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          _value = newValue.round();
                        });
                      }))
            ])),
          ),
        ],
      ),
    );
  }
}
