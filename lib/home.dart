import 'package:flutter/material.dart';
import 'package:shopping_application_olx_clone/addTile.dart';
import 'package:shopping_application_olx_clone/services/Auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = 'City1';
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   toolbarHeight: 120,
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       DropdownButton(
      //         icon: const Icon(Icons.keyboard_arrow_down_sharp),
      //         iconSize: 24,
      //         elevation: 16,
      //         value: dropdownValue,
      //         style: const TextStyle(color: Color.fromARGB(255, 0, 48, 52)),
      //         // underline: Container(
      //         //   height: 2,
      //         //   color: Colors.black,
      //         // ),
      //         onChanged: (String? newValue) {
      //           setState(() {
      //             dropdownValue = newValue!;
      //           });
      //         },
      //         items: <String>['City1', 'City2', 'City3', 'City4', 'City5']
      //             .map<DropdownMenuItem<String>>((String value) {
      //           return DropdownMenuItem<String>(
      //             value: value,
      //             child: Text(value,
      //                 style: TextStyle(color: Color.fromARGB(255, 0, 48, 52))),
      //           );
      //         }).toList(),
      //       ),
      //       Row(
      //         children: [
      //           Expanded(
      //               child: TextField(
      //             decoration: InputDecoration(
      //               prefixIcon: Icon(
      //                 Icons.search,
      //                 color: Color.fromARGB(255, 0, 48, 52),
      //               ),
      //               border: OutlineInputBorder(
      //                   borderSide: BorderSide(
      //                 color: Color.fromARGB(255, 0, 48, 52),
      //               )),
      //               focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(
      //                 color: Color.fromARGB(255, 0, 48, 52),
      //               )),
      //             ),
      //           )),
      //           SizedBox(
      //             width: 15,
      //           ),
      //           Icon(
      //             Icons.notifications_none,
      //             color: Color.fromARGB(255, 0, 48, 52),
      //           )
      //         ],
      //       ),
      //     ],
      //   ),
      // ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: DropdownButton(
          icon: const Icon(Icons.keyboard_arrow_down_sharp),
          iconSize: 24,
          elevation: 16,
          value: dropdownValue,
          style: const TextStyle(color: Color.fromARGB(255, 0, 48, 52)),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['City1', 'City2', 'City3', 'City4', 'City5']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                  style: TextStyle(color: Color.fromARGB(255, 0, 48, 52))),
            );
          }).toList(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        hintText: "Find Cars, Mobile Phones and many more",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 0, 48, 52),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 48, 52),
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 48, 52),
                        )),
                      ),
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.notifications_none,
                      color: Color.fromARGB(255, 0, 48, 52),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  CarouselSlider(
                      items: [
                        Neumorphic(
                          child: Container(
                            color: Colors.green,
                            // height: MediaQuery.of(context).size.height * 0.10,
                            child: Center(child: Text("Featured")),
                          ),
                        ),
                        Neumorphic(
                          child: Container(
                            color: Colors.yellow,
                            // height: MediaQuery.of(context).size.height * 0.10,
                            child: Center(child: Text("Featured")),
                          ),
                        ),
                        Neumorphic(
                          child: Container(
                            color: Colors.red,
                            // height: MediaQuery.of(context).size.height * 0.10,
                            child: Center(child: Text("Featured")),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 160, //200
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: null,
                        scrollDirection: Axis.horizontal,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    child: CategoryWidget(),
                    // child: ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   children: [CategoryWidget()],
                    // ),
                  ),
                  Container(
                      height: 240,
                      color: Colors.white30,
                      child: ProductViewHomeScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home_outlined),
            ),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
            Icon(null),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)),
            IconButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person_outlined))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        splashColor: Colors.white30,
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 0, 48, 52),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  CollectionReference categories =
      FirebaseFirestore.instance.collection("categories");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: categories.get(),
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
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("Categories")),
                  TextButton(onPressed: () {}, child: Text("See All >"))
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  var doc = snapshot.data!.docs[index];
                  // print("$index hooya");
                  return Container(
                    height: 80,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Image.network(
                            doc["image"],
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          doc["catName"],
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
              ))
            ],
          ),
        );
      },
    );
  }
}
