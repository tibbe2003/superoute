var authToken = "i8k0j9xr9uk1bmrlx7j6";
const  express =  require("express");
const router = express.Router();
const superroute = require("./controller");

    router.get("/", superroute.welcome);
    router.get("/stores", superroute.getAllStores);
    router.get("/stores/:id", superroute.getStoreById);
    router.get("/getAssortiment/:id", superroute.getWinkelAssortiment);
    router.put("/product/:winkelId/:productId", superroute.editProductDetails);
    router.post("/addProduct/:winkelId", superroute.addNewProduct);
    router.get("/losseProducten/:winkelId", superroute.losseProducten);
    router.get("/losseSchappen/:winkelId", superroute.losseSchappen);
    router.post("/koppelProduct/:winkelId", superroute.koppelProduct);

    router.get("/allProducts", superroute.apigetAllProducts);
    router.get("/productById/:id", superroute.apigetProductById);
    router.put("/update/:id", superroute.apiupdateProductAantal);

module.exports = router;