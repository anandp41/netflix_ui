import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/home_banner_side_button.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widget.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kWidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              kWidth
            ],
            bottom: TabBar(
                indicatorPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                overlayColor:
                    MaterialStatePropertyAll(kWhiteColor.withOpacity(0.3)),
                indicatorColor: kWhiteColor,
                labelColor: kBlackColor,
                unselectedLabelColor: kWhiteColor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                    color: kWhiteColor, borderRadius: kBorderRadiusCircular30),
                tabs: const [
                  Tab(text: "🍿 Coming Soon"),
                  Tab(text: "👀 Everyone's watching"),
                ]),
          ),
        ),
        body: TabBarView(children: [
          const ComingSoonList(key: Key('coming soon')),
          _buildEveryonesWatching()
        ]),
      ),
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) => const SizedBox(),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text('Error while loading ComingSoon'),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text('List is empty'),
          );
        } else {
          return ListView.builder(
            itemCount: state.comingSoonList.length,
            itemBuilder: (context, index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              final _date = DateTime.parse(movie.releaseDate!);
              final formattedDate = DateFormat.yMMMMd('en_US').format(_date);
              return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: formattedDate.split(' ').first.substring(0, 3),
                  day: movie.releaseDate!.split('-')[1],
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.title ?? 'No title',
                  description: movie.overview ?? 'No description');
            },
          );
        }
      },
    );
  }
}




  // Widget _buildComingSoon(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: 6,
  //     itemBuilder: (context, index) => const ComingSoonWidget(),
  //   );
  // }

  

