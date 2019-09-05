import 'package:douban_movie/blocs/blocs.dart';
import 'package:douban_movie/pages/detail/reviews.dart';
import 'package:douban_movie/pages/photos.page.dart';
import 'package:douban_movie/pages/preview.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) => state is DetailLoaded
          ? Scaffold(
              appBar: AppBar(
                title: Text(state.detail.title),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              backgroundColor: Color(0xfff9f5f4),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Hero(
                            tag: 'image_${state.detail.id}',
                            child: Card(
                              margin: const EdgeInsets.all(0),
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                state.detail.image,
                                width: 100,
                                height: 144,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${state.detail.title} (${state.detail.year})',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                  Text(
                                    '${state.detail.originalTitle}(${state.detail.year})',
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    [
                                      state.detail.genres.join(' '),
                                      state.detail.countries.join(' '),
                                      '片长${state.detail.durations.join()}'
                                    ].join(' / '),
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          color: Colors.white,
                                          elevation: 0.0,
                                          onPressed: () {},
                                          child: Text('想看'),
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Expanded(
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          color: Colors.white,
                                          elevation: 0.0,
                                          onPressed: () {},
                                          child: Text('看过'),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 10.0,
                      ),
                      child: Text(
                        '简介',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(state.detail.intro),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 10.0,
                      ),
                      child: Text(
                        '影人',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        itemExtent: 90,
                        itemCount: state.detail.actors.length,
                        itemBuilder: (context, index) => Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.network(
                                  state.detail.actors[index].avatar,
                                  width: 80,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Text(
                                state.detail.actors[index].name,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                state.detail.actors[index].roles.first,
                                style: TextStyle(fontSize: 11.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '预告片/剧照',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    builder: (_) => PhotosBloc()
                                      ..dispatch(InitPhotos([...state.photos])),
                                    child: PhotosPage(),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              '全部 ${state.photoTotal} >',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 7.0),
                        itemCount: (state.trailers.length > 0 ? 1 : 0) +
                            state.photos.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: state.trailers.length > 0 && index == 0
                              ? Container(
                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                  color: Colors.black,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Image.network(
                                        state.trailers.first.coverUrl,
                                        fit: BoxFit.fitHeight,
                                      ),
                                      Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.white,
                                        size: 32.0,
                                      ),
                                      Positioned(
                                        right: 4,
                                        bottom: 0,
                                        child: Text(
                                          state.trailers.first.runtime,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : GestureDetector(
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
                                          index: index -
                                              (state.trailers.length > 0
                                                  ? 1
                                                  : 0),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    state
                                        .photos[index -
                                            (state.trailers.length > 0 ? 1 : 0)]
                                        .image
                                        .normal,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Reviews(),
                  ],
                ),
              ),
            )
          : Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
