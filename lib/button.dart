import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Function()? onPressed;
  final Widget child;
  final String Title;
  final String Content;

  Button({
    Key? key,
    this.onPressed,
    required this.child,
    required this.Title,
    required this.Content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            ConstrainedBox(
              constraints:
              const BoxConstraints.tightFor(width: 300, height: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: onPressed ??
                        () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(Title),
                      content: Text(Content),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  );
                },
                child: child,
              ),
            ),
        ],
      ),
    );
  }
}