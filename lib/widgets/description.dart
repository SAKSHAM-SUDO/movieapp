import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerURL, posterURL, vote, launch_on;
  const Description({Key? key, required this.name, required this.description, required this.bannerURL, required this.posterURL, required this.vote, required this.launch_on}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                      width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerURL , fit: BoxFit.cover,),
                  )),
                  Positioned(
                    bottom: 10,
                    child: ModifiedText(text: ' * Average Rating' + vote, color: Colors.white, size: 18,),

                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ModifiedText(text : name!= null ? name : 'Not Available',color: Colors.white, size: 24,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ModifiedText(text :'Releasing On : ' + launch_on,color: Colors.white, size: 18,),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: 100,
                  child: Image.network(posterURL),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(text: description, size: 18, color: Colors.white,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
