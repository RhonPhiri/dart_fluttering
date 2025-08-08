// //working with WebSockets
// class WebSocketsHomePage extends StatefulWidget {
//   const WebSocketsHomePage({super.key});

//   @override
//   State<WebSocketsHomePage> createState() => _WebSocketsHomePageState();
// }

// class _WebSocketsHomePageState extends State<WebSocketsHomePage> {
//   final _channel =
//       WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'));
//   final TextEditingController _textController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('N E T A P P  (WebSockets)'),
//         centerTitle: true,
//         elevation: 4,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Form(
//               child: TextFormField(
//                 controller: _textController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter a message',
//                   contentPadding: EdgeInsets.all(8),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 24,
//             ),
//             StreamBuilder(
//               stream: _channel.stream,
//               builder: (context, snapshot) {
//                 return Text(snapshot.hasData ? '${snapshot.data}' : '');
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _sendMessage,
//         tooltip: 'Send message',
//         child: Icon(Icons.send),
//       ),
//     );
//   }

//   void _sendMessage() {
//     if (_textController.text.isNotEmpty) {
//       _channel.sink.add(_textController.text);
//     }
//   }

//   @override
//   void dispose() {
//     _channel.sink.close();
//     _textController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketHomePage extends StatefulWidget {
  const WebsocketHomePage({super.key});

  @override
  State<WebsocketHomePage> createState() => _WebsocketHomePageState();
}

class _WebsocketHomePageState extends State<WebsocketHomePage> {
  final TextEditingController _textController = TextEditingController();
  final _channel =
      WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org'));

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      _channel.sink.add(_textController.text);
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('N E T A P P  (Websockets)'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your message!',
              ),
            ),
            SizedBox(
              height: 32,
            ),
            StreamBuilder(
              stream: _channel.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                }
                if (snapshot.data.contains('Request served by')) {
                  return Text('Server Online!');
                }
                return Text('Message: ${snapshot.data}');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        child: Icon(
          Icons.send,
        ),
      ),
    );
  }
}
