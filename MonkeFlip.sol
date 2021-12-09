// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

contract Utilisateur {
    address public adress;
    string public localisation;
    string public mail;
    string public tel;
    string public username;
    uint public nombreAnnonce;
    bool public registered;

    constructor(address _adress, string memory _localisation, string memory _mail, string memory _tel, string memory _username) {
        adress = _adress;
        localisation = _localisation;
        mail = _mail;
        tel = _tel;
        username = _username;
        registered = true;
        nombreAnnonce=0;
    }

    //Pour changer le nombre d'annonces
    function setNombreAnnonce(uint nb) public {
        nombreAnnonce = nb;
    }
}

contract Annonce {
    string public titre;
    string public description;
    string public etat;
    uint public prix;
    string public localisation;
    string public modeAcheminement;
    Utilisateur public user;

    constructor(Utilisateur _user, string memory _titre, string memory _description, string memory _etat, uint _prix, string memory _modeAcheminement, string memory _localisation) {
        titre = _titre;
        description = _description;
        etat = _etat;
        prix = _prix;
        localisation = _localisation;
        modeAcheminement = _modeAcheminement;
        user = _user;
    }

    //Modifie une annonce
    function modifierAnnonce(string memory _titre, string memory _description, string memory _etat, uint _prix, string memory _modeAcheminement, string memory _localisation) public {
        titre = _titre;
        description = _description;
        etat = _etat;
        prix = _prix;
        localisation = _localisation;
        modeAcheminement = _modeAcheminement;
    }

}

contract MonkeFlip{

    mapping(address => Utilisateur) public listeUtilisateurs;
    mapping(address => mapping(uint => Annonce)) public listeAnnonces;
    mapping(address => bool) utilisateurExiste;
    event AnnonceCree(address createur, uint idAnnonce);

    modifier isRegistered() {
        require(utilisateurExiste[msg.sender], "Vous n'etes pas enregistre");
        _;
    }

    function test(string memory hello) public view isRegistered returns(string memory){
        return hello;
    }

    //Créé nouvel utilisateur
    function nouvelUtilisateur(string memory _localisation, string memory _mail, string memory _tel, string memory _username) public {
        Utilisateur newUser = new Utilisateur(msg.sender,_localisation,_mail,_tel,_username);
        utilisateurExiste[msg.sender]=true;
        listeUtilisateurs[msg.sender] = newUser;
    }
    
    //Créé nouvelle Annonce et fais les mises à jour des données
    function creerAnnonce(string memory _titre, string memory _description, string memory _etat, uint _prix, string memory _modeAcheminement, string memory _localisation) isRegistered public{
        require(_prix>0,"Le prix doit etre superieur a 0");
        Annonce newAnnonce = new Annonce(listeUtilisateurs[msg.sender],_titre,_description,_etat, _prix,_modeAcheminement,_localisation);
        listeAnnonces[msg.sender][listeUtilisateurs[msg.sender].nombreAnnonce()] = newAnnonce;
        listeUtilisateurs[msg.sender].setNombreAnnonce(listeUtilisateurs[msg.sender].nombreAnnonce()+1);
    }

    //Modifie une annonce
    function modifierAnnonce(uint indexAnnonce, string memory _titre, string memory _description, string memory _etat, uint _prix, string memory _modeAcheminement, string memory _localisation) isRegistered public {
        listeAnnonces[msg.sender][indexAnnonce].modifierAnnonce(_titre,_description,_etat, _prix,_modeAcheminement,_localisation);
    }

    /*
        ModifierAnnonce
        CreerEnchere
        ModifierEnchere
        SupprimerEnchere
        Messagerie
    */
}