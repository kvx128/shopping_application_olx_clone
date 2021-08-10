import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    Key? key,
    required this.querySnapshot,
    required this.id,
  }) : super(key: key);
  QueryDocumentSnapshot querySnapshot;
  int id;
  String category = "cars";
  @override
  _ProductScreenState createState() =>
      _ProductScreenState(querySnapshot, id, category);
}

class _ProductScreenState extends State<ProductScreen> {
  QueryDocumentSnapshot querySnapshot;
  int id;
  int _current = 0;
  String category;
  _ProductScreenState(this.querySnapshot, this.id, this.category);

  Widget categorywiseDetails(String type) {
    switch (type) {
      case "cars":
        return car_details(querySnapshot: querySnapshot, id: id);

      //case "fashion":
      default:
        return Container();
    }
  }

  bool isFavourite = false;
  IconData ic = Icons.favorite_border_outlined;
  void iconSetter(bool isFavourite) {
    if (!isFavourite)
      ic = Icons.favorite_border_outlined;
    else {
      ic = Icons.favorite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(ic),
              onPressed: () {
                setState(() {
                  isFavourite = !isFavourite;
                  iconSetter(isFavourite);
                  print(isFavourite);
                });
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                  itemCount: querySnapshot["images"]["$id"].length,
                  itemBuilder: (BuildContext context, int index, int page) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                              "${querySnapshot["images"]["$id"][index]}")
                        ]);
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      })),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                        "${_current + 1}/${querySnapshot["images"]["$id"].length}"),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              car_details(querySnapshot: querySnapshot, id: id),
              ElevatedButton(onPressed: () {}, child: Text("Buy Now")),
            ],
          ),
        ]),
      ),
    );
  }
}

class car_details extends StatelessWidget {
  const car_details({
    Key? key,
    required this.querySnapshot,
    required this.id,
  }) : super(key: key);

  final QueryDocumentSnapshot querySnapshot;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey,
          thickness: 2.0,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${querySnapshot["brand"][id]}",
                style: TextStyle(fontSize: 26),
              ),
              Text("${querySnapshot["model"][id]}",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              Text("${querySnapshot["variant"][id]}",
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text("${querySnapshot["description"][id]}"),
        ),
        SizedBox(
          height: 50,
        ),
        Text("price = ${querySnapshot["price"][id]}",
            style: TextStyle(fontSize: 26))
      ],
    );
  }
}

class bike_details extends StatelessWidget {
  const bike_details({
    Key? key,
    required this.querySnapshot,
    required this.id,
  }) : super(key: key);

  final QueryDocumentSnapshot querySnapshot;
  final int id;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("${querySnapshot["brand"][id]}"),
        Text("${querySnapshot["model"][id]}"),
        Text("${querySnapshot["description"][id]}"),
        Text("${querySnapshot["price"][id]}")
      ],
    );
  }
}
