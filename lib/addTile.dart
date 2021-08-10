import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_application_olx_clone/productScreen.dart';

class advTile extends StatefulWidget {
  const advTile({
    Key? key,
    required this.brand,
    required this.model,
    required this.imageURL,
    required this.doc,
    required this.id,
  }) : super(key: key);
  final String imageURL, brand, model;
  final QueryDocumentSnapshot doc;
  final int id;
  @override
  _advTileState createState() =>
      _advTileState(this.brand, this.model, this.imageURL, this.doc, this.id);
}

class _advTileState extends State<advTile> {
  _advTileState(this.brand, this.model, this.imageURL, this.doc, this.id);

  QueryDocumentSnapshot doc;
  int id;

  bool isFavourite = false;
  IconData ic = Icons.favorite_border_outlined;
  String imageURL, brand, model;

  void iconSetter(bool isFavourite) {
    if (!isFavourite)
      ic = Icons.favorite_border_outlined;
    else {
      ic = Icons.favorite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductScreen(querySnapshot: doc, id: id)));
      },
      child: Neumorphic(
        child: Container(
          padding: EdgeInsets.all(15),
          height: 200,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              Container(
                height: 120,
                child: Image.network(
                  "$imageURL",
                  fit: BoxFit.contain,
                  scale: 0.5,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isFavourite = !isFavourite;
                    iconSetter(isFavourite);
                    print(isFavourite);
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      ic,
                      size: 20,
                    ),
                    Expanded(
                      child: Text(
                        "$brand $model",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductViewHomeScreen extends StatefulWidget {
  ProductViewHomeScreen({Key? key}) : super(key: key);

  @override
  _ProductViewHomeScreenState createState() => _ProductViewHomeScreenState();
}

class _ProductViewHomeScreenState extends State<ProductViewHomeScreen> {
  CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: products.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Container(
            child: Expanded(
                child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var doc = snapshot.data!.docs[0]; //[index];
            print(doc);
            print(doc["images"]["$index"][0]);
            print(doc["brand"][index]);
            print(doc["model"][index]);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                  //height: 80,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  advTile(
                    imageURL: doc["images"]["$index"][0],
                    brand: doc["brand"][index],
                    model: doc["model"][index],
                    id: index,
                    doc: doc,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  advTile(
                    imageURL: doc["images"]["$index"][0],
                    brand: doc["brand"][index],
                    model: doc["model"][index],
                    id: index,
                    doc: doc,
                  ),
                ],
              )),
            );
          },
          scrollDirection: Axis.vertical,
          itemCount: snapshot.data!.docs[0]["model"].length,
        )));
      },
    );
  }
}
