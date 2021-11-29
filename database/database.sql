DROP TABLE IF EXISTS winkel, logos, categorien, schap, product CASCADE;

CREATE TABLE logos (

    logoId INT NOT NULL AUTO_INCREMENT,
    logoUrl VARCHAR(255),

    PRIMARY KEY(logoId)
);

CREATE TABLE winkel (

    winkelId INT NOT NULL AUTO_INCREMENT,
    winkelNaam varchar(255),
    winkelAdres VARCHAR(255),
    winkelLogoId INT,

    PRIMARY KEY(winkelId),
    CONSTRAINT fk_logo
        FOREIGN KEY (winkelLogoId) 
        REFERENCES logos(logoId)
);

CREATE TABLE categorien (

    categorieId INT NOT NULL AUTO_INCREMENT,
    categorieNaam varchar(50),

    PRIMARY KEY(categorieId)
);

CREATE TABLE product (

    productId INT NOT NULL AUTO_INCREMENT,
    productNaam varchar(100) NOT NULL,
    productAantal INT,
    productPrijs INT NOT NULL,
    error INT,
    productFoto VARCHAR(255),
    productGewicht INT,

    PRIMARY KEY(productId)
);

insert into schap (winkelId, categorieId, productId, schapLocatie) values (3, 1, 1, '1.2.2.1');

CREATE TABLE schap (
    schapId INT NOT NULL AUTO_INCREMENT,
    winkelId INT NOT NULL,
    categorieId INT NOT NULL,
    productId INT,
    schapLocatie VARCHAR(20),

    PRIMARY KEY(schapId),
    CONSTRAINT fk_winkel
        FOREIGN KEY (winkelId) 
        REFERENCES winkel(winkelId),
    CONSTRAINT fk_categorie
        FOREIGN KEY (categorieId) 
        REFERENCES categorien(categorieId),
    CONSTRAINT product
        FOREIGN KEY (productId) 
        REFERENCES  product(productId)
);