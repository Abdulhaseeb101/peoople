import 'package:flutter/material.dart';
import 'package:newflut_app/constants.dart';
import 'package:newflut_app/helper/buildCategories.dart';
import 'package:newflut_app/services/services.dart';
import 'package:newflut_app/helper/buildProductsByCategory.dart';

class SelectedShop extends StatefulWidget {
  ValueNotifier<int> totalAmount = ValueNotifier(0);

  @override
  _SelectedShopState createState() => _SelectedShopState();
}

class _SelectedShopState extends State<SelectedShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              FutureBuilder(
                future: fetchCategories('$SERVER_URL/get_shopprod_cat'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Row(
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Text('Loading...'),
                        ],
                      ),
                    );
                  } else {
                    if (snapshot.data.length == 0) {
                      return Text('Check your network');
                    } else {
                      return buildCategories(
                          snapshot, '/SelectedCategory', context);
                    }
                  }
                },
              ),
              Divider(),
              Text('Products',
                  style: TextStyle(
                    color: PTextColor,
                    fontSize: 30.0,
                  )),
              FutureBuilder(
                future: fetchProductsByCategory('$SERVER_URL/get_shop_prod'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Row(
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Text('Loading...'),
                        ],
                      ),
                    );
                  } else {
                    if (snapshot.data.length == 0) {
                      return Text(
                        'Check your network',
                      );
                    } else {
                      //return BuildProductByCategory(snapshot: snapshot, context: context);
                      return BuildProductByCategory(
                          snapshot: snapshot, context: context);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Align(
            child: ValueListenableBuilder<int>(
                valueListenable: widget.totalAmount,
                builder: (context, value, child) {
                  if (value == 0) {
                    return Text('Select Product Quantity');
                  } else {
                    return Text(widget.totalAmount.value.toString());
                  }
                })),
        decoration: BoxDecoration(
          color: PColor,
        ),
        height: 50,
      ),
    );
  }
}
