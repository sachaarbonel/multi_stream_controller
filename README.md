A way to easily pipe your streams into one controller

## Usage

A simple usage example:

```dart
import 'package:multi_stream_controller/multi_stream_controller.dart';

void main() async{
  MultiStreamController ctrler1 = MultiStreamController();
  MultiStreamController ctrler2 = MultiStreamController();
  ctrler1.controllers.add(ctrler2);
  ctrler1.pipe();
  ctrler1.add(1);
  ctrler1.add(2);
  ctrler1.add(3);
  ctrler1.close();
  await for (dynamic value in ctrler2.result()){
    print(value);
  }
  //1
  //2
  //3
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://github.com/Sach97/multi_stream_controller/issues/
