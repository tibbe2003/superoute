DROP TABLE IF EXISTS winkel, logos, categorien, schap, product CASCADE;

CREATE TABLE logos (

    logoId INT NOT NULL AUTO_INCREMENT,
    logoAdres VARCHAR(255),
    logoName VARCHAR(255),

    PRIMARY KEY(logoId)
);

insert into logos (logoAdress, logoName) values ('https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Jumbo_Logo.svg/1200px-Jumbo_Logo.svg.png', 'Jumbo supermarkten');
insert into logos (logoAdress, logoName) values ('https://seeklogo.com/images/P/plus-supermarkt-logo-5C785E7A8A-seeklogo.com.pngg', 'Plus supermarkten');
insert into logos (logoAdress, logoName) values (' https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Albert_Heijn_Logo.svg/1000px-Albert_Heijn_Logo.svg.png', 'Albert heijn');


CREATE TABLE store (

    storeId INT NOT NULL AUTO_INCREMENT,
    storeName varchar(255),
    storeAdres VARCHAR(255),
    storeLogoId INT,

    PRIMARY KEY(storeId),
    CONSTRAINT fk_logo
        FOREIGN KEY (storeLogoId) 
        REFERENCES logos(logoId)
);

insert into store (storeName, storeAdress, storeLogoId) values ('Jumbo victoriapark','Victoriapark 90, 5611BM, eindhoven','1');
insert into store (storeName, storeAdress, storeLogoId) values ('AH woenselse markt','woenselse markt 5, 5612CP, eindhoven','3');
insert into store (storeName, storeAdress, storeLogoId) values ('Plus bouwman','Zeilbergsestraat 46-48, 5751 LL Deurne','2');


CREATE TABLE categories (

    categoryId INT NOT NULL AUTO_INCREMENT,
    categoryName varchar(50),

    PRIMARY KEY(categoryId)
);

insert into categories (categoryName) values ('agf');
insert into categories (categoryName) values ('vvp');
insert into categories (categoryName) values ('tapas');
insert into categories (categoryName) values ('non-food');
insert into categories (categoryName) values ('vriezer');
insert into categories (categoryName) values ('chips');


CREATE TABLE product (

    productId INT NOT NULL AUTO_INCREMENT,
    productName varchar(100) NOT NULL,
    productStock INT,
    productPrice FLOAT NOT NULL,
    error INT,
    productPicture VARCHAR(255),
    productWeight INT,

    PRIMARY KEY(productId)
);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('',0,4.20,0,'',400);

insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('Jumbo komkommer',0,1.85,0,'https://static-images.jumbo.com/product_images/090920202358_302238STK-1_360x360_2.png',60);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('Tommies Snack Tomaatjes 500g',0,3.50,0,'https://static-images.jumbo.com/product_images/110520190033_172875EM-1_360x360_2.png',500);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('Jumbo Achterham 100g',0,2.10,0,'https://static-images.jumbo.com/product_images/160120202336_338268KGR-1_360x360_2.png',100);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('Jumbo Jong Belegen Kaas 48+ Plakken 400 g',0,4.20,0,'https://static-images.jumbo.com/product_images/140920190454_203773STK-1_360x360_2.png',400);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('Jumbo Albondigas 215g',0,3.00,0,'https://static-images.jumbo.com/product_images/141020211353_452283BAK-1_360x360_2.png',215);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('Jumbo Pesto Pittig 100g',0,2.50,0,'https://static-images.jumbo.com/product_images/040920211722_442882CUP-1_360x360_2.png',100);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('Jumbo Kleur Geconcentreerd Vloeibaar Wasmiddel 40 wasbeurten 2, 2L',0,4.60,0,'https://static-images.jumbo.com/product_images/090520192125_200861FLS-1_360x360_2.png',1000);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('DryNites Absorberende Nachtbroekjes Boys - 4 tot 7 Jaar',0,7.00,0,'https://static-images.jumbo.com/product_images/220420210453_344249PAK-9_360x360_2.png',800);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('Jumbo Wok Garnalen 300g',0,6.10,0,'https://static-images.jumbo.com/product_images/110520192048_214709ZK-1_360x360_2.png',300);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('Dr. Oetker Ristorante Pizza Hawaii 355g',0,2.00,0,'https://static-images.jumbo.com/product_images/310120201018_978434DS-1_360x360_2.png',355);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('Cheetos Nibb-it Sticks Naturel Chips 150gr',0,2.00,0,' https://static-images.jumbo.com/product_images/050220210418_196235STK-1_360x360_2.png',150);
insert into product (productName, productStock, productPrice, error, productPicture, productWeight) values ('Doritos Nacho Cheese Tortilla Chips 272gr',0,2.20,0,'https://static-images.jumbo.com/product_images/290920210224_196239STK-1_360x360_2.png',272);


CREATE TABLE shelf (
    shelfId INT NOT NULL AUTO_INCREMENT,
    storeId INT NOT NULL,
    categoryId INT NOT NULL,
    productId INT,
    shelfLocation VARCHAR(20),
    recalibration INT NOT NULL,

    PRIMARY KEY(shelfId),
    CONSTRAINT fk_store
        FOREIGN KEY (storeId) 
        REFERENCES store(storeId),
    CONSTRAINT fk_category
        FOREIGN KEY (categoryId) 
        REFERENCES categories(categoryId),
    CONSTRAINT product
        FOREIGN KEY (productId) 
        REFERENCES  product(productId)
);

insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 1, 1, '1.2.2.1', 0);
insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 1, 2, '1.3.3.1', 0);
insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 2, 3, '2.4.6.3', 1);
insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 2, 4, '2.5.1.5', 0);
insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 3, 5, '3.5.5.5', 0);
insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 3, 6, '3.4.7.2', 1);
insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 4, 7, '4.1.3.4', 0);
insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 4, 8, '4.1.3.7', 0);
insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 5, 9, '5.1.2.1', 0);
insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 5, 10, '5.1.2.3', 0);
insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 6, 11, '6.3.6.3', 0);
insert into shelf (storeId, categoryId, productId, shelfLocation, recalibration) values (3, 6, 12, '6.1.1.6', 0);









