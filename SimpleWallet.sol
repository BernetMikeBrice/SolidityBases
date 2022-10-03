pragma solidity 0.8.7;
// un wallet dans lequel va pouvoir placé des ethers et aussi les récupérés
// grace a la fonction transfert
contract wallet {

    struct wallet {
        uint balance; // le montant
        uint numPayments; // nombre de paiment
    }
// pour connecté les adresses aux montants et aux nombres de paiments
    mapping(address => wallet) Wallets;

    // function pour récupéré la totalité de la somme
    function getTotalBalance() public view returns(uint) {
        return address(this).balance;
        // (this) je vais récupéré pour le contrat actuel la somme
        // (faire une conversion de this en adresse)
    }

    function getBalance() public view returns(uint) {
        //le retour ce fait dans Wallets parce les informations sont stockés a 
        // a l'intérieur
        return Wallets[msg.sender].balance;
    }
// a partir du moment on fait des transfert d'argent on met payable
    function withdrawAllMoney(address payable _to) public {
       // faire uint pour récupéré le montant d'argent que l'utilisateur qui appel
       //cette fonction a envoyé sur le wallet
       uint _amount = Wallets[msg.sender].balance;
      // pour empeché l'utilisateur de prendre de l'argent a l'infini on met
       Wallets[msg.sender].balance = 0;
       _to.transfer(_amount);

    }
// pour recevoir de l'argent | receive
    receive() external payable {
        Wallets[msg.sender].balance += msg.value;
        Wallets[msg.sender].numPayments += 1;
    }

    




}