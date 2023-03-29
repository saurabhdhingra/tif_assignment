import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tif_assignment/api/data_service.dart';

import 'package:tif_assignment/responsive/screen_type_layout.dart';
import 'package:tif_assignment/viewModels/home_viewModel.dart';
import 'package:tif_assignment/widgets/home_event.dart';

import '../models/event.dart';
import '../utils/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return const ScreenTypeLayout(
      mobile: HomeViewMobile(),
      tablet: HomeViewTablet(),
    );
  }
}

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  bool isLoading = false;
  List dataList = [];

  DataService service = DataService();
  Future getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      dataList = await service.fetchDataList();
    } catch (e) {
      dataList = [];
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text("Events",
            style: GoogleFonts.inter(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'search');
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...dataList.map(
              (e) => Padding(
                padding:
                    EdgeInsets.fromLTRB(width * 0.025, 0, width * 0.025, 0),
                child: HomeEvent(event: e),
              ),
            ),
            SizedBox(height: height * 0.1, width: width)
          ],
        ),
      ),
    );
  }
}

class HomeViewTablet extends StatefulWidget {
  const HomeViewTablet({Key? key}) : super(key: key);

  @override
  State<HomeViewTablet> createState() => _HomeViewTabletState();
}

class _HomeViewTabletState extends State<HomeViewTablet> {
  bool isLoading = false;
  List dataList = [];

  DataService service = DataService();
  Future getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      dataList = await service.fetchDataList();
    } catch (e) {
      dataList = [];
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text("Events",
            style: GoogleFonts.inter(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'search');
            },
            icon: const Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: Text("Loading ... "))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...dataList.map(
                    (e) => Padding(
                      padding: EdgeInsets.fromLTRB(
                          width * 0.025, 0, width * 0.025, 0),
                      child: HomeEvent(event: e),
                    ),
                  ),
                  SizedBox(height: height * 0.1, width: width)
                ],
              ),
            ),
    );
  }
}
