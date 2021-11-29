var authToken = "i8k0j9xr9uk1bmrlx7j6";
const  express =  require("express");
const router = express.Router();
const superroute = require("./controller");


    router.get("/", superroute.welcome);
    router.get("/allProducts", superroute.apigetAllProducts);
    router.get("/productById/:id", superroute.apigetProductById);
    router.put("/update/:id", superroute.apiupdateProductAantal);
    router.get("/stores", superroute.apigetAllStores);
    router.get("/storeById/:id", superroute.apigetStoreById);
    router.get("/getAssortiment/:id", superroute.apigetStoreAssortiment);
    router.put("/updateProductNaam/:winkelId/:productId", superroute.apiupdateproductNaam);
    router.put("/updateProductPrijs/:winkelId/:productId", superroute.apiupdateproductPrijs);

module.exports = router;