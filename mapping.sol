pragma solidity 0.8.7;

contract test {
    //les mapping n'ont pas de grandeur il faut assigner des clés de valeur pour
    // les faire grandir|et elle sont mieux que les tableaux > elles sonts moins
    // chère en gaz
    mapping(address => uint) Balances;
    //le uint représent la somme qui sera envoyé par les utilisateur et sera associé 
    //a une addresse |comme un tableau
    function getBalance(address _monAdresse) public view returns(uint) {
        return Balances[_monAdresse];
    }


    receive() external payable {
        //recupéré un montant grace a la variable msg.value
        //recupéré une addresse qui a envoyé sur le contrat grace a la variable msg.sender
        Balances[msg.sender] = msg.value;
        // on récupère le Balances|msg.sender celui qui a envoyé de l'argent(adresse)
        // on lui assigne l'argent qu'il a envoyé(uint)
    }
}