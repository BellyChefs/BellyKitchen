import 'package:belly_kitchen/providers/meal_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../../models/meal.dart';
import '../widgets/on_tap_opacity.dart';

class Details extends StatefulWidget {
  final Meal data;

  const Details({Key? key, required this.data}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () => Navigator.pop(context),
            splashRadius: 24.0),
        actions: [
          IconButton(
              icon: Icon(
                favMeals.contains(widget.data)
                    ? Icons.bookmark
                    : Icons.bookmark_outline_rounded,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                setState(() {
                  favMeals.contains(widget.data)
                      ? favMeals.remove(widget.data)
                      : favMeals.add(widget.data);
                });
              },
              splashRadius: 24.0),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 48.0, bottom: 20),
              child: Text(widget.data.title,
                  style: Theme.of(context).textTheme.headline1),
            ),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Container(
                    width: 240,
                    height: 200,
                    color: Colors.indigo,
                    child: Image.network(
                      'https://peasandcrayons.com/wp-content/uploads/2020/04/spicy-vegetarian-ramen-recipe-3.jpg',
                      width: 140,
                      filterQuality: FilterQuality.high,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 140,
                        height: 100,
                        color: Colors.blueAccent,
                        child: Image.network(
                          'https://steamykitchen.com/wp-content/uploads/2011/04/miso-ramen-recipe-feature-20912.jpg',
                          width: 140,
                          filterQuality: FilterQuality.high,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 140,
                        height: 96,
                        color: Colors.blueGrey,
                        child: Image.network(
                          'https://content.hy-vee.com/remote.axd/3f4c2184e060ce99111b-f8c0985c8cb63a71df5cb7fd729edcab.ssl.cf2.rackcdn.com/media/15684/ramenbowls.jpg?v=1&mode=crop&width=800&height=640&upscale=false',
                          width: 140,
                          filterQuality: FilterQuality.high,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                OnTapOpacityContainer(
                  curve: Curves.ease,
                  onTap: () async => _launchUrl(Uri.parse(widget.data.video)),
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Icon(
                          Icons.play_circle_outline_rounded,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'WATCH VIDEO',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Text(widget.data.time),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Text('Method',
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    const Spacer(),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Step 1',
                        style: Theme.of(context).textTheme.headline3,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(
                        'Mix 700ml chicken stock, 3 halved garlic cloves, 4 tbsp soy sauce, 1 tsp Worcestershire sauce, a sliced thumb-sized piece of ginger, ½ tsp Chinese five spice, pinch of chilli powder and 300ml water in a stockpot or large saucepan, bring to the boil, then reduce the heat and simmer for 5 mins.',
                        style: Theme.of(context).textTheme.headline5,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Step 2',
                        style: Theme.of(context).textTheme.headline3,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(
                        'Taste the stock – add 1 tsp white sugar or a little more soy sauce to make it sweeter or saltier to your liking',
                        style: Theme.of(context).textTheme.headline5,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Step 3',
                          style: Theme.of(context).textTheme.headline3,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(
                        'Cook 375g ramen noodles following the pack instructions, then drain and set aside.',
                        style: Theme.of(context).textTheme.headline5,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Step 4',
                        style: Theme.of(context).textTheme.headline3,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(
                        'Slice 400g cooked pork or chicken, fry in 2 tsp sesame oil until just starting to brown, then set aside.',
                        style: Theme.of(context).textTheme.headline5,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Step 5',
                        style: Theme.of(context).textTheme.headline3,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(
                        'Divide the noodles between four bowls. Top each with a quarter of the meat, 25g spinach, 1 tbsp sweetcorn and two boiled egg halves each.',
                        style: Theme.of(context).textTheme.headline5,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Step 6',
                        style: Theme.of(context).textTheme.headline3,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(
                        'Strain the stock into a clean pan, then bring to the boil once again.',
                        style: Theme.of(context).textTheme.headline5,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Step 7',
                        style: Theme.of(context).textTheme.headline3,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        'Divide the stock between the bowls, then sprinkle over 1 shredded nori sheet, sliced spring onions or shallots and a sprinkle of sesame seeds. Allow the spinach to wilt slightly before serving.',
                        style: Theme.of(context).textTheme.headline5,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
