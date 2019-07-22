import 'package:flutter/cupertino.dart';
import 'model/app_state_model.dart';
import 'package:codelab/product_row_item.dart';
import 'package:provider/provider.dart';

class ProductListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Consumer<AppStateModel>(builder: (context, model, child) {
        final products = model.getProducts();
        return CustomScrollView(
          semanticChildCount: products.length,
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: const Text('Products'),
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index < products.length) {
                    return ProductRowItemPage(
                      index: index,
                      product: products[index],
                      lastItem: index == products.length - 1,
                    );
                  }

                  return null;
                }),
              ),
            )
          ],
        );
      }),
    );
  }
}
