pragma solidity 0.8.7;
// contrat pour envoyer de l'argent sur un smart contract.
contract test {
// variable pour la dernière personne a avoir envoyé de l'argent sur le contrat
    address lastPerson;
    //le montant d'argent envoyé
    uint balance; // uint a une valeur de 0
// func pour savoir la dernier personne qui a envoyé de l'argent
    function getLastPerson() public view returns(address) {
        return lastPerson;
    }
// func pour savoir le montant sur le contrat intelligent
    function getBalance() public view returns(uint) {
        return balance;
    }
    // pour envoyé de l'argent on'a la fonction receive|external pour appelé la function 
    //uniquement a l'exterieur du contrat|payable pour envoi d'argent de transfert
    receive() external payable {
        //msg.sender est une variable qui contient l'adresse de la personne qui a envoyé 
        //de l'argent
        lastPerson = msg.sender;
        // msg.value représente le montant en wei que la personne a envoyé sur le contrat
        balance = balance + msg.value;

    }

}

// une fois compilé| envoyé de l'ether avec différente addresse pour tester le contract