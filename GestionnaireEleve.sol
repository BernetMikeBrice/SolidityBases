pragma solidity 0.8.7;

contract GestionnaireEleve {

    address owner; // la personne qui pourra gérer les élèves sera le propriétaire du
    //contract//
    struct Grade { // pour chaque note de l'élève une structure grade//
        string subject; // le sujet
        uint grade; // les notes des élèves
    }

    struct Student { //pour identifié  l'élève a ses notes
        string firstName;
        string lastName;
        uint numberOfGrades;
        mapping(uint => Grade) grades; // pour relié l' éléve a c'est note.le uint c'est pour
        // classé les notes . uint > 1 > histoire= sub > note:10 =grade comme un tableau.
    }

    mapping(address => Student) students; // le point d'entré pour accéder au deux struct
    // grace a une addresse.

    constructor() { // 
        owner = msg.sender; // msg.sender celui qui déploi le contrat
    }

    function addStudent(address _studentAddress, string memory _firstName, string memory _lastName) public {
        // fonction qui permet de rajouté un élève en fonction de son adresse , son nom et prénom | vu du public
        require(msg.sender == owner, "Not the owner"); // require : pour privatisé la fonction au owner malgré qu'il soit en public
        // le require bloque la fonction si celui qui ajoute l'élève n'est pas le owner.
        // voir si l'élève existe déja | bytes c'est comme les strings mais sa consomme moins de gaz.
        // on viens récupéré l'addresse de l'élève avec _studentAddress(funct), par le mapping students et .firstName pour vérifié
        // ce que l'on veut.//() pour la capsule.
        bytes memory firstNameOfAddress =  bytes (students[_studentAddress].firstName);
        require(firstNameOfAddress.length == 0, "Existe deja"); // si la longueur est du nom est supérieur a 0 c'est que on la
        // déja rajouté
        students[_studentAddress].firstName = _firstName;
        students[_studentAddress].lastName = _lastName;
        // les deux lignes sont une structure complet pour que la (func) pointe sur plusieur endroit en meme temps

    }

    function addGrade(address _studentAddress, uint _grade, string memory _subject) public {
        // fonction pour ajouter des notes
        require(msg.sender == owner, "Not the owner");
        bytes memory firstNameOfAddress = bytes (students[_studentAddress].firstName);
        require(firstNameOfAddress.length > 0, "il faut creer l'eleve");
        // pour ajouter une note a un élève et un sujet
        students[_studentAddress].grades[students[_studentAddress].numberOfGrades].grade = _grade;
        students[_studentAddress].grades[students[_studentAddress].numberOfGrades].subject = _subject;
        // si on rajoute une note | dans le mapping il faut que sa s'incrémente comme une liste donc on fait >
        students[_studentAddress].numberOfGrades++;
    }
     // func pour récupéré sous la forme d'un tableau les notes d'un élève (uint[] memory.
    function getGrades(address _studentAddress) public view returns (uint[] memory) { 
        require(msg.sender == owner, "Not the owner");
        // pour récupéré la note des élèves
        uint numberGradesThisStudent = students[_studentAddress].numberOfGrades;
        // il faut créé le tableau et la taille du tableau > le new uint prend en argument > (numberGradesThisStudent);
        // pour la taille du tableau
        uint[] memory grades = new uint[](numberGradesThisStudent);

        for(uint i = 0 ; i < numberGradesThisStudent ; i++) {
            grades[i] = students[_studentAddress].grades[i].grade;
            // donc le uint i est la pour incrémenté le collecte des notes, c'est un index qui s'incrémente
        }
        return grades;

    }


}