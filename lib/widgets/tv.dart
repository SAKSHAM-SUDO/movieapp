import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left : 8.0, right:  8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'TV Shows', color: Colors.white, size: 26),
          SizedBox(height: 10,),
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tv.length,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            // height: 140,
                            child: Column(
                              children: [
                                Container(
                                  height : 140,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' + tv[index]['poster_path']
                                          ), fit: BoxFit.cover)
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  child: ModifiedText(text: tv[index]['original_name'] != null ?
                                  tv[index]['original_name'] : 'Loading', color: Colors.white, size: 14.0,),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),)
            ],
          )
        ],
      ),
    );
  }
}