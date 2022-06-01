import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/feature/ui/colors.dart';
import 'package:test_task/feature/utils/price_formatter.dart';

class HouseCard extends StatelessWidget {
  const HouseCard(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.routeToHouseCard,
      required this.location,
      required this.rating,
      required this.reviewCount})
      : super(key: key);
  final int? id;
  final String? name;
  final int? rating;
  final String? location;
  final List<String?>? image;
  final int? reviewCount;
  final double? price;
  final VoidCallback routeToHouseCard;

  @override
  Widget build(BuildContext context) {
    ratings() {
      return SizedBox(
        height: 25,
        width: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 12,
                    width: 12,
                    child: Icon(
                      Icons.star,
                      color: rating! >= index ? UIColors.blue : UIColors.grey,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 7);
                },
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '($reviewCount отзывов)',
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      );
    }

    itemPriceAndRatingsRow() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ratings(),
            RichText(
              text: TextSpan(
                text: '${PriceFormatter(price: price).formatPrice()} ₽',
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: UIColors.black,
                    fontSize: 19),
                children: const <TextSpan>[
                  TextSpan(
                    text: '/сут.',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    imageBloc() {
      return ClipRRect(
        child: image!.isNotEmpty
            ? Image.network(
                '${image!.first}',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.375,
                width: MediaQuery.of(context).size.width * 1,
              )
            : Container(
                height: MediaQuery.of(context).size.height * 0.36,
                color: UIColors.grey,
              ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      );
    }

    itemTitle() {
      return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(16),
        child: RichText(
          text: TextSpan(
            text: '$name',
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: UIColors.black,
                fontSize: 19),
            children: <TextSpan>[
              TextSpan(
                text: ' $location',
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: UIColors.locationTitleColor,
                    fontSize: 19,
                    overflow: TextOverflow.ellipsis),
              )
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () => routeToHouseCard(),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: UIColors.shadowsColor.withOpacity(0.15),
                        offset: const Offset(0, 4),
                        blurRadius: 16,
                        spreadRadius: 0)
                  ],
                  borderRadius: BorderRadius.circular(16),
                  color: UIColors.white,
                ),
                child: Column(children: [
                  imageBloc(),
                  itemTitle(),
                  itemPriceAndRatingsRow(),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
