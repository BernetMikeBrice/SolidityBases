pragma solidity 0.8.7;

contract test2 {

    bool monBool; // par defaut un bool est égal a false

    function getBool() public view returns(bool) {
        return monBool;
    }

    function setBool(bool _monBool) public {
        monBool = _monBool;
    }
} // les explication de uint.sol s'applique aussi a bool.sol.

//mettre dans le remix true ou false pour la pratique.