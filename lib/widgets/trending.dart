// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/widgets/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left : 8.0, right:  8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Trending Movies', color: Colors.white, size: 26),
          SizedBox(height: 10,),
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                // height: MediaQuery.of(context).size.width*0.72,
                height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: trending.length,
                      itemBuilder: (context, index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Description
                              (name: trending[index]['title'],bannerURL: 'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'],
                              posterURL: 'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'],
                              description:trending[index]['overview'] , vote: trending[index]['vote_average'].toString(),
                              launch_on: trending[index]['release_date'],
                            )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 140,
                              child: Column(
                                children: [
                                  Container(
                                    width : 250,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path']
                                      ),
                                      fit: BoxFit.cover)
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    child: ModifiedText(text: trending[index]['title'] != null ?
                                    trending[index]['title'] : 'Loading', color: Colors.white, size: 14.0,),
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