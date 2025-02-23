import 'package:equatable/equatable.dart';

class DashboardEvent extends Equatable {
  const DashboardEvent();
  @override
  List<Object> get props => [];
}

class DashboardNavigationChanged extends DashboardEvent {
  final int newIndex;
  const DashboardNavigationChanged(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}

class FetchPostDataEvent extends DashboardEvent {
  final String pageNumber;
  const FetchPostDataEvent({required this.pageNumber});
}
