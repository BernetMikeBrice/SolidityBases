pragma solidity 0.8.7;
//int c'est des nombres négatif et uint des nombres positive
//souvent en solidity on va utiliser des entiers positif
contract test {

    uint nombre; // par défault un uint est égal a zéro
// func pour récupéré la valeur d'un nombre
    function getNombre() public view returns(uint) {
        return nombre;
    }
// func pour modifier un nombre
    function setNombre(uint _nombre) public {
       // on pointe nombre vers l'entré de function (_nombre)
        nombre = _nombre;
    }

    
} // En sortie de compilateur > la valeur mis dans (setNombre) est récupéré grace a
 //(getNombre)