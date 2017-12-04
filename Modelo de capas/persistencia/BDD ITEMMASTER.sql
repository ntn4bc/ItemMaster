CREATE DATABASE ItemMaster DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE ItemMaster;

CREATE TABLE Heroe (
	IdHeroe INT AUTO_INCREMENT NOT NULL,
	nombreHeroe VARCHAR (100) NOT NULL,
	IdTipoHeroe INT NOT NULL,
    IdRazaHeroe INT NOT NULL,
    IdRoll INT NOT NULL,
    IdEqph INT NOT NULL,
	PRIMARY KEY(IdHeroe)
);

CREATE TABLE ArmaGrande (
	IdArmaG INT AUTO_INCREMENT NOT NULL,
	nombreArma VARCHAR (100) NOT NULL,
	tipoArma VARCHAR (100) NOT NULL,
	nivelArma VARCHAR (100) NOT NULL,
	PRIMARY KEY(IdArmaG)
);

CREATE TABLE ArmaPeq (
	IdarmaP INT AUTO_INCREMENT NOT NULL,
	nombreArma VARCHAR (100) NOT NULL,
	nipoArma VARCHAR (100) NOT NULL,
	nivelArma VARCHAR (100) NOT NULL,
	PRIMARY KEY(IdArmaP)
);

CREATE TABLE Roll (
	IdRoll INT AUTO_INCREMENT NOT NULL,
	nombreRoll VARCHAR (100) NOT NULL,
	tipoRoll VARCHAR (100) NOT NULL,
	nivelRoll VARCHAR (100) NOT NULL,
	PRIMARY KEY(IdRoll)
);

CREATE TABLE Armadura (
	IdArmadura INT AUTO_INCREMENT NOT NULL,
	nombreArmadura VARCHAR (100) NOT NULL,
	tipoArmadura VARCHAR (100) NOT NULL,
	nivelArmadura VARCHAR (100) NOT NULL,
	PRIMARY KEY(IdArmadura)
);

CREATE TABLE Raza (
	IdRaza INT AUTO_INCREMENT NOT NULL,
	IdRazaHeroe INT NOT NULL,
    nombreRaza VARCHAR (100) NOT NULL,
	PRIMARY KEY(IdRaza)
);

CREATE TABLE Tipo (
	IdTipo INT AUTO_INCREMENT NOT NULL,
	nombreTipoHeroe INT NOT NULL,
	PRIMARY KEY(IdTipo)
);

CREATE TABLE EquipHeroe (
    IdEqph INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    IdCab INT NOT NULL,
    IdHom INT NOT NULL,
    IdPec INT NOT NULL,
    IdPie INT NOT NULL,
    IdBot INT NOT NULL,
    IdArma1 INT NOT NULL,
    IdArma2 INT NOT NULL
);

ALTER TABLE EquipHeroe ADD CONSTRAINT a1 FOREIGN KEY (IdCab) REFERENCES Armadura (IdArmadura);
ALTER TABLE EquipHeroe ADD CONSTRAINT a2 FOREIGN KEY (IdHom) REFERENCES Armadura (IdArmadura);
ALTER TABLE EquipHeroe ADD CONSTRAINT a3 FOREIGN KEY (IdPec) REFERENCES Armadura (IdArmadura);
ALTER TABLE EquipHeroe ADD CONSTRAINT a4 FOREIGN KEY (IdPie) REFERENCES Armadura (IdArmadura);
ALTER TABLE EquipHeroe ADD CONSTRAINT a5 FOREIGN KEY (IdBot) REFERENCES Armadura (IdArmadura);
ALTER TABLE EquipHeroe ADD CONSTRAINT a6 FOREIGN KEY (IdArma1) REFERENCES ArmaGrande (IdArmaG);
ALTER TABLE EquipHeroe ADD CONSTRAINT a7 FOREIGN KEY (IdArma2) REFERENCES ArmaPeq (IdArmaP);

ALTER TABLE Heroe ADD CONSTRAINT h1 FOREIGN KEY (IdRoll) REFERENCES Roll (IdRoll);
ALTER TABLE Heroe ADD CONSTRAINT h2 FOREIGN KEY (IdEqph) REFERENCES EquipHeroe (IdEqph);

ALTER TABLE Heroe ADD CONSTRAINT h3 FOREIGN KEY (IdTipoHeroe) REFERENCES Tipo(IdTipo);
ALTER TABLE Heroe ADD CONSTRAINT h4 FOREIGN KEY (IdRazaHeroe) REFERENCES Raza(IdRaza);