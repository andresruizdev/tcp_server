
import 'dart:async';
import 'dart:io';

class TcpServer {
  Socket _socket;
  String ipAddress;
  int port;


  TcpServer(){
    ipAddress = "0.0.0.0";
    port = 6101;

    addSocket();
  }

  TcpServer.addSocket(this.ipAddress, this.port){
    addSocket();
  }

  addSocket() async {
    try{
      Future<ServerSocket> serverFuture = ServerSocket.bind(ipAddress, port);
      serverFuture.then((ServerSocket server) {
        server.listen((Socket socket) {
          socket.listen((List<int> data) {
            String result = new String.fromCharCodes(data);
            print(result.toString());
            socket.add([0x48, 0x54]);
          });
        });
      });

    }catch(ex){
      print(ex);
    }
  }

  

}
