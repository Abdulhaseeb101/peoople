import 'package:flutter/material.dart';
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/helper/sizeConfig.dart';
import 'package:newflut_app/screens/selectedShop.dart';
import 'package:numberpicker/numberpicker.dart';

class ListedProduct extends StatefulWidget {
  ListedProduct(
      {Key key,
      this.context,
      this.productNameIndex,
      this.snapshot,
      this.categoryNames,
      this.categoryNameIndex})
      : super(key: key);

  final BuildContext context;
  final AsyncSnapshot snapshot;
  final List<String> categoryNames;
  int categoryNameIndex;
  int productNameIndex;
  int _currentValue = 0;
  int _prevValue = 0;

  @override
  _ListedProductState createState() => _ListedProductState();
}

class _ListedProductState extends State<ListedProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Placeholder(
            fallbackWidth: 70.0,
            fallbackHeight: 70.0,
          ),
          SizedBox(
            width: 5.0,
          ),
          Container(
            width: getProportionateWidth(context, 0.4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.snapshot
                          .data[widget.categoryNames[widget.categoryNameIndex]]
                      [widget.productNameIndex]['label'], // name of the product
                  style: TextStyle(
                    color: STextColor,
                    fontSize: 23,
                  ),
                ),
                Text(
                  widget.snapshot.data[
                              widget.categoryNames[widget.categoryNameIndex]]
                          [widget.productNameIndex]
                      ['price'], // price of the product
                  style: TextStyle(
                    color: STextColor,
                    fontSize: 20,
                  ),
                ),
                Container(
                  child: Text(
                    widget.snapshot.data[
                                widget.categoryNames[widget.categoryNameIndex]]
                            [widget.productNameIndex]
                        ['decrp'], // price of the product
                    style: TextStyle(
                      color: STextColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 50.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: NumberPicker(
              value: widget._currentValue,
              axis: Axis.horizontal,
              itemWidth: 25,
              minValue: 0,
              maxValue: 100,
              onChanged: (value) {
                widget._currentValue = value;

                setState(() {
                  SelectedShop().totalAmount.value -= widget._prevValue;
                  SelectedShop().totalAmount.value += widget._currentValue;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
