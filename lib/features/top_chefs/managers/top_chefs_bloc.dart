import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/data/repositories/chef_repository.dart';
import 'package:recipe/features/top_chefs/managers/top_chefs_state.dart';

part 'top_chefs_events.dart';

class TopChefsBloc extends Bloc<TopChefsEvent, TopChefsState> {
  TopChefsBloc({required ChefRepository chefRepo})
      : _chefRepo = chefRepo,
        super(TopChefsState.initial()) {
    on<TopChefsLoading>(_onLoad);
    add(TopChefsLoading());
  }

  final ChefRepository _chefRepo;

  Future<void> _onLoad(TopChefsLoading event, Emitter<TopChefsState> emit) async {
    emit(
      state.copyWith(
        mostViewedChefsStatus: TopChefsStatus.loading,
        mostLikedChefsStatus: TopChefsStatus.loading,
        newChefsStatus: TopChefsStatus.loading,
      ),
    );

    var req1 = _chefRepo.fetchMostViewedChefs().then(
      (value) {
        emit(state.copyWith(mostViewedChefs: value, mostViewedChefsStatus: TopChefsStatus.success));
      },
    );
    var req2 = _chefRepo.fetchMostLikedChefs().then(
          (value) => emit(
            state.copyWith(mostLikedChefs: value, mostLikedChefsStatus: TopChefsStatus.success),
          ),
        );
    var req3 = _chefRepo.fetchNewChefs().then(
          (value) => emit(
            state.copyWith(newChefs: value, newChefsStatus: TopChefsStatus.success),
          ),
        );

    await Future.wait([req1, req2, req3]);
  }
}
