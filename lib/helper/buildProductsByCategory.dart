import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/models/listedProduct.dart';


class BuildProductByCategory extends StatefulWidget {
  const BuildProductByCategory({
    Key key,
    this.snapshot,
    this.context,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  final BuildContext context;

  @override
  _BuildProductByCategoryState createState() => _BuildProductByCategoryState();
}

class _BuildProductByCategoryState extends State<BuildProductByCategory> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.snapshot.data.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, categoryNameIndex) {
        List<String> categoryNames = [];

        for (var catNames in widget.snapshot.data.keys) {
          categoryNames.add(catNames);
        }
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                categoryNames[categoryNameIndex],
                style: TextStyle(
                  color: PTextColor,
                  fontSize: 27,
                ),
              ),
            ),
            ListView.builder(
              itemCount: widget.snapshot.data[categoryNames[categoryNameIndex]].length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, productNameIndex) {
                return ListedProduct(context: context, productNameIndex: productNameIndex, snapshot: widget.snapshot, categoryNames: categoryNames, categoryNameIndex: categoryNameIndex);
              },
            )
          ],
        );
      },
    );
  }
}
