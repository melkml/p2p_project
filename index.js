if(!process.env.PORT)
    throw Error("Variável de ambiente PORT não informada");
const port = process.env.PORT;
const sha = require('sha256');
const timestamp = Date.now();
const randomNumber = Math.floor( (Math.random() * 10000) + 1000 )
const myKey = sha(port + "" + timestamp + "" + randomNumber );
const Peer = require("./Peer");
const peer = new Peer(port);

process.argv.slice(2).forEach( anotherPeerAddress => peer.connectTo(anotherPeerAddress) );
peer.onConnection = socket => {
    const message = "Hi !! I'm on port " + port;
    const signature = sha(message + myKey + Date.now());
    receivedMessageSignatures.push(signature);
    const firstPayload = {signature, message}
    socket.write(JSON.stringify(firstPayload))
};
process.stdin.on('data', data => {
    const message = data.toString().replace(/\n/g, "");
    const signature = sha(message + myKey + Date.now());
    receivedMessageSignatures.push(signature);
    peer.broadcast(JSON.stringify({ signature, message}));
});
const receivedMessageSignatures = [ myKey ];
peer.onData = (socket, data) => {
    const json = data.toString();
    const payload = JSON.parse(json);
    if(receivedMessageSignatures.includes(payload.signature))
        return;
    receivedMessageSignatures.push(payload.signature)
    console.log("recebido> ", payload.message)
    peer.broadcast(json);
};