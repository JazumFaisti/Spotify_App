import 'package:spotify_app/DI/service_locator.dart';
import 'package:spotify_app/data/datasource/podcast_datasource.dart';
import 'package:spotify_app/data/model/podcast.dart';

abstract class PodcastRepository {
  Future<List<Podcast>> getPodcastList();
}

class PodcastLocalRepository extends PodcastRepository {
  final PodcastDatasource _datasource = locator.get();
  @override
  Future<List<Podcast>> getPodcastList() async {
    return await _datasource.getPodcastList();
  }
}
