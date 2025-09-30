const WebSocket = require('ws');
const { spawn } = require('child_process');

const wss = new WebSocket.Server({ port: process.env.PORT || 3000 });

wss.on('connection', ws => {
  console.log('New client connected');

  // مبدئياً للتجربة، خلّيه يرد برسالة بدل SSH
  ws.on('message', msg => {
    console.log('Message from client:', msg.toString());
    ws.send('Echo: ' + msg);
  });

  ws.on('close', () => console.log('Client disconnected'));
});
