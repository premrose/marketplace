import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/models/post_details.dart';
import 'package:marketplace/network/repository/repository.dart';

import '../../../service_locator.dart';
import 'post_details_event.dart';
import 'post_details_state.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  final Repository _repository = sl<Repository>();
  PostDetailsBloc() : super(const PostDetailsState()) {
    on<FetchPostDetailsEvent>(_onFetchPostDetailsEvent);
  }

  Future<void> _onFetchPostDetailsEvent(
      FetchPostDetailsEvent event, Emitter<PostDetailsState> emit) async {
    emit(const PostDetailsLoading());
    try {
      final PostDetails postData =
          await _repository.fetchPostsDetails(event.hashId);
      emit(PostDetailsLoaded(postDetailsDataState: postData));
    } catch (e) {
      emit(const PostDetailsError());
    }
  }
}
