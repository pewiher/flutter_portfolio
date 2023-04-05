import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickCounter',
                style: const TextStyle(
                  fontSize: 160,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Text(
                'Clik${clickCounter == 1 ? '' : 's'}',
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            func: () {
              clickCounter = 0;
              setState(() {});
            },
            iconData: Icons.refresh,
          ),
          const SizedBox(height: 10),
          CustomButton(
            func: () {
              clickCounter += 1;
              setState(() {});
            },
            iconData: Icons.plus_one,
          ),
          const SizedBox(height: 10),
          CustomButton(
            func: () {
              if (clickCounter == 0) return;
              clickCounter -= 1;
              setState(() {});
            },
            iconData: Icons.exposure_minus_1,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.iconData,
    required this.func,
  });
  final IconData iconData;
  final VoidCallback? func;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: func,
      elevation: 5,
      enableFeedback: true,
      child: Icon(iconData),
    );
  }
}
