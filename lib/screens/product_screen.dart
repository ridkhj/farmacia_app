import 'package:farmacia_app/components/product_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:farmacia_app/data/cart_inherited.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(
      {super.key,
      required this.name,
      required this.picture,
      required this.price,
      required this.description,
      required this.bigDescription,
        required this.contextCart
      });
  final String name;
  final String picture;
  final double price;
  final String description;
  final String bigDescription;
  final BuildContext contextCart;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}
class _ProductScreenState extends State<ProductScreen> {
  int counter = 0;
  void increment(){
    setState(() {
      counter++;
    });
  }
  void decrement(){
    if(counter<=1){
      setState(() {
        counter = 0;
      });
    }else{
      setState(() {
        counter--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 17, fontWeight: FontWeight.w600);
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red[300],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Stack(alignment: Alignment.topCenter, children: [
                  Container(
                    height: mediaQuery.size.height * 0.44,
                    width: mediaQuery.size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: mediaQuery.size.height * 0.37,
                        width: mediaQuery.size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[300],
                            borderRadius: BorderRadius.circular(12)),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          child: Image.asset(
                            widget.picture,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 15.0),
                              child: Text(
                                widget.name,
                                style: style,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, right: 15.0),
                              child: Text(
                                "R\$${widget.price.toString()}",
                                style: style,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
              )), //foto,nome e preco
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Counter(increment: increment,
                      decrement: decrement,
                      counter: counter,
                      size: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        if(counter > 0 ){
                          setState(() {
                            InheritedCart.of(widget.contextCart).addProduct(
                                widget.name,
                                widget.picture, widget.description, widget.price, counter, widget.contextCart);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('adicionado ao carrinho')));
                            Navigator.pop(context);
                          });
                        }
                      } ,
                      child: Container(
                        width: mediaQuery.size.width * 0.4,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                            child: Text(
                          'Adicionar ao carrinho',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                  )
                  //adicionar ao carrinho
                ],
              ),
            ),
          ),//botoes
          Container(
              width: mediaQuery.size.width *0.9,
              height: mediaQuery.size.height *0.3,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(child: Text(widget.bigDescription)),
              ))
        ],
      ),
    );
  }
}
