import 'package:equatable/equatable.dart';

class PostDetailsEvent extends Equatable {
  const PostDetailsEvent();
  @override
  List<Object> get props => [];
}

class FetchPostDetailsEvent extends PostDetailsEvent {
  final String hashId;
  const FetchPostDetailsEvent({required this.hashId});
}
