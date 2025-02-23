import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/models/post.dart';
import 'package:marketplace/network/repository/repository.dart';

import '../../../service_locator.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Repository _dashboardRepository = sl<Repository>();
  DashboardBloc() : super(const DashboardState(currentIndex: 0)) {
    on<DashboardNavigationChanged>((event, emit) {
      emit(DashboardState(currentIndex: event.newIndex));
    });
    on<FetchPostDataEvent>(_onFetchPostDataEvent);
  }

  Future<void> _onFetchPostDataEvent(
      FetchPostDataEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading(currentIndex: state.currentIndex));
    try {
      final Post postData =
          await _dashboardRepository.fetchPosts(event.pageNumber);
      emit(DashboardLoaded(
          currentIndex: state.currentIndex, dashboardDataState: postData));
    } catch (e) {
      emit(DashboardError(
        currentIndex: state.currentIndex,
      ));
    }
  }
}
