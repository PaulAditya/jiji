import 'package:flutter/material.dart';
import 'package:jiji/pages/product_details.dart';
import 'package:jiji/utilities/size_config.dart';

import '../../ThemeData.dart';

class SimilarProductCard extends StatelessWidget {
  final String productImgUrl;
  final String productName;
  final bool isFav;
  final double prices;
  final String place;

  const SimilarProductCard({
    Key key,
    @required this.productImgUrl,
    @required this.productName,
    @required this.isFav,
    @required this.prices,
    @required this.place,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: Container(
                  height: constraints.maxHeight * 0.6,
                  width: double.infinity,
                  child: Image.network(
                    productImgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Container(
                  // height: constraints.maxHeight * 0.5,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(productName,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: SizeConfig.deviceWidth * 2.5,
                              ),
                              overflow: TextOverflow.fade),
                          Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: MyThemeData.primaryColor,
                            size: 12,
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹ " + prices.toString(),
                            style: TextStyle(
                              fontSize: SizeConfig.deviceWidth * 2.5,
                              color: MyThemeData.primaryColor,
                            ),
                          ),
                          Text(
                            place,
                            style: TextStyle(
                              fontSize: SizeConfig.deviceWidth * 2,
                              color: MyThemeData.inputPlaceHolder,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}