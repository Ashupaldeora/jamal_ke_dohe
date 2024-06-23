import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamal_ke_dohe/screens/details_screen/view/details.dart';
import 'package:jamal_ke_dohe/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class AllDoha extends StatelessWidget {
  const AllDoha({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<HomeProvider>(context).data.length,
        itemBuilder: (context, index) {
          bool isFavorite = Provider.of<HomeProvider>(context, listen: false)
                  .favoriteStatus[index] ??
              false;
          return GestureDetector(
            onTap: () {
              Provider.of<HomeProvider>(context, listen: false)
                  .updateIndex(index);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(initialIndex: index),
                ),
              );
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 20),
              margin: EdgeInsets.only(
                  left: 25, right: 25, bottom: 15, top: index == 0 ? 15 : 0),
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
                        Provider.of<HomeProvider>(context, listen: false)
                            .updateFavouriteIndices();
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null,
                      ))
                ],
              ),
            ),
          );
        });
  }
}
