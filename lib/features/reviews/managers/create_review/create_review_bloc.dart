import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe/features/reviews/managers/create_review/create_review_state.dart';

part 'create_review_events.dart';

class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewState> {
  CreateReviewBloc() : super(CreateReviewState.initial()) {
    on<CreateReviewRate>(_onRate);
    on<CreateReviewPickImage>(_onPickImage);
    on<CreateReviewRecommendOrNot>(_onRecommendOrNot);
  }

  // onChange - stateda o'zgarish bo'lsa chaqiriladi
  // @override
  // void onChange(Change<CreateReviewState> change) {
  //   super.onChange(change);
  //   debugPrint(change.currentState.toString());
  //   debugPrint(change.nextState.toString());
  // }
  //
  // @override
  // void onTransition(Transition<CreateReviewEvent, CreateReviewState> transition) {
  //   super.onTransition(transition);
  //   debugPrint(transition.event.toString());
  //   debugPrint(transition.currentState.toString());
  //   debugPrint(transition.nextState.toString());
  // }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
  }

  Future<void> _onRate(CreateReviewRate event, Emitter<CreateReviewState> emit) async {
    addError("Banzaaaay");
    emit(state.copyWith(currentIndex: event.currentIndex));
  }

  Future<void> _onPickImage(CreateReviewPickImage event, Emitter<CreateReviewState> emit) async {
    File? image;
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickVideo(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      emit(state.copyWith(pickedImage: image));
    }
  }

  Future<void> _onRecommendOrNot(CreateReviewRecommendOrNot event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(doesRecommend: event.value));

  }
}
