import 'package:climbapp/core/utils/utils.dart';

abstract class IUseCase<T, E, P> {
  const IUseCase({required T repository}) : repository_ = repository;
  final T repository_;

  EitherFunc<E> execute(P params);

}