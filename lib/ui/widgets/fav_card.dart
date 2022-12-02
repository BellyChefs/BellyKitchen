import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/meal.dart';

class FavCard extends StatefulWidget {
  final Meal meal;

  const FavCard({super.key, required this.meal});

  @override
  FavCardState createState() => FavCardState();
}

class FavCardState extends State<FavCard> {
  var height = 93.0;
  var padding = const EdgeInsets.only(top: 14);
  var border = const Border(
      bottom: BorderSide(
    width: 1.0,
    color: Color(0xFFE5E5E5),
  ));

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (DismissDirection direction) {},
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            border: border,
          ),
          child: Material(
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {},
              child: SizedBox(
                height: height,
                child: Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.network(
                        widget.meal.image,
                        width: 96,
                        height: 96,
                      ),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: RichText(
                              text: TextSpan(
                            text: widget.meal.title,
                            style: Theme.of(context).textTheme.headline4,
                            children: <TextSpan>[
                              TextSpan(
                                text: '${widget.meal.calories}cal',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          )),
                        )),
                    const Spacer(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 26),
                          child: CupertinoButton(
                            onPressed: () {},
                            padding: const EdgeInsets.all(0),
                            borderRadius: BorderRadius.circular(0.0),
                            minSize: 20,
                            child: const Icon(
                              Icons.clear,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
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
