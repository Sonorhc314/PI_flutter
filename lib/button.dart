import 'package:flutter/material.dart';

// General Button class that can perform a function when pressed
class Button extends StatelessWidget {
  // Button constructor
  const Button({
    super.key,
    required this.buttonText, 
    this.onPressed, 
  });

  // Text written on the button
  final String buttonText;  

  // Function to run when the button is pressed
  final Function(BuildContext)? onPressed;  

  @override
  // Builds Button widget
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70, width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 300, height: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () => onPressed!(context),
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}