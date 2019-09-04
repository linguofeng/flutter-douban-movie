import 'package:douban_movie/blocs/blocs.dart';
import 'package:flutter_web/material.dart';
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
                brightness: Brightness.light,
                iconTheme: Theme.of(context).iconTheme.copyWith(
                      color: Colors.black,
                    ),
                textTheme: Theme.of(context).textTheme.copyWith(
                      title: Theme.of(context).textTheme.title.copyWith(
                            color: Colors.black,
                          ),
                    ),
              ),
              backgroundColor: Color(0xfff9f5f4),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: 'image_${state.detail.id}',
                          child: Card(
                            child: Image.network(
                              state.detail.image.replaceAll('https', 'http'),
                              width: 100,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${state.detail.title} (${state.detail.year})',
                                ),
                                Text(
                                  '${state.detail.originalTitle}(${state.detail.year})',
                                  softWrap: true,
                                ),
                                Text([
                                  state.detail.genres.join(' '),
                                  state.detail.countries.join(' '),
                                  '片长${state.detail.durations.join()}'
                                ].join(' / ')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('简介'),
                    Text(state.detail.intro),
                    Text('影人'),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        itemExtent: 90,
                        itemCount: state.detail.actors.length,
                        itemBuilder: (context, index) => Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.network(
                                state.detail.actors[index].avatar
                                    .replaceAll('https', 'http'),
                                width: 80,
                                fit: BoxFit.fitWidth,
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
                          Text('预告片/剧照'),
                          Text('全部 ${state.photoTotal} >')
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
                                        state.trailers.first.coverUrl
                                            .replaceAll('https', 'http'),
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
                              : Image.network(
                                  state
                                      .photos[index -
                                          (state.trailers.length > 0 ? 1 : 0)]
                                      .image
                                      .normal
                                      .replaceAll('https', 'http'),
                                  fit: BoxFit.fitHeight,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
