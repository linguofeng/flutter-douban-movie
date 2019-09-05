import 'package:douban_movie/blocs/blocs.dart';
import 'package:douban_movie/pages/preview.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: BlocBuilder<PhotosBloc, PhotosState>(
        builder: (context, state) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
          ),
          itemCount: state.photos.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => PreviewPage(
                    images: state.photos
                        .map(
                          (item) => item.image.large,
                        )
                        .toList(),
                    index: index,
                  ),
                ),
              );
            },
            child: Image.network(
              state.photos[index].image.normal,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
