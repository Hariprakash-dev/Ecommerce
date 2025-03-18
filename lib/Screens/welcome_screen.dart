import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Welcome back,\nOlivia"),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(245, 245, 245, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120.0,
                      width: 220.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('Assets/vegetables.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Categories"), Text("See all")],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categories("Fragrance"),
                  SizedBox(width: 10),
                  categories("Makeup"),
                  SizedBox(width: 10),

                  categories("Hair"),
                  SizedBox(width: 10),

                  categories("Skincare"),
                  SizedBox(width: 10),

                  categories("Hair"),
                  SizedBox(width: 10),

                  categories("Makeup"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("New arrivals"), Text("See all")],
            ),

            SizedBox(
              height: 290,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(6)),
                        border: Border.all(
                          width: 0.5,
                          color: const Color.fromRGBO(185, 185, 185, 1),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6),
                                ),
                              ),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Image.asset(
                                    "Assets/pro1.jpeg",
                                    height: 140,
                                    width: 140,
                                  ),
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                                                        SizedBox(height: 20,),

                            Row(
                              
                              children: [Text("The Ordinary")]),
                            Text("Glycolic Acid 7% To."),
                            SizedBox(height: 10,),
                            Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(185, 185, 185, 1),
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: Color.fromRGBO(185, 185, 185, 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8,right: 15),
            child: Text("S14.50 USD"),
          ),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
            child: Icon(Icons.add,color: Colors.white,),
          )
        ],
      ),
    ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
           
          ],
        ),
      ),
    );
  }

  Container categories(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: Color.fromRGBO(185, 185, 185, 1)),
      ),
      child: Padding(padding: const EdgeInsets.all(10.0), child: Text(text)),
    );
  }
}
