import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        bool isFavorite = Provider.of<HomeProvider>(context, listen: false)
                .favoriteStatus[index] ??
            false;
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/details');
          },
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 20),
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
                    Provider.of<HomeProvider>(context).data[index].doha,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.clip,
                  ),
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Provider.of<HomeProvider>(context, listen: false)
                          .changeFavourite(isFavorite, index);
                      print(Provider.of<HomeProvider>(context, listen: false)
                          .favoriteStatus);
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
