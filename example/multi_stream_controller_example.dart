import 'package:multi_stream_controller/multi_stream_controller.dart';

void main() async{
  MultiStreamController ctrler1 = MultiStreamController();
  MultiStreamController ctrler2 = MultiStreamController();
  ctrler1.controllers.add(ctrler2);
  ctrler1.pipe();
  ctrler1.add("foo");
  ctrler1.add(2);
  ctrler1.add(3);
  ctrler1.close();
  await for (dynamic value in ctrler2.result()){
    print(value);
  }
}