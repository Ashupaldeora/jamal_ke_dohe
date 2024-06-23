import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<HomeProvider>(context).favoriteIndices.isEmpty
        ? Center(
            child: Text("No Favourites Yet"),
          )
        : ListView.builder(
            itemCount:
                Provider.of<HomeProvider>(context).favoriteIndices.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/details');
                },
                child: Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 20),
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 270,
                        height: 48,
                        child: Text(
                          Provider.of<HomeProvider>(context)
                              .data[Provider.of<HomeProvider>(context)
                                  .favoriteIndices[index]]
                              .doha,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Provider.of<HomeProvider>(context, listen: false)
                                .cancelFavouriteMap(Provider.of<HomeProvider>(
                                        context,
                                        listen: false)
                                    .favoriteIndices[index]);
                            Provider.of<HomeProvider>(context, listen: false)
                                .removeFavourites(index);

                            print(Provider.of<HomeProvider>(context,
                                    listen: false)
                                .favoriteStatus);
                            //     .changeFavourite(isFavorite, index);
                            // print(Provider.of<HomeProvider>(context,
                            //         listen: false)
                            //     .favoriteStatus);
                          },
                          icon: Icon(
                            // isFavorite ? Icons.favorite :
                            Icons.delete,
                            // color: isFavorite ? Colors.red : null,
                          ))
                    ],
                  ),
                ),
              );
            },
          );
  }
}
