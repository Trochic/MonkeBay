// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

contract Utilisateur {
    string public adress;
    string public localisation;
    string public mail;
    string public tel;
    string public username;
    uint public nombreAnnonce;

    constructor(string memory _adress, string memory _localisation, string memory _mail, string memory _tel, string memory _username) {
        adress = _adress;
        localisation = _localisation;
        mail = _mail;
        tel = _tel;
        username = _username;
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

    constructor(string memory _titre, string memory _description, string memory _etat, uint _prix, Utilisateur _user, string memory _modeAcheminement, string memory _localisation) {
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
    event AnnonceCree(address createur, uint idAnnonce);

    //Créé nouvel utilisateur
    function nouvelUtilisateur(string memory _adress, string memory _localisation, string memory _mail, string memory _tel, string memory _username) public {
        Utilisateur newUser = new Utilisateur(_adress,_localisation,_mail,_tel,_username);
        listeUtilisateurs[msg.sender] = newUser;
    }
    
    //Créé nouvelle Annonce et fais les mises à jour des données
    function creerAnnonce(string memory _titre, string memory _description, string memory _etat, uint _prix, Utilisateur _user, string memory _modeAcheminement, string memory _localisation) public{
        Annonce newAnnonce = new Annonce(_titre,_description,_etat, _prix,_user,_modeAcheminement,_localisation);
        listeAnnonces[msg.sender][listeUtilisateurs[msg.sender].nombreAnnonce()] = newAnnonce;
        uint temp = listeUtilisateurs[msg.sender].nombreAnnonce();
        temp += 1;
        listeUtilisateurs[msg.sender].setNombreAnnonce(temp);
    }

    //Modifie une annonce
    function modifierAnnonce(uint indexAnnonce, string memory _titre, string memory _description, string memory _etat, uint _prix, string memory _modeAcheminement, string memory _localisation) public {
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