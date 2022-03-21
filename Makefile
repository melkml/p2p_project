PROGRAMA=node
NUM_PORT=3000
open.server:  
	PORT=$(NUM_PORT) $(PROGRAMA) index.js
open.client:  
	PORT=3001 $(PROGRAMA) index.js localhost:3000
