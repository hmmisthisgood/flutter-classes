import 'package:flutter/material.dart';

class ListLearning extends StatefulWidget {
  const ListLearning({Key? key}) : super(key: key);

  @override
  State<ListLearning> createState() => _ListLearningState();
}

class _ListLearningState extends State<ListLearning> {
  Color ourColor = Colors.black;

  onButtonPress() {
    setState(() {
      ourColor = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Container(
    //     child: ListView(
    //       scrollDirection: Axis.vertical,
    //       children: [
    //         Container(
    //           height: 300,
    //           width: 200,
    //           color: Colors.black,
    //         ),
    //         Container(
    //           color: Colors.white,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 "This is a facebook post",
    //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //               ),
    //               Text("Ayush"),
    //               Image.network(
    //                   "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Icon(Icons.send),
    //                       Icon(Icons.thumbs_up_down),
    //                       Icon(Icons.comment),
    //                     ],
    //                   ),
    //                   Icon(Icons.share)
    //                 ],
    //               )
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    /// InkWell - powerful widget which makes everyting clickable
    /// Gesture Detector- super set of inkwell
    /// Material Button , RaisedButton, TextButton,

    List<String> posts = [
      "Beautiful Photo",
      "Beautiful Sunset",
      "Beautiful Sunrise",
      "Good morning",
      "Pink sunset",
      "Beautiful Photo"
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          var post = posts[index];

          /// addding padding the to container from all sides
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(10),

              /// to decorate the container
              decoration: BoxDecoration(
                /// give the color to the container
                color: Colors.white,

                /// making the container rounded
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                border: Border.all(color: Colors.grey, width: 1),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(10, 10))
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      post,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ourColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset("assets/images/solo.jpeg"),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.send,
                              color: ourColor,
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.thumbs_up_down,
                              color: ourColor,
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.comment, color: ourColor),
                          ],
                        ),
                        Icon(Icons.share)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
