module.exports = class Clients { 
    let clientId = 0;   
    constructor() {
        
    }
    saveClient(username, client) {
        this.clientList[username] = client;
    }
}