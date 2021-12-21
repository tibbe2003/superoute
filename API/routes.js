var authToken = "i8k0j9xr9uk1bmrlx7j6";
const  express =  require("express");
const router = express.Router();
const superroute = require("./controller");

//#region V1 
    router.get("/v1/", superroute.welcome);
    router.get("/v1/stores", superroute.getAllStores);
    router.get("/v1/stores/:id", superroute.getStoreById);
    router.get("/v1/getAssortiment/:id", superroute.getWinkelAssortiment);
    router.put("/v1/product/:storeId/:productId", superroute.editProductDetails);
    router.post("/v1/addProduct/:winkelId", superroute.addNewProduct);
    router.get("/v1/losseProducten/:winkelId", superroute.losseProducten);
    router.get("/v1/losseSchappen/:winkelId", superroute.losseSchappen);
    router.post("/v1/koppelProduct/:winkelId", superroute.koppelProduct);
    router.delete("/v1/koppelProduct/:winkelId/:schapId", superroute.ontkoppelProduct);
    router.get("/v1/product/:winkelId/:productId", superroute.getProductById);
    router.put("/v1/updateVoorraad/:winkelId/:productId", superroute.updateProductAantal);
    router.get("/v1/categorien", superroute.getCategories);
//#endregion
//#region V2
    router.get("/v2/", superroute.welcome);
    router.get("/v2/stores", superroute.getAllStores);
    router.get("/v2/stores/:id", superroute.getStoreById);
    router.get("/v2/getProductRange/:id", superroute.getProductRange);
    router.put("/v2/product/:storeId/:productId", superroute.editProductDetails);
    router.post("/v2/addProduct/:winkelId", superroute.addNewProduct);
    router.get("/v2/looseProducts/:storeId", superroute.looseProducts);
    router.get("/v2/looseShelfs/:storeId", superroute.looseShelfs);
    router.post("/v2/linkProduct/:storeId", superroute.linkProduct);
    router.delete("/v2/linkProduct/:storeId/:shelfId", superroute.unlinkProduct);
    router.get("/v2/product/:storeId/:productId", superroute.getProductById);
    router.put("/v2/updateStock/:storeId/:productId", superroute.updateProductAmount);
    router.get("/v2/categories", superroute.getCategories);
    router.put("/v2/recalibration/:storeId/:shelfId", superroute.recalibration);
    router.get("/v2/recalibration/:storeId", superroute.getRecalibration);
    router.get("/v2/getProductDetails/:storeId/:productId", superroute.getProductDetail);
//#endregion

module.exports = router;