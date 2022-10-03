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






}