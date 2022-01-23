import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class GroceryModel extends Equatable {
  final String id,task,path;
  final bool completed;

  GroceryModel(this.id,this.task,this.path,this.completed): super();

  @override
  // TODO: implement props
  List<Object?> get props => [id,task,path,completed];

}