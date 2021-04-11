import 'package:flutter/material.dart';
import 'package:dwmgex/firebase.dart';

class ProfileThumbnail extends StatelessWidget {
  const ProfileThumbnail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: getUser(firebaseAuth.currentUser.email),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  default:
                    var currentUser = snapshot.data;
                    return Container(
                      height: MediaQuery.of(context).size.height * .4,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              blurRadius: 4,
                              offset: Offset(
                                0.0,
                                4,
                              ),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.latribune.fr%2F1017684%2Flyon-saone-region-auvergne-rhone-alpes.jpg&f=1&nofb=1'),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 70, left: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fvignette.wikia.nocookie.net%2Ffriends%2Fimages%2F8%2F89%2FSquare_Ross.jpg%2Frevision%2Flatest%2Fscale-to-width-down%2F200%3Fcb%3D20111216200027&f=1&nofb=1'),
                                      radius: 45,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 125, left: 125),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Name : ' + currentUser.name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'City : ' +
                                              (currentUser.city != null
                                                  ? currentUser.city
                                                  : 'unavailable'),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Email : ' + currentUser.email,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    );
                }
              })
        ],
      ),
    );
  }
}
