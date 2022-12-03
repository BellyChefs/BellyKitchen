import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextEditingController controller;

  const InputText({
    required this.icon,
    required this.title,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 4,
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: Theme.of(context).canvasColor,
          ),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                children: [
                  Icon(this.icon, color: Theme.of(context).primaryColor),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: this.title,
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                      controller: controller,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
