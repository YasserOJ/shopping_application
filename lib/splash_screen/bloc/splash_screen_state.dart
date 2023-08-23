part of 'splash_screen_bloc.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();
}

class SplashScreenInitial extends SplashScreenState {
  @override
  List<Object> get props => [];
}

class SplashScreenLoading extends SplashScreenState {
  @override
  List<Object> get props => [];
}

class SplashScreenLoadingProductsSuccess extends SplashScreenState {
  @override
  List<Object> get props => [];
}

class SplashScreenLoadingProductsFailure extends SplashScreenState {
  @override
  List<Object> get props => [];
}
