import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif_assignment/models/event.dart';
import 'package:tif_assignment/utils/constants.dart';
import 'package:tif_assignment/utils/functions.dart';
import 'package:tif_assignment/views/eventDetails_view.dart';

import '../responsive/screen_type_layout.dart';

class HomeEvent extends StatelessWidget {
  final Event event;
  const HomeEvent({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => DetailsView(event: event)),
          ),
        );
      },
      child: ScreenTypeLayout(
        mobile: HomeEventMobile(event: event),
        tablet: HomeEventTablet(event: event),
      ),
    );
  }
}

class HomeEventMobile extends StatelessWidget {
  final Event event;
  const HomeEventMobile({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Container(
      width: width * 0.95,
      height: width * 0.28,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(87, 92, 138, 0.06),
              offset: Offset(0, 10),
              blurRadius: 35)
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Container(
              height: width * 0.26,
              width: width * 0.26,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 236, 242),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    event.bannerImage,
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                width: width * 0.6,
                height: width * 0.05,
                child: Text(
                  homeEventDate(event.dateTime),
                  style: GoogleFonts.inter(
                      fontSize: width * 0.035,
                      color: const Color.fromRGBO(86, 105, 255, 1)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: width * 0.6,
                height: width * 0.14,
                child: Text(
                  event.title,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.042,
                      color: const Color.fromRGBO(18, 13, 38, 1)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: width * 0.01),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/map-pin.png'),
                  SizedBox(width: width * 0.01),
                  SizedBox(
                    width: width * 0.6,
                    height: width * 0.047,
                    child: Text(
                      '${event.venueName}, ${event.venueCity}, ${event.venueCountry}',
                      style: GoogleFonts.inter(
                          fontSize: width * 0.035,
                          color: const Color.fromRGBO(116, 118, 136, 1)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HomeEventTablet extends StatelessWidget {
  final Event event;
  const HomeEventTablet({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Container(
      width: width * 0.95,
      height: width * 0.28,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(87, 92, 138, 0.06),
              offset: Offset(0, 10),
              blurRadius: 35)
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Container(
              height: width * 0.26,
              width: width * 0.26,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 236, 242),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    event.bannerImage,
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                width: width * 0.6,
                height: width * 0.05,
                child: Text(
                  homeEventDate(event.dateTime),
                  style: GoogleFonts.inter(
                      fontSize: width * 0.035,
                      color: const Color.fromRGBO(86, 105, 255, 1)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: width * 0.6,
                height: width * 0.14,
                child: Text(
                  event.title,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.042,
                      color: const Color.fromRGBO(18, 13, 38, 1)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: width * 0.01),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/map-pin.png'),
                  SizedBox(width: width * 0.01),
                  SizedBox(
                    width: width * 0.6,
                    height: width * 0.047,
                    child: Text(
                      '${event.venueName}, ${event.venueCity}, ${event.venueCountry}',
                      style: GoogleFonts.inter(
                          fontSize: width * 0.035,
                          color: const Color.fromRGBO(116, 118, 136, 1)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
