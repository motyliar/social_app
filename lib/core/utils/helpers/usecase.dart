import 'package:climbapp/core/utils/utils.dart';

abstract class UseCase<Type, Params> {
  EitherFunc<Type> execute(Params params);
}
