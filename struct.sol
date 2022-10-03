pragma solidity 0.8.7;

contract test {
    // les structs pour créé notre propre structure de donné
    struct balance {
        uint money;
        uint numPayments;
    }
// un mapping, pour connecté le struct au mapping via des adresses
    mapping(address => balance) Balances;

    function getBalance() public view returns(uint) {
        // on fait un return de msg.sender parce qu'il représente celui qui apelle 
        //la fonction
        return Balances[msg.sender].money;

    }

    function getNumPayments() public view returns(uint) {
        return Balances[msg.sender].numPayments;
        // function pour le nombre de paiment

    }

    receive() external payable {
        // on n'a Balances associé a msg.sender visant money dans le struct
        // pour accéder a une donné du struct | on fait .(la donné du struct)
        // += pour spécifier l'argent en plus de ce qu'il a déja envoyé
        Balances[msg.sender].money += msg.value;
        Balances[msg.sender].numPayments += 1;

    }
    // rendez vous dans le remix pour tester votre contrat
}