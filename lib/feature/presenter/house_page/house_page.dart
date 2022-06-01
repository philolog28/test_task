import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/feature/utils/price_formatter.dart';

import '../../ui/colors.dart';

class HousePage extends StatefulWidget {
  const HousePage({
    Key? key,
    required this.name,
    required this.location,
    required this.images,
    required this.description,
    required this.price,
  }) : super(key: key);
  final String? name;
  final String? location;
  final List<String?> images;
  final String? description;
  final double? price;

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  @override
  Widget build(BuildContext context) {
    itemTitle() {
      return Container(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${widget.name}',
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: UIColors.black,
                  fontSize: 19),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '${widget.location}',
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: UIColors.locationTitleColor,
                  fontSize: 19,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: UIColors.scaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: itemTitle(),
        backgroundColor: UIColors.scaffoldColor,
        toolbarHeight: 52,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16),
                height: MediaQuery.of(context).size.height * 0.365,
                width: MediaQuery.of(context).size.width * 1,
                child: CarouselSlider.builder(
                  itemCount: widget.images.length,
                  itemBuilder: (context, index, realIndex) {
                    return Image.network(
                      '${widget.images[index]}',
                      fit: BoxFit.cover,
                    );
                  },
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: MediaQuery.of(context).size.height * 0.365,
                    viewportFraction: 1,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '${widget.description}',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: UIColors.white,
              boxShadow: [
                BoxShadow(
                    color: UIColors.shadowsColor.withOpacity(0.15),
                    offset: const Offset(0, -9),
                    blurRadius: 16,
                    spreadRadius: 0)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '${PriceFormatter(price: widget.price).formatPrice()} ₽',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: UIColors.black,
                          fontSize: 19),
                      children: const <TextSpan>[
                        TextSpan(
                          text: '/сут.',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 237,
                    height: 50,
                    child: CupertinoButton(
                      color: UIColors.purple,
                      padding: const EdgeInsets.all(15),
                      borderRadius: const BorderRadius.all( Radius.circular(47)),
                        child: const Text('Назад'),
                        onPressed: ()=> Navigator.of(context).pop()),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
