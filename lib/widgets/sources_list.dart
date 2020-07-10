import 'package:flutter/material.dart';
import 'package:newsapp/provider/sources.dart';
import 'package:newsapp/widgets/sources_list_item.dart';
import 'package:provider/provider.dart';

class SourcesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Sources>(context).activeCategories;
    final sourceData = Provider.of<Sources>(context)
        .items
        .where((source) => source.categories == category)
        .toList();
    return sourceData.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            padding: const EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: sourceData.length,
            itemBuilder: (context, index) {
              return SourcesListItem(
                id: sourceData[index].id,
                name: sourceData[index].name,
                description: sourceData[index].description,
                category: category,
              );
            },
          );
  }
}
