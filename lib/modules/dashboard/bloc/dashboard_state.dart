import 'package:equatable/equatable.dart';
import 'package:marketplace/models/post.dart';

class DashboardState extends Equatable {
  final int currentIndex;
  const DashboardState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}

final class DashboardInitial extends DashboardState {
  const DashboardInitial({required super.currentIndex});
}

final class DashboardLoading extends DashboardState {
  const DashboardLoading({required super.currentIndex});
}

final class DashboardLoaded extends DashboardState {
  final Post dashboardDataState;
  const DashboardLoaded(
      {required this.dashboardDataState, required super.currentIndex});

  @override
  List<Object> get props => [dashboardDataState, currentIndex];
}

final class DashboardError extends DashboardState {
  const DashboardError({required super.currentIndex});
}
