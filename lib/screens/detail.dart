import 'package:dwmgex/models/movie.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(context, '/detail/update');
              })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF9FA8DA), Color(0xFF1A237E)],
            stops: [0.1, 1],
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A237E),
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.75), BlendMode.dstATop),
                      image: new NetworkImage(
                        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fparissecret.com%2Fwp-content%2Fuploads%2F2018%2F02%2Fhistoire19.jpg&f=1&nofb=1',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .31,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                        const Color(0xFF1A237E).withOpacity(0.1),
                        const Color(0xFF7982bd),
                      ],
                          stops: [
                        0.0,
                        1.0
                      ])),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 115),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(
                          0.0,
                          0,
                        ),
                      )
                    ], borderRadius: BorderRadius.circular(100)),
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(movie.poster),
                        radius: 76,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Synopsis',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          movie.plot,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Year',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          movie.year.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Actors',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          movie.actors.join(", "),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Kind',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          movie.kind.join(", "),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
