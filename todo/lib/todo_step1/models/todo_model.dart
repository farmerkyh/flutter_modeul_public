import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

//todo 상태관리
enum Filter { all, active, completed }

/*
  @Todo model
   -사용시점 : 신규TODO, 수정시TODO
*/
class Todo extends Equatable {
  final String id;
  final String desc;
  final bool completed;

  //String? id
  // - 신규TODO시에는 id가 없기 때문에 nullable처리
  //: id = id ?? uuid.v4();
  // - id를 외부에서 주어지는 경우에는 assine 하고 : 그렇지 않은 경우에는 uuid를 통해 assine
  //this.comleted=fals
  // - 신규TODO시 default로 false처리
  Todo({String? id, required this.desc, this.completed = false})
      : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, desc, completed];

  @override
  bool get stringfy => true;
}
