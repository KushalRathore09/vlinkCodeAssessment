import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_training/model/training.dart';
import 'package:flutter_training/utils/app_images.dart';
import 'package:flutter_training/widget/filterList.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardState();
}

class DashboardState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  CarouselController buttonCarouselController = CarouselController();
  var top = 0.0;

  bool _isVisible = false;
  bool _isSelected = false ;
  List<Training> trainingList = [];

  @override
  void initState() {
    super.initState();
    trainingList = buildList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trainings",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.menu))
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                bottom: PreferredSize(
                  // Add this code
                  preferredSize: Size.fromHeight(10.0), // Add this code
                  child: Text(''), // Add this code
                ),
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    top = constraints.biggest.height;
                    print(top);
                    top == 66.0 ? _isVisible = true : _isVisible = false;
                    return FlexibleSpaceBar(
                        centerTitle: true,
                        title: filterWidget(),
                        collapseMode: CollapseMode.parallax,
                        background: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                "HighLights",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            _carousalSlider(),
                            singleFilterWidget()
                          ],
                        ));
                  },
                )),
          ];
        },
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildCard(trainingList[index]);
            },
            itemCount: trainingList.length,
          ),
        ),
      ),
    );
  }

  singleFilterWidget() {
    return Container(
      width: 60,
      margin: const EdgeInsets.only(left: 20, top: 10),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(2.5)),
          border: Border.all(color: Colors.white, width: 0.5)),
      child: Row(
        children: [
          Icon(
            Icons.menu_open_sharp,
            color: Colors.red[400],
            size: 20,
          ),
          Text(
            "Filter",
            style: TextStyle(color: Colors.red[400]),
          )
        ],
      ),
    );
  }

  Widget _carousalSlider() {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () {
              buttonCarouselController.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            },
            child: Container(
              color: Colors.grey[800].withOpacity(0.6),
              height: 80,
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          CarouselSlider(
            items: carousalChild
                .map((item) => Container(
                      child: Center(
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                .toList(),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
            ),
          ),
          InkWell(
            onTap: () {
              buttonCarouselController.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            },
            child: Container(
              color: Colors.grey[800].withOpacity(0.6),
              height: 80,
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterWidget() {
    return Visibility(
      visible: _isVisible,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => _filterModalBottomSheet(context),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(Radius.circular(2.5)),
                  border: Border.all(color: Colors.white, width: 0.5)),
              child: Row(
                children: [
                  Icon(
                    Icons.menu_open_sharp,
                    color: Colors.red[400],
                    size: 20,
                  ),
                  Text(
                    "Filter",
                    style: TextStyle(color: Colors.red[400]),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Colors.grey[800].withOpacity(0.5),
                borderRadius: new BorderRadius.all(Radius.circular(2.5)),
                border: Border.all(
                    color: Colors.grey[800].withOpacity(0.5), width: 0.5)),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  "Near ME",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Colors.grey[800].withOpacity(0.5),
                borderRadius: new BorderRadius.all(Radius.circular(2.5)),
                border: Border.all(
                    color: Colors.grey[800].withOpacity(0.5), width: 0.5)),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  "Filing Fast",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Colors.grey[800].withOpacity(0.5),
                borderRadius: new BorderRadius.all(Radius.circular(2.5)),
                border: Border.all(
                    color: Colors.grey[800].withOpacity(0.5), width: 0.5)),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  "Filing Fast",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> carousalChild = [cs1, cs2, cs3];

  _buildCard(Training model) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  model.date,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  model.time,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                )),
                          ),
                          Flexible(
                            child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  model.address,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 140,
                      width: 0.5,
                      color: Colors.black,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              model.status,
                              style: TextStyle(
                                  color: Colors.red[400], fontSize: 14.0),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, top: 5.0),
                            child: Text(
                              model.trainingCourseName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child:
                                      Image.asset(user, height: 40, width: 40)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      model.speakerName,
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      model.trainerName,
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only( left: 160),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: Colors.red[300],
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(2.5)),
                                border: Border.all(
                                    color: Colors.red[300], width: 0.5)),
                            child: Row(
                              children: [
                                InkWell(
                                  child: Text(
                                    "Enroll Now",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  buildList() {
    List<Training> trainingList = [];
    trainingList.add(Training(
        date: "Oct 11-13, 2019",
        time: "08:30 am - 12:30 pm",
        address: "Convention Hall,Greater Des Moines",
        status: "Filing Fast",
        trainingCourseName: "Safe Scrum Master(4.6)",
        trainerName: "Helen Gribble",
        speakerName: "Keynote Speaker",
        trainingCourseDescription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"));
    trainingList.add(Training(
        date: "Oct 13-15, 2019",
        time: "08:30 am - 12:30 pm",
        address: "Convention Hall,Greater Des Moines",
        status: "Early Bird",
        trainingCourseName: "Safe Scrum Master(4.2)",
        trainerName: "Helen Gribble",
        speakerName: "Keynote Speaker",
        trainingCourseDescription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"));
    trainingList.add(Training(
        date: "Nov 11-13, 2019",
        time: "08:30 am - 12:30 pm",
        address: "Convention Hall,Greater Des Moines",
        status: "This Month",
        trainingCourseName: "Safe Scrum Master(4.6)",
        trainerName: "Helen Gribble",
        speakerName: "Keynote Speaker",
        trainingCourseDescription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"));
    trainingList.add(Training(
        date: "Oct 13-15, 2019",
        time: "08:30 am - 12:30 pm",
        address: "Convention Hall,Greater Des Moines",
        status: "Filing Fast",
        trainingCourseName: "Safe Scrum Master(4.6)",
        trainerName: "Helen Gribble",
        speakerName: "Keynote Speaker",
        trainingCourseDescription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"));
    trainingList.add(Training(
        date: "Dec 11-13, 2019",
        time: "08:30 am - 12:30 pm",
        address: "Convention Hall,Greater Des Moines",
        status: "Early Bird",
        trainingCourseName: "Safe Scrum Master(4.6)",
        trainerName: "Helen Gribble",
        speakerName: "Keynote Speaker",
        trainingCourseDescription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"));
    trainingList.add(Training(
        date: "Jan 11-13, 2020",
        time: "08:30 am - 12:30 pm",
        address: "Convention Hall,Greater Des Moines",
        status: "Early Bird",
        trainingCourseName: "Safe Scrum Master(4.6)",
        trainerName: "Helen Gribble",
        speakerName: "Keynote Speaker",
        trainingCourseDescription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"));
    return trainingList;
  }

  _filterModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isDismissible: true,
        context: context,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height,
              child: FilterData() ,
            ));
  }
}
