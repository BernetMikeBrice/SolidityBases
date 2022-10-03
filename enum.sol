pragma solidity 0.8.7;

contract Exercice {
//Les énumérations sont le moyen de créer des types de données définis par l'utilisateur,
// elles sont généralement utilisées pour fournir des noms aux constantes intégrales
    enum etape {commande, expedie, livre}

    struct produit {
        uint _SKU;// numéro d'identifiant unique
 // une variable de type Enum (_etape) pour nommer la variable    
        Exercice.etape _etape; // chaque produit a une étape
    }
// un mapping pour connecté les adresses aux produits.
    mapping(address => produit) CommandesClient;

// une fonction pour commander un produit
// un produit c'est un SKU mais aussi une étape
    function commander(address _client, uint _SKU) public {       
        produit memory p = produit(_SKU, etape.commande);
        CommandesClient[_client] = p;
    }
// une fonction pour expédier
    function expedier(address _client) public {
// la commande est en mode expédié        
        CommandesClient[_client]._etape = etape.expedie;

    }

    function getSKU(address _client) public view returns(uint) {
        return CommandesClient[_client]._SKU;
    }

    function getEtape(address _client) public view returns(etape) {
        return CommandesClient[_client]._etape;
    }





}