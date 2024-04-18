import 'package:farmacia_app/components/product_in_cart.dart';
import 'package:farmacia_app/data/cart_inherited.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.contextCart});

  final BuildContext contextCart;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int valor = 1203;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    TextStyle style = const TextStyle(fontSize: 17, fontWeight: FontWeight.w600);

    return Scaffold(
        backgroundColor: Colors.red[300],
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Meu carrinho",
              style: style.copyWith(fontSize: 21),
            ),
            elevation: 0,
            backgroundColor: Colors.red[300],

        ),
        //floatingActionButton: FloatingActionButton(),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: mediaQuery.size.height * 0.7,
                width: mediaQuery.size.width * 0.93,
                child: ListView(
                  children: InheritedCart.of(widget.contextCart).produtosNoCarrinho,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top : 8.0, bottom: 8.0),
                child: Container(
                  width: mediaQuery.size.width * 0.8,
                  height: mediaQuery.size.height *0.08,
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Método de Compra',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          )
                       ),
                      Container(
                        width: mediaQuery.size.width * 0.4,
                        height: mediaQuery.size.height *0.08,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child:  Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text('Pix',style: style,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.pix_rounded, color: Colors.green[400],),
                              )
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: mediaQuery.size.width * 0.8,
                  height: mediaQuery.size.height *0.08,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25)
                  ),
                child: Center(
                    child: Text("PAGAR            \$${InheritedCart.of(widget.contextCart).getTotalPrice().toStringAsFixed(2)}",
                      style: style,)),
              )
            ],
          ),
        ),
        );
  }
}
