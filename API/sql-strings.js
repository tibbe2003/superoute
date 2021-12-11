module.exports = {
    getStores: `SELECT store.storeId, store.storeName, store.storeAdres, logos.logoAdres 
                FROM store 
                INNER JOIN logos ON store.storeLogoId=logos.logoId`,

    getStoreById: function(id) {
        return `SELECT store.storeId, store.storeName, store.storeAdres, logos.logoAdres 
                FROM store 
                INNER JOIN logos ON store.storeLogoId=logos.logoId 
                WHERE storeId = ${id}`;
    },

    getStoreAssortiment: function(id) {
        return `SELECT shelf.storeId, shelf.shelfId, product.productId, product.productName, product.productStock, product.productPrice, product.error, product.productPicture, product.productWeight, categories.categoryName, shelf.shelfLocation
                FROM shelf
                INNER JOIN product ON shelf.productId=product.productId
                INNER JOIN categories ON shelf.categoryId=categories.categoryId
                WHERE storeId = ${id}`;
    },

    updateProductDetails: function(storeId, productId, productName, productPrice) {
        if(productName == undefined && productPrice == undefined) {
            return
        } else if (productName == undefined) {
            return `UPDATE product p
                INNER JOIN shelf s ON p.productId=s.productId
                SET productPrice = '${productPrice}'
                WHERE s.storeId = ${storeId} && p.productId = ${productId}`;
        } else if (productPrice == undefined) {
            return `UPDATE product p
                INNER JOIN shelf s ON p.productId=s.productId
                SET productName = '${productName}'
                WHERE s.storeId = ${storeId} && p.productId = ${productId}`;
        } else {
            return `UPDATE product p
                INNER JOIN shelf s ON p.productId=s.productId
                SET productName = '${productName}', productPrice = '${productPrice}'
                WHERE s.storeId = ${storeId} && p.productId = ${productId}`;
        }
    },

    addNewProduct(storeId, productName, productPrice, productPicture) {
        return `INSERT INTO product (productName, productPrice, productPicture)
                VALUES ('${productName}','${productPrice}', '${productPicture}')`;
    },

    getLooseProducts(storeId) {
        return `SELECT product.*, shelf.shelfId
                FROM product
                LEFT JOIN shelf on product.productId=shelf.productId
                WHERE shelfId IS null`
    },

    getLooseShelfs(storeId) {
        return `SELECT shelf.shelfId, categories.categoryName, shelf.shelfLocation
                FROM shelf
                INNER JOIN categories ON shelf.categoryId=categories.categoryId
                WHERE storeId = ${storeId} && productId IS null`
    },

    linkProduct(storeId, shelfId, productId) {
        return `UPDATE shelf
                SET productId = ${productId}
                WHERE storeId = ${storeId} && shelfId = ${shelfId}`
    },

    unlinkProduct(storeId, shelfId) {
        return `UPDATE shelf
                SET productId = 0
                WHERE storeId = ${storeId} && shelfId = ${shelfId}`
    },

    productDetails(storeId, productId) {
        return `SELECT * from product
                WHERE productId = ${productId}`
    },

    updateStock(storeId, productId, aantal) {
        return `UPDATE product
                SET productStock = '${aantal}'
                WHERE productId = ${productId}`
    },

    getCategories: `SELECT * FROM categories`,

    recalibration(storeId, shelfId) {
        return `UPDATE shelf
                SET recalibration = 1
                WHERE storeId = ${storeId} && shelfId = ${shelfId}`
    },

    getRecalibration(storeId) {
        return `SELECT shelf.*, product.productName
                FROM shelf
                INNER JOIN product ON product.productId = shelf.productId
                WHERE storeId = ${storeId} && recalibration = 1`
    },
}