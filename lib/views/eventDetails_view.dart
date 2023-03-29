import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tif_assignment/responsive/screen_type_layout.dart';
import 'package:tif_assignment/utils/functions.dart';
import '../models/event.dart';
import '../utils/constants.dart';

class DetailsView extends StatefulWidget {
  final Event event;
  const DetailsView({Key? key, required this.event}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: DetailsViewMobile(event: widget.event),
      tablet: DetailsViewTablet(event: widget.event),
    );
  }
}

class DetailsViewMobile extends StatelessWidget {
  final Event event;
  const DetailsViewMobile({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  height: height * 0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(event.bannerImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.03, height * 0.02, width * 0.03, height * 0.02),
                  child: Text(
                    event.title,
                    style: GoogleFonts.inter(
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
                  child: ListTile(
                    leading: Container(
                      width: width * 0.1,
                      height: width * 0.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(event.organiserIcon),
                        ),
                      ),
                    ),
                    title: Text(event.organiserName),
                    subtitle: const Text("Organiser Name"),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
                  child: ListTile(
                    leading: Container(
                      width: width * 0.1,
                      height: width * 0.1,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/date.png'),
                        ),
                      ),
                    ),
                    title: Text(titleDetailsDate(event.dateTime)),
                    subtitle: Text(subtitleDetailsDate(event.dateTime)),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
                  child: ListTile(
                    leading: Container(
                      width: width * 0.1,
                      height: width * 0.1,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/location.png'),
                        ),
                      ),
                    ),
                    title: Text(event.venueName),
                    subtitle: Text('${event.venueCity}, ${event.venueCountry}'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.03, height * 0.02, width * 0.03, height * 0.01),
                  child: Text(
                    "About Event",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.04,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
                  child: Text(
                    event.description,
                    style: GoogleFonts.inter(
                      fontSize: width * 0.035,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: width,
                height: height * 0.11,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.59),
                      Color.fromRGBO(0, 0, 0, 0)
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Event Details",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.045,
                          ),
                        ),
                        SizedBox(width: width * 0.4),
                        Container(
                          width: width * 0.07,
                          height: width * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.bookmark,
                              color: Colors.white,
                              size: width * 0.035,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.69),
              Container(
                width: width,
                height: height * 0.20,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0),
                      Color.fromRGBO(255, 255, 255, 1)
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.12),
                    Container(
                      width: width * 0.72,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(86, 105, 255, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: width * 0.23),
                          SizedBox(
                            width: width * 0.26,
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  "BOOK NOW",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: width * 0.04,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.1),
                          CircleAvatar(
                              backgroundColor:
                                  const Color.fromRGBO(61, 86, 240, 1),
                              radius: width * 0.03,
                              child: Icon(
                                Icons.arrow_forward,
                                size: width * 0.035,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: width * 0.07,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsViewTablet extends StatelessWidget {
  final Event event;
  const DetailsViewTablet({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  height: height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(event.bannerImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.03, height * 0.02, width * 0.03, height * 0.02),
                  child: Text(
                    event.title,
                    style: GoogleFonts.inter(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
                  child: ListTile(
                    leading: Container(
                      width: width * 0.1,
                      height: width * 0.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(event.organiserIcon),
                        ),
                      ),
                    ),
                    title: Text(event.organiserName),
                    subtitle: const Text("Organiser Name"),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
                  child: ListTile(
                    leading: Container(
                      width: width * 0.1,
                      height: width * 0.1,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/date.png'),
                        ),
                      ),
                    ),
                    title: Text(titleDetailsDate(event.dateTime)),
                    subtitle: Text(subtitleDetailsDate(event.dateTime)),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
                  child: ListTile(
                    leading: Container(
                      width: width * 0.1,
                      height: width * 0.1,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/location.png'),
                        ),
                      ),
                    ),
                    title: Text(event.venueName),
                    subtitle: Text('${event.venueCity}, ${event.venueCountry}'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.03, height * 0.02, width * 0.03, height * 0.01),
                  child: Text(
                    "About Event",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.04,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.03, 0),
                  child: Text(
                    event.description,
                    style: GoogleFonts.inter(
                      fontSize: width * 0.035,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: width,
                height: height * 0.11,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.59),
                      Color.fromRGBO(0, 0, 0, 0)
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Event Details",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.045,
                          ),
                        ),
                        SizedBox(width: width * 0.4),
                        Container(
                          width: width * 0.07,
                          height: width * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.bookmark,
                              color: Colors.white,
                              size: width * 0.035,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.69),
              Container(
                width: width,
                height: height * 0.20,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0),
                      Color.fromRGBO(255, 255, 255, 1)
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.12),
                    Container(
                      width: width * 0.72,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(86, 105, 255, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: width * 0.23),
                          SizedBox(
                            width: width * 0.26,
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  "BOOK NOW",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: width * 0.04,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.1),
                          CircleAvatar(
                              backgroundColor:
                                  const Color.fromRGBO(61, 86, 240, 1),
                              radius: width * 0.03,
                              child: Icon(
                                Icons.arrow_forward,
                                size: width * 0.035,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: width * 0.07,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
