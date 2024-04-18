import 'package:farmacia_app/data/cart_inherited.dart';
import 'package:farmacia_app/screens/product_screen.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product(
      {super.key,
      required this.name,
      required this.picture,
      required this.price,
      required this.description,
      required this.bigDescription,
      required this.category, required this.promo, required this.contextCart
      });

  final String name;
  final String picture;
  final String category;
  final double price;
  final String description;
  final String bigDescription;
  final bool promo;
  final BuildContext contextCart;
  
  @override
  State<Product> createState() => _ProductState();
}



class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 17, fontWeight: FontWeight.w600);
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          setState(() {
            Navigator.push(context, MaterialPageRoute(
                builder: (contextNew) =>  ProductScreen(
                    name: widget.name,
                    picture: widget.picture,
                    price: widget.price,
                    description: widget.description,
                    bigDescription: widget.bigDescription,
                    contextCart: widget.contextCart ,
                )
            )
            );
          });
        },
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
            height: mediaQuery.size.height * 0.21,
            width: mediaQuery.size.width * 0.44,
            decoration: BoxDecoration(
                color: Colors.white38, borderRadius: BorderRadius.circular(12)),
          ),
          Column(
            children: [
              Container(
                height: mediaQuery.size.height * 0.15,
                width: mediaQuery.size.width * 0.44,
                decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)
                    )
                ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5.0),
                      child: Text(
                        widget.name,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 5.0),
                    child: Text("R\$${widget.price}", style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                  )
                ],
              ),
              Text(widget.description)
            ],
          )
        ]),
      ),
    );
  }
}
