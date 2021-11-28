import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos/configs/constants.dart';
import 'package:pos/controllers/responsive.dart';
import 'package:pos/models/products_model.dart';
// import 'package:pos/providers/product.dart';
import 'package:pos/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false)
        .fetchAndSetProducts('refresh');
  }

  // final _isInit = false;
  // final _isLoading = false;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  /* @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      // Mengambil data dari server pada awal init aplikasi
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
      _isInit = false;
    }
    super.didChangeDependencies();
  } */

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ProductsProvider>(context).items;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Produk Anda'),
      // ),

      /* body: _isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : ProductGrid(false), */

      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: SmartRefresher(
              controller: refreshController,
              header: const ClassicHeader(
                releaseText: 'Lepas untuk Refresh',
                completeText: 'Refresh',
                idleText: 'Tarik untuk refresh',
              ),
              footer: CustomFooter(
                builder: (context, mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = const Text("Mengambil Data...");
                  }
                  // else if(mode==LoadStatus.loading){
                  //   // body =  CupertinoActivityIndicator();
                  //   body =  CupertinoActivityIndicator();
                  // }
                  else if (mode == LoadStatus.failed) {
                    body = const Text("Gagal mengambil data, coba lagi!");
                  } else if (mode == LoadStatus.canLoading) {
                    body = const Text("Lepas untuk ambil data");
                  } else {
                    body = const Text("Tidak ada data lagi");
                  }
                  return SizedBox(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              enablePullUp: true,
              onRefresh: () async {
                // await Future.delayed(Duration(milliseconds: 100));
                Provider.of<ProductsProvider>(context, listen: false)
                    .fetchAndSetProducts('refresh');

                refreshController.refreshCompleted();
              },
              onLoading: () async {
                // await Future.delayed(Duration(milliseconds: 100));
                Provider.of<ProductsProvider>(context, listen: false)
                    .fetchAndSetProducts('next');
                refreshController.loadComplete();
              },
              // child: ProductGrid(listProduct: items,),
              child: productList(items),
            ),
          ),
          if (!Responsive.isMobile(context))
            const SizedBox(width: defaultPadding),
          if (!Responsive.isMobile(context))
            Expanded(
              flex: 2,
              child: Container(),
            ),
        ],
      ),
    );
  }

  ListView productList(List<Product> items) {
    ScrollController _controller = ScrollController();
    return ListView.separated(
      controller: _controller,
      itemBuilder: (context, index) {
        final prod = items[index];
        final qty = (prod.productVariations[0].variations[0]
                .variationLocationDetails.isNotEmpty)
            ? prod.productVariations[0].variations[0]
                .variationLocationDetails[0]['qty_available']
            : 0;
        // final qty = 50.0000;
        // if(prod.productVariations[0].variations[0]
        //         .variationLocationDetails.isNotEmpty)
        // print(prod.productVariations[0].variations[0]
        //         .variationLocationDetails[0]['qty_available']);
        var qtyy = double.parse(qty.toString());
        return ListTile(
          title: Text(prod.name),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(prod.sku, style: TextStyle(color: Colors.amber[100])),
              Text('Stok: $qtyy', style: TextStyle(color: Colors.amber[100]))
            ],
          ),
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(prod.imageUrl),
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  // onPressed: () => print('Edit Product: ${prod.id}'),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product ID: ${prod.id}'))),
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  // onPressed: () => print('Hapus Product: ${prod.id}'),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hapus Product ID: ${prod.id}'))),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: items.length,
    );
  }
}
