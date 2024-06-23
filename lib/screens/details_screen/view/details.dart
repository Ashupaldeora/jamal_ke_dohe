import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.initialIndex});
  final int initialIndex;
  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<HomeProvider>(context);
    final providerFalse = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      // backgroundColor: Color(0xffF4F3F3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.translate),
            onSelected: (value) {
              providerFalse.updateSelectedLanguage(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'hindi',
                child: Text('Hindi'),
              ),
              const PopupMenuItem<String>(
                value: 'english',
                child: Text('English'),
              ),
              const PopupMenuItem<String>(
                value: 'gujarati',
                child: Text('Gujarati'),
              ),
            ],
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text('जमाल के दोहे'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            height: 600,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 10,
                  )
                ],
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8)),
            child: CarouselSlider.builder(
                carouselController: providerTrue.carouselController,
                itemCount: Provider.of<HomeProvider>(context).data.length,
                itemBuilder: (context, index, realIndex) {
                  bool isFavorite =
                      Provider.of<HomeProvider>(context, listen: false)
                              .favoriteStatus[index] ??
                          false;
                  return Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 50, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("दोहे - ",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                            Expanded(
                              child: Text(
                                  Provider.of<HomeProvider>(context)
                                      .data[index]
                                      .doha,
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.poppins(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "अर्थ - ",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Expanded(
                              child: Text(
                                  (providerTrue.selectedLanguage == "english")
                                      ? Provider.of<HomeProvider>(context)
                                          .data[index]
                                          .english
                                      : (providerTrue.selectedLanguage ==
                                              "gujarati")
                                          ? Provider.of<HomeProvider>(context)
                                              .data[index]
                                              .gujarati
                                          : Provider.of<HomeProvider>(context)
                                              .data[index]
                                              .hindi,
                                  overflow: TextOverflow.fade,
                                  // textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  )),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {}, icon: (Icon(Icons.share))),
                            IconButton(
                                onPressed: () {
                                  providerFalse.changeFavourite(
                                      isFavorite, index);
                                  Provider.of<HomeProvider>(context,
                                          listen: false)
                                      .updateFavouriteIndices();
                                },
                                icon: (Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : null,
                                ))),
                          ],
                        )
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  initialPage: initialIndex,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1,
                  height: 600,
                  onPageChanged: (index, reason) {
                    providerFalse.updateIndex(index);
                  },
                )),
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 80,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton.filled(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xffF5F5C9))),
                onPressed: () => (providerTrue.openedDohaIndex == 0)
                    ? null
                    : providerFalse.carouselController
                        .animateToPage(providerFalse.openedDohaIndex - 1),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            Spacer(),
            Row(
              children: [
                Text(
                  "${providerTrue.openedDohaIndex}",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  "/${providerTrue.data.length}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Spacer(),
            IconButton.filled(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xffF5F5C9))),
                onPressed: () {
                  providerFalse.carouselController
                      .animateToPage(providerFalse.openedDohaIndex + 1);
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}
