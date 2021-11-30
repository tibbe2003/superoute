module.exports = {
    getStores: `SELECT winkel.winkelId, winkel.winkelNaam, winkel.winkelAdres, logos.logoUrl 
                FROM winkel 
                INNER JOIN logos ON winkel.winkelLogoId=logos.logoId`,

    getStoreById: function(id) {
        return `SELECT winkel.winkelId, winkel.winkelNaam, winkel.winkelAdres, logos.logoUrl 
                FROM winkel 
                INNER JOIN logos ON winkel.winkelLogoId=logos.logoId 
                WHERE winkelId = ${id}`;
    },

    getStoreAssortiment: function(id) {
        return `SELECT schap.winkelId, schap.schapId, product.productId, product.productNaam, product.productAantal, product.productPrijs, product.error, product.productFoto, product.productGewicht, categorien.categorieNaam, schap.schapLocatie
                FROM schap
                INNER JOIN product ON schap.productId=product.productId
                INNER JOIN categorien ON schap.categorieId=categorien.categorieId
                WHERE winkelId = ${id}`;
    },

    updateProductDetails: function(winkelId, productId, productNaam, productPrijs) {
        if(productNaam == undefined && productPrijs == undefined) {
            return
        } else if (productNaam == undefined) {
            return `UPDATE product p
                INNER JOIN schap s ON p.productId=s.productId
                SET productPrijs = '${productPrijs}'
                WHERE s.winkelId = ${winkelId} && p.productId = ${productId}`;
        } else if (productPrijs == undefined) {
            return `UPDATE product p
                INNER JOIN schap s ON p.productId=s.productId
                SET productNaam = '${productNaam}'
                WHERE s.winkelId = ${winkelId} && p.productId = ${productId}`;
        } else {
            return `UPDATE product p
                INNER JOIN schap s ON p.productId=s.productId
                SET productNaam = '${productNaam}', productPrijs = '${productPrijs}'
                WHERE s.winkelId = ${winkelId} && p.productId = ${productId}`;
        }
    },

    addNewProduct(winkelId, productNaam, productPrijs, productFoto) {
        return `INSERT INTO product (productNaam, productPrijs, productFoto)
                VALUES ('${productNaam}','${productPrijs}', '${productFoto}')`;
    },

    getLosseProducten(winkelId) {
        return `SELECT product.*, schap.schapId
                FROM product
                LEFT JOIN schap on product.productId=schap.productId
                WHERE schapId IS null`
    },

    getLosseSchappen(winkelId) {
        return `SELECT schap.schapId, categorien.categorieNaam, schap.schapLocatie
                FROM schap
                INNER JOIN categorien ON schap.categorieId=categorien.categorieId
                WHERE winkelId = ${winkelId} && productId IS null`
    },

    koppelProduct(winkelId, schapId, productId) {
        return `UPDATE schap
                SET productId = ${productId}
                WHERE winkelId = ${winkelId} && schapId = ${schapId}`
    }
}