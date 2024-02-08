import 'package:flutter/material.dart';

import 'package:market_check/features/offers/data/models/offer_model.dart';
import 'package:market_check/features/offers/presentation/providers/offers_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class OffersHorizontalListView extends StatefulWidget {
  final List<OfferModel> offers;
  final String? title;
  final String? subtitle;

  const OffersHorizontalListView({
    super.key,
    required this.offers,
    required this.title,
    required this.subtitle,
  });

  @override
  State<OffersHorizontalListView> createState() =>
      _OffersHorizontalListViewState();
}

class _OffersHorizontalListViewState extends State<OffersHorizontalListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {}
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280, //320
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null)
            _Title(title: widget.title, subTitle: widget.subtitle),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.offers.length,
              itemBuilder: (BuildContext context, index) {
                return FadeInRight(child: _Slice(offer: widget.offers[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slice extends StatelessWidget {
  final OfferModel offer;
  const _Slice({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${offer.id}',
      child: GestureDetector(
        onTap: () {
          context.read<OfferssProvider>().currentOffer = offer;
          context.push('/offer-view');
        },
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 170, //190
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      offer.imagePath,
                      fit: BoxFit.cover,
                      width: 115, //135 orginal size
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                    width: 120, //140
                    child: Column(
                      children: [
                        Text(offer.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            maxLines: 1),
                        /* Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.attach_money_outlined,
                                size: 18, color: Colors.yellow.shade800),
                            Text('${offer.price}   ',
                                style: textStyle.bodyMedium, maxLines: 1)
                          ],
                        ),*/
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.only(top: 10),
      child: Row(children: [
        if (title != null) Text(title!, style: titleStyle.titleMedium),
        const Spacer(),
        if (subTitle != null)
          FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {
                context.push("/offers");
              },
              child: Text(subTitle!)),
      ]),
    );
  }
}
