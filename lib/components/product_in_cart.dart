import 'package:farmacia_app/components/product_counter.dart';
import 'package:farmacia_app/data/cart_inherited.dart';
import 'package:flutter/material.dart';

class ProductInCart extends StatefulWidget {
  ProductInCart({
    super.key,
    required this.name,
    required this.picture,
    required this.description,
    required this.price,
    required this.count, required this.contextCart,

  });

  final String name;
  final String picture;
  final String description;
  final double price;
  int count;
  final BuildContext contextCart;

  @override
  State<ProductInCart> createState() => _ProductInCartState();
}

class _ProductInCartState extends State<ProductInCart> {


  void increment(){
    setState(() {
     widget.count++;
     InheritedCart.of(widget.contextCart).getTotalPrice();
    });
  }
  void decrement(){
    if(widget.count<=1){
      setState(() {
        widget.count = 0;
        InheritedCart.of(widget.contextCart).getTotalPrice();
      });
    }else{
      setState(() {
        widget.count--;
        InheritedCart.of(widget.contextCart).getTotalPrice();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 17, fontWeight: FontWeight.w600);
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
         height: mediaQuery.size.height * 0.15,
         width: mediaQuery.size.width * 0.85,
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: mediaQuery.size.height * 0.15,
              width: mediaQuery.size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(widget.picture,fit: BoxFit.cover,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.name, style:style.copyWith(fontSize: 15)),
                          Padding(
                            padding: const EdgeInsets.only(left:40.0, right: 8.0),
                            child: Text("R\$${(widget.price * widget.count).toStringAsFixed(2)}", style:style.copyWith(fontSize: 15),),
                          ),
                        ],
                      ),
                      Text(widget.description),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Counter(
                                  increment: increment,
                                  decrement: decrement,
                                  counter: widget.count, size: 35),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    InheritedCart.of(widget.contextCart).removeProduct(widget.name);
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: const Icon(Icons.delete),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
