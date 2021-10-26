import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Trending Movies', color: Colors.white, size: 26),
          SizedBox(height: 10,),
          ListView(
            shrinkWrap: true,
            children: [
              Container(height: 270,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: trending.length,
                      itemBuilder: (context, index){
                        return InkWell(
                          onTap: (){},
                          child: Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height : 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path']
                                    ))
                                  ),
                                ),
                                Container(
                                  child: ModifiedText(text: trending[index]['title'] != null ?
                                  trending[index]['title'] : 'Loading', color: Colors.white, size: 14.0,),
                                )
                              ],
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