import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'PhotoDetailsPage.dart';
import 'PhotoProvider.dart';

class PaginationProviderPage extends StatefulWidget {
  PaginationProviderPage({Key? key}) : super(key: key);

  @override
  State<PaginationProviderPage> createState() => _PaginationProviderPageState();
}

class _PaginationProviderPageState extends State<PaginationProviderPage> {
  final ScrollController _controller = ScrollController();
  fetchData() {
    Provider.of<PhotoProvider>(context, listen: false).callPhotoApi();
  }

  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    fetchData();
    //});
    super.initState();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<PhotoProvider>(builder: (context, data, __) {
          return Container(
            color: Colors.transparent,
            child: ListView.builder(
                controller: _controller,
                itemCount: data.photos.length,
                itemBuilder: (context, index) {
                  if (index == data.photos.length - 1) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotoDetails(
                                  tag: data.photos[index].id.toString(),
                                  url: data.photos[index].src!.large2x
                                      .toString())));
                    },
                    child: Container(
                      height: h / 2,
                      margin: EdgeInsets.all(h / 18),
                      child: Hero(
                        transitionOnUserGestures: true,
                        tag: data.photos[index].id.toString(),
                        child: Image.network(
                          data.photos[index].src!.medium.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          );
        }));
  }
}
