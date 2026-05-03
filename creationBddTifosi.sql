SET default_storage_engine = InnoDB;

CREATE Database IF NOT EXISTS `Tifosi`collate utf8mb4_general_ci;
USE `Tifosi`;

DROP TABLE IF EXISTS `Ingredient`;
CREATE TABLE IF NOT EXISTS `Ingredient` (
id INT NOT NULL AUTO_INCREMENT ,
nom VARCHAR(50),
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS `Foccacia`;
CREATE TABLE IF NOT EXISTS `Foccacia` (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50),
prix DECIMAL (5,2),
PRIMARY KEY (id)

);
DROP TABLE IF EXISTS `Foccacia_Ingredient`;
CREATE TABLE IF NOT EXISTS `Foccacia_Ingredient` (
id_Foccacia INT NOT NULL ,
id_Ingredient INT NOT NULL,
PRIMARY KEY (id_Foccacia, id_Ingredient)

);
ALTER TABLE Foccacia_Ingredient ADD CONSTRAINT fk_Foccacia FOREIGN KEY (id_Foccacia) REFERENCES Foccacia(id),
ALTER TABLE Foccacia_Ingredient ADD CONSTRAINT fk_Ingredient FOREIGN KEY (id_Ingredient) REFERENCES Ingredient(id)
 
 DROP TABLE IF EXISTS `Client`;
CREATE TABLE IF NOT EXISTS `Client` (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50),
email VARCHAR (50),
code_postal INT,
PRIMARY KEY (id),
KEY email (email)
);

DROP TABLE IF EXISTS `Marque`;
CREATE TABLE IF NOT EXISTS `Marque` (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50),
PRIMARY KEY (id)
);


DROP TABLE IF EXISTS `Boisson`;
CREATE TABLE IF NOT EXISTS `Boisson` (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50),
id_Marque INT NOT NULL,
PRIMARY KEY (id)

);
ALTER TABLE Boisson
ADD CONSTRAINT fk_boisson_marque FOREIGN KEY (id_Marque) REFERENCES Marque(id);


DROP TABLE IF EXISTS `Menu`;
CREATE TABLE IF NOT EXISTS `Menu` (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50),
prix DECIMAL (5,2),
id_CLient INT NOT NULL,
id_Boisson INT NOT NULL,
id_Foccacia INT NOT NULL,
PRIMARY KEY (id)
);
ALTER TABLE Menu ADD CONSTRAINT fk_menu_boisson FOREIGN KEY (id_Boisson) REFERENCES Boisson(id);
ALTER TABLE Menu ADD CONSTRAINT fk_menu_client FOREIGN KEY (id_Client) REFERENCES Client(id);
ALTER TABLE Menu ADD CONSTRAINT fk_menu_foccacia FOREIGN KEY (id_Foccacia) REFERENCES Foccacia(id);

