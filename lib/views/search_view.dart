import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tif_assignment/responsive/screen_type_layout.dart';
import 'package:tif_assignment/widgets/home_event.dart';
import 'package:tif_assignment/widgets/search_event.dart';

import '../api/data_service.dart';
import '../models/event.dart';
import '../utils/constants.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return const ScreenTypeLayout(
      mobile: SearchViewMobile(),
      tablet: SearchViewTablet(),
    );
  }
}

class SearchViewMobile extends StatefulWidget {
  const SearchViewMobile({Key? key}) : super(key: key);

  @override
  State<SearchViewMobile> createState() => _SearchViewMobileState();
}

class _SearchViewMobileState extends State<SearchViewMobile> {
  List dataList = [];

  DataService service = DataService();

  Future getData(String query) async {
    try {
      dataList = await service.fetchSearchResult(query);
      return dataList;
    } catch (e) {
      dataList = [];
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getData("");
  }

  final _formKey1 = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Search",
          style: GoogleFonts.inter(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Form(
                key: _formKey1,
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(121, 116, 231, 1),
                  controller: searchController,
                  onChanged: (value) {
                    getData(value).then((value) {
                      setState(() {
                        dataList = value;
                      });
                    });
                  },
                  decoration: InputDecoration(
                    icon: const Icon(Icons.search,
                        color: Color.fromRGBO(86, 105, 255, 1)),
                    fillColor: Colors.white,
                    hintText: "Type Event Name",
                    hintStyle: GoogleFonts.inter(
                        fontSize: width * 0.04,
                        color: const Color.fromRGBO(0, 0, 0, 0.30)),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            ...dataList.map((e) => SearchEvent(event: e))
          ],
        ),
      ),
    );
  }
}

class SearchViewTablet extends StatefulWidget {
  const SearchViewTablet({Key? key}) : super(key: key);

  @override
  State<SearchViewTablet> createState() => _SearchViewTabletState();
}

class _SearchViewTabletState extends State<SearchViewTablet> {
 List dataList = [];

  DataService service = DataService();

  Future getData(String query) async {
    try {
      dataList = await service.fetchSearchResult(query);
      return dataList;
    } catch (e) {
      dataList = [];
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getData("");
  }

  final _formKey1 = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.getWidth(context);
    var height = SizeConfig.getHeight(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Search",
          style: GoogleFonts.inter(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Form(
                key: _formKey1,
                child: TextFormField(
                  cursorColor: const Color.fromRGBO(121, 116, 231, 1),
                  controller: searchController,
                  onChanged: (value) {
                    getData(value).then((value) {
                      setState(() {
                        dataList = value;
                      });
                    });
                  },
                  decoration: InputDecoration(
                    icon: const Icon(Icons.search,
                        color: Color.fromRGBO(86, 105, 255, 1)),
                    fillColor: Colors.white,
                    hintText: "Type Event Name",
                    hintStyle: GoogleFonts.inter(
                        fontSize: width * 0.04,
                        color: const Color.fromRGBO(0, 0, 0, 0.30)),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            ...dataList.map((e) => SearchEvent(event: e))
          ],
        ),
      ),
    );
  }
}
