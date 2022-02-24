
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ProductModel {

  String category;
  String productName;
  String detail;
  String serialCodel;
  int price;
  String weight;
  String brandName;
  int quantity;
  List<String> imagesUrl;
  bool isOnSale;
  bool isPopular;
  ProductModel({
    this.category,
    this.productName,
    this.detail,
    this.serialCodel,
    this.price,
    this.weight,
    this.brandName,
    this.quantity,
    this.imagesUrl,
    this.isOnSale,
    this.isPopular,
  });

  CollectionReference db = FirebaseFirestore.instance.collection('products');
  
  Future<void> addProduct(ProductModel productModel) async {
     Map<String, dynamic> data ={
       "category":productModel.category,
       "productName":productModel.productName,
       "detail":productModel.detail,
       'serialCodel':productModel.serialCodel,
       'price':productModel.price,
       'weight':productModel.weight,
       'brandName':productModel.brandName,
       'quantity':productModel.quantity,
       'imageUrl':productModel.imagesUrl,
       'isOneSale':productModel.isOnSale,
       'isPopular':productModel.isPopular,

     };
     await db.add(data);
  }
   
   Future<void> updateProduct(String id,ProductModel updateProduct) async {
     Map<String, dynamic> data ={
       "category":updateProduct.category,
       "productName":updateProduct.productName,
        "detail":updateProduct.detail,
       'serialCodel':updateProduct.serialCodel,
       'price':updateProduct.price,
       'weight':updateProduct.weight,
       'brandName':updateProduct.brandName,
       'quantity':updateProduct.quantity,
       'imageUrl':updateProduct.imagesUrl,
       'isOneSale':updateProduct.isOnSale,
       'isPopular':updateProduct.isPopular,

     };
     await db.doc(id).update(data);
  }

  Future<void> delete(String id) async{
    await db.doc(id).delete();
  }

}
