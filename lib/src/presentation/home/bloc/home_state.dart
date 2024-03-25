import 'package:equatable/equatable.dart';


abstract class HomeState extends Equatable{
  const HomeState();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class HomeStateInitial extends HomeState{


}
class HomeStateLoading extends HomeState{
  const HomeStateLoading();
@override

  List<Object?> get props => super.props;
}

class HomeStateFailed extends HomeState{

}

class HomeStateSuccess extends HomeState{

}