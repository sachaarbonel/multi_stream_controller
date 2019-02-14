import 'dart:async';
import 'package:stream_channel/stream_channel.dart';

class MultiStreamController {
  StreamController streamController;
  StreamController sinkController;
  StreamChannel channel;
  List<MultiStreamController> controllers = <MultiStreamController>[];
  
  MultiStreamController(){
    sinkController = StreamController();
    streamController = StreamController();
    channel=StreamChannel(streamController.stream, sinkController.sink);
  }

  void pipe(){
    for (var ctrl in controllers) {
      channel.pipe(ctrl.channel);
    }
    
  }
  void add(dynamic i){
    streamController.add(i);
  }

  void close(){
    streamController.close();
  }

  Stream<dynamic> result() async* {
    await for (dynamic value in sinkController.stream){
      yield value;
    }
  }
  
}