import 'package:climbapp/core/utils/utils.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  EitherFunc<Type> execute(Params params);
}
