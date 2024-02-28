import 'package:flutter/material.dart';
import 'package:travel_app_ui/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _locations = ['Poulare', 'Japan', 'Moscow', 'London'];
  int _activeLocation = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        bottom: true,
        minimum: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
            0, MediaQuery.of(context).size.width * 0.05, 0),
        child: mainColumn(context),
      ),
    );
  }

  Widget mainColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu,
              color: Colors.black87,
              size: 35,
            ),
            Container(
              height: 39,
              width: 144,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/logo_discover.png'),
                ),
              ),
            ),
            const Icon(
              Icons.search,
              color: Colors.black87,
              size: 35,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.03),
          child: _locationBar(context),
        ),
        _articleList(context),
      ],
    );
  }

  Widget _locationBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(69, 69, 69, 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _locations.map((e) {
          bool _isActive = _locations[_activeLocation] == e ? true : false;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                e,
                style: TextStyle(
                    fontSize: 15,
                    color: _isActive ? Colors.white : Colors.white54,
                    fontFamily: 'Montserrat'),
              ),
              _isActive
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.redAccent,
                      ),
                      height: 5,
                      width: 30,
                    )
                  : Container(),
            ],
          );
        }).toList(),
      ),
    );
  }

  // ----------------------------------

  Widget _articleList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(articles[index].image),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 4,
                          blurRadius: 20,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _articleInfoColumn(context, index),
              Positioned(
                  bottom: 10,
                  left: MediaQuery.of(context).size.width * 0.10,
                  child: socialRow(context, index)),
            ],
          );
        },
        itemCount: articles.length,
      ),
    );
  }

  Widget _articleInfoColumn(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 30, 0),
          child: _authorInfoRow(context, index),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              30, MediaQuery.of(context).size.height * 0.05, 30, 0),
          child: detailInfoRow(context, index),
        ),
      ],
    );
  }

  Widget _authorInfoRow(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage('https://i.pravatar.cc/300'),
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articles[index].author,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '3 Hours ago',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget detailInfoRow(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.play_arrow,
            color: Colors.redAccent,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.010,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.50,
              child: Text(
                articles[index].title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Montserrat'),
                overflow: TextOverflow.clip,
              ),
            ),
            Text(
              articles[index].location,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
            ),
            _rattingWidget(context, index),
          ],
        ),
      ],
    );
  }

  Widget socialRow(BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.redAccent,
                ),
                Text(articles[index].likes.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.comment_rounded,
                ),
                Text(articles[index].comments.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.share,
                ),
                Text(articles[index].shares.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _rattingWidget(BuildContext context, int index) {
    return Row(
      children: List.generate(5, (currentIndex) {
        Icon starIcon;
        int fillAmount = articles[index].ratting - currentIndex;
        if (fillAmount >= 1) {
          starIcon = const Icon(
            Icons.star,
            color: Colors.amber,
            size: 15,
          );
        } else if (fillAmount >= 0.5) {
          starIcon = const Icon(
            Icons.star_half,
            color: Colors.amber,
            size: 15,
          );
        } else {
          starIcon = const Icon(
            Icons.star_outline,
            color: Colors.amber,
            size: 15,
          );
        }
        return starIcon;
      }),
    );
  }
}
