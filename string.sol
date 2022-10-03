pragma solidity 0.8.7;

contract test4 {
     
     string monString;

     function getString() public view returns(string memory) {
         // Mettre potentiellement le string accompagné de memory
         return monString;
     }         
     

     function setString(string memory _monString) public {
         monString = _monString;
     }
}

// les explication de uint.sol s'applique aussi a string.sol.

//mettre dans le remix true ou false pour la pratique.