import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Counter({super.key, required this.increment, required this.decrement, required this.counter, required this.size});

  final Function increment;
  final Function decrement;
  final int counter;
  final double size;
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  void incrementar() {
    setState(() {
      widget.increment();
    });
  }

  void decrementar() {
    setState(() {
      widget.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only( right: widget.size * 0.16),
          child: GestureDetector(
            onTap: () {
              decrementar();
            },
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: const BoxDecoration(
                  color: Colors.white38, shape: BoxShape.circle),
              child: Icon(CupertinoIcons.minus, size: widget.size/2,),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only( right: widget.size * 0.16),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: const BoxDecoration(
                color: Colors.white38, shape: BoxShape.circle),
            child: Center(
                child: Text(
              widget.counter.toString(),
              style: TextStyle(fontSize: widget.size * 0.44),
            )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only( right: widget.size * 0.16),
          child: GestureDetector(
            onTap: () {
              incrementar();
            },
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration:  const BoxDecoration(
                  color: Colors.white38, shape: BoxShape.circle),
              child: Icon(Icons.add, size: widget.size/2,),
            ),
          ),
        ),
      ],
    );
  }
}
