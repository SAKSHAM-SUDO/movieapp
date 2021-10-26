import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/widgets/toprated.dart';
import 'package:movieapp/widgets/trending.dart';
import 'package:movieapp/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topratedMovies = [];
  List topRatedTVShows = [];
  final String apiKey = '70bb31ffbf1df26bc357a11a23441c6d';
  final accesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MGJiMzFmZmJmMWRmMjZiYzM1N2ExMWEyMzQ0MWM2ZCIsInN1YiI6IjYxNzZlMmUzODk0ZWQ2MDA4ZTRiNTAwYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sUI4pdTJGJ-p5WppDY1GQSX8KnRKaHJoCnHVU-N7jFI';

  @override
  void initState() {
    loadMovies();
  }

  loadMovies() async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, accesstoken),
    logConfig: ConfigLogger(
      showErrorLogs: true,
      showLogs: true
    ));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map TVResult = await tmdbWithCustomLogs.v3.tv.getPouplar();


    setState(() {
      trendingMovies = trendingResult['results'];
      topratedMovies = topRatedResult['results'];
      topRatedTVShows = TVResult['results'];
    });
    print(trendingMovies);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ModifiedText(text:'Flutter Movie App',color : Colors.white, size: 18)
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovies),
          TopRated(topRated: topratedMovies),
          TV(tv : topRatedTVShows)
        ],
      ),
    );
  }
}
