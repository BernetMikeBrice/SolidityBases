pragma solidity 0.8.7;

contract test1 {
// on peu déclaré un tableau qu'avec un seul type de variable, uint ou bool ou address
    uint[] nombre; // tableau // variable mis automatiquement en mode storage parce que 
    // mis a l'extérieur d'une fonction.

    //comment rajouté une valeur a un tableau| nous allons créés une fonction
    function addValue(uint _valeur) public {
        //le nom de la variable avec un (.push)
        nombre.push(_valeur);
    }

    // modifier la valeur dans un tableau
    function updateValue(uint _valeur, uint _index) public {
// on met nombre a un  index pour changé la valeur
        nombre[_index] = _valeur;

    }

    // pour supprimer une valeur
    function deleteValue(uint _index) public {
        delete nombre[_index];
    }

    // pour retourné une valeur
    function getValue(uint _index) public view returns(uint) {
        return nombre[_index];
    }
// nous allons travaillés sur les tableaux de type memory.
// les tableaux de type memory ne se conserve pas dans la blockchain.
    function getNombreX2() public view returns(uint[] memory) { // au déclare memory
 // quand on fait un tableau de type memory on doit spécifié la longueur du tableau       
        uint longueur = nombre.length;
        uint[] memory nombreX2 = new uint[](longueur);
  // créé une variable de comptage i = 0.
        for(uint i = 0 ; i < longueur ; i++) {
            nombreX2[i] = nombre[i] * 2;

        } 
        return nombreX2; 
    }




    }
    





// le nombreX2 est construit a partir du tableau nombre
// et comme il est dans une fonction , il est de type memory

    // GO to remix pour testé le contrat