

import 'package:flutter/material.dart';

import '../components/product_in_cart.dart';

class InheritedCart extends InheritedWidget {

   InheritedCart({
    super.key,
    required Widget child,
  }) : super(child: child);

  static InheritedCart of(BuildContext context) {
    final InheritedCart? result =
        context.dependOnInheritedWidgetOfExactType<InheritedCart>();
    assert(result != null, 'No InheritedCart found in context');
    return result!;
  }

  List<ProductInCart> produtosNoCarrinho = [

  ];

  void addProduct(String name, String picture, String description, double price, int count, BuildContext contextCart){
    ProductInCart product = ProductInCart(name: name, picture: picture, description: description, price: price, count: count, contextCart: contextCart,);
    int comp =search(product.name);
    if(comp == -1){
      produtosNoCarrinho.add(product);
      updateTotalPrice();
    }else{
      produtosNoCarrinho[comp].count += product.count;
      updateTotalPrice();
    }

    updateTotalPrice();
  }

  int search(String name){
    int i=0;
    for( i ;i<produtosNoCarrinho.length; i++ ){

      if(name == produtosNoCarrinho[i].name){
        return i;
      }
    }
    return i-i-1;
  }

  void removeProduct(String name){

    for(int i=0; i<produtosNoCarrinho.length;i++){

      if(name == produtosNoCarrinho[i].name){
        produtosNoCarrinho.remove(produtosNoCarrinho[i]);
        updateTotalPrice();
      }

    }
  }
  double totalPrice =0;

  double getTotalPrice(){
    updateTotalPrice();
    return totalPrice;
  }

   double getTotalPriceProduct(){
     updateTotalPrice();
     return totalPrice;
   }


  void updateTotalPrice(){
    double aux = 0;
    for(int i=0; i<produtosNoCarrinho.length;i++){
      ProductInCart actualCart = produtosNoCarrinho[i];
      aux += actualCart.price * actualCart.count;
    }
    totalPrice = aux;
  }

  @override
  bool updateShouldNotify(InheritedCart oldWidget) {
    return oldWidget.produtosNoCarrinho.length != produtosNoCarrinho.length;
  }
}
