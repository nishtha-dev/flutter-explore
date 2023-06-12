import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({required this.title, super.key});

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedEvent = 0;

  // List<Widget> _pages = [GalleryScreen(), PostScreen(), ArticlesScreen()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildUserImage(size),

              // * 3 user Name
              buildUserInfo(),

              // //* 4 total no. of posts, followers, following (Row Widget)
              // buildUserActivity(),

              // * 5 follow and message button (Row widget)
              // buildUserEvents(size),

              // *
              // _pages[_selectedEvent],
            ],
          ),
        ),
      ),
    );
  }

  Container buildUserEvents(Size size) {
    return Container(
      // color: Colors.grey.shade100,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 0 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 0;
                  });
                },
                child: Text("Gallery",
                    style: TextStyle(
                      color: _selectedEvent == 0
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 1 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 1;
                  });
                },
                child: Text("Posts",
                    style: TextStyle(
                      color: _selectedEvent == 1
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 2 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 2;
                  });
                },
                child: Text("Articles",
                    style: TextStyle(
                      color: _selectedEvent == 2
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Stack buildUserImage(Size size) {
  return Stack(
    children: [
      Container(
        width: size.width,
        height: 200,
        color: Colors.transparent,
        padding: EdgeInsets.only(bottom: 150 / 2.2),
        child: Container(
          width: size.width,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(10, 10),
                  bottomRight: Radius.elliptical(10, 10)),
              color: Colors.amber
              // image: DecorationImage(
              //   image: NetworkImage(
              //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg8CzAfl_AEsQ9SqfH_byy8Ozh00wdGBd3tjLMOrlEmWhdLhCq&s"),
              //   fit: BoxFit.cover,
              // ),
              ),
        ),
      ),

      // * 1 backbutton (Row widget)
      Row(
        children: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          )
        ],
      ),

      // * user profile image
      Positioned(
        top: 180 / 2,
        left: size.width / 2.4,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 3),
              shape: BoxShape.circle),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSATP5C4Iti8iYFIwldjqZA3Tz_6efOBTvQCHc8xIL-WQkkLQ&s"),
          ),
        ),
      ),
    ],
  );
}

Container buildUserInfo() {
  return Container(
    child: ListTile(
      title: Row(
        children: [
          Text(
            "Nishtha Saraswat",
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          SizedBox(
            width: 8,
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Text(
          //     "Follow",
          //     style: TextStyle(color: Colors.blue, fontSize: 12),
          //   ),
          // ),
        ],
      ),
      subtitle: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                // Icon(
                //   Icons.home,
                //   color: Colors.grey.shade400,
                // ),
                Text(
                  "2019/CTAE/168",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                // Icon(
                //   Icons.person,
                //   color: Colors.grey.shade400,
                // ),
                Text(
                  "Computer Science",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                // Icon(
                //   Icons.person,
                //   color: Colors.grey.shade400,
                // ),
                Text(
                  "B. Tech",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
