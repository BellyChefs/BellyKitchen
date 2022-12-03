import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String? title;

  const MenuButton({this.icon, this.title, this.onPressed, Key? key})
      : super(key: key);

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
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              splashColor: Colors.transparent,
              onTap: () => onPressed?.call(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Row(
                  children: [
                    if (this.icon != null)
                      Icon(this.icon,
                          color: Theme.of(context).primaryColorDark),
                    const SizedBox(width: 16),
                    if (this.title != null)
                      Text(
                        this.title!,
                        style: Theme.of(context).textTheme.headline6,
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
