import 'package:equatable/equatable.dart';
import 'package:marketplace/models/post_details.dart';

class PostDetailsState extends Equatable {
  const PostDetailsState();

  @override
  List<Object> get props => [];
}

final class PostDetailsInitial extends PostDetailsState {
  const PostDetailsInitial();
}

final class PostDetailsLoading extends PostDetailsState {
  const PostDetailsLoading();
}

final class PostDetailsLoaded extends PostDetailsState {
  final PostDetails postDetailsDataState;
  const PostDetailsLoaded({required this.postDetailsDataState});

  @override
  List<Object> get props => [postDetailsDataState];
}

final class PostDetailsError extends PostDetailsState {
  const PostDetailsError();
}
