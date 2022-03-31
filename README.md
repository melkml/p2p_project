# P2P Chat

An implementation of a P2P chat on a local network using the JavaScript Net Module.

# Usage

In a P2P architecture, peers can act as both a server and a client.

To instantiate a peer as a server, you will need to enter the port on which the server will be allocated. To do so, type the port number along with the command to run the `index.js` file in your terminal, like this:

``
PORT=3000 node index.js
``

After that, to connect another peer to the network, open another terminal, assign another localhost port, run `index.js` again and add the address of the peer that wants to connect to the server, like this:

``
PORT=3001 node index.js localhost:3000
``


# Credit

This project is an implementation made from [Creating P2P chat with Nodejs](https://medium.com/@gregorygregio/criando-chat-p2p-com-nodejs-120bf7addb7c).
