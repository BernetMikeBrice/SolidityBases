pragma solidity 0.8.7;

contract test3 {
    
    address monAddresse;

    function getAddress() public view returns(address) {
        return monAddresse;
    }

    function setAddress(address _monAddresse) public {
        monAddresse = _monAddresse;
    }
}

// les explication de uint.sol s'applique aussi a address.sol.

//mettre dans le remix true ou false pour la pratique.