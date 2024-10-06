abstract class RecommendedState {}

class RecommendedInitial extends RecommendedLoading {}

class RecommendedLoading extends RecommendedState {}
class RecommendedSucess extends RecommendedState {}
class RecommendedError extends RecommendedState {}