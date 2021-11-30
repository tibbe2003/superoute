const { json } = require('body-parser');
const e = require('express');
var conn = require('./db.config');
var sql = require('./sql-strings');

module.exports = class superroute_controller {

    static async welcome(req, res) {
        return res.status(200).json({"Message": "Welcome to Superroute API. Find your best way thrue your local supermarket"});
    }

    //get all stores
    static async getAllStores(req, res) {
        conn.query(sql.getStores, function (err, result) {
            if (err) {
                console.log(err);
                return res.status(500).send({"error":"There was an unexpected error"});
            } else {
                return res.status(200).json(result);
            }
        });
    }

    //get store by id
    static async getStoreById(req, res) {
        let id = req.params.id;

        conn.query(sql.getStoreById(id), function (err, result) {
            if (err) {
                console.log(err);
                return res.status(500).send({"error":"There was an unexpected error"});
            } else {
                return res.status(200).json(result);
            }
        });
    }

    //Get winkel assortiment
    static async getWinkelAssortiment(req, res) {
        let id = req.params.id;

        conn.query(sql.getStoreAssortiment(id), function (err, result) {
            if (err) {
                console.log(err);
                return res.status(500).send({"error":"This is not a valid store id"});
            } else {
                return res.status(200).json(result);
            }
        });
    }

    //edit product details
    static async editProductDetails(req, res) {
        let winkelId = req.params.winkelId;
        let productId = req.params.productId;

        let productNaam = req.body.productNaam || undefined;
        let productPrijs = req.body.productPrijs || undefined;

        conn.query(sql.updateProductDetails(winkelId, productId, productNaam, productPrijs), function (err, result) {
            if(err) {
                console.log(err);
                console.log(winkelId, productNaam);
                return res.status(304).send({"error":"There was an unexpected error"});
            } else {
                return res.status(200).send({"succes":"the requested columns are changed"});
            }
        });
    }

    //Add new product
    static async addNewProduct(req, res) {
        let winkelId = req.params.winkelId;

        let productNaam = req.body.productNaam;
        let productPrijs = req.body.productPrijs;
        let productFoto = req.body.productPrijs;

        if(productNaam == undefined || productPrijs == undefined || productFoto == undefined) {
            return res.status(409).send({"error":"Please fill in all necesery fields! for these fields, look at the documentation"});
        } else {
            conn.query(sql.addNewProduct(productNaam, productPrijs, productFoto), function (err, result) {
                if(err) {
                    return res.status(500).send({"error":"There was an unexpected error"});
                } else {
                    return res.status(201).send({"succes":"New product has been added"});
                }
            });
        }
    }

    //get losse prodcuten
    static async losseProducten(req, res) {
        let winkelId = req.params.winkelId;

        conn.query(sql.getLosseProducten(winkelId), function (err, result) {
            if(err) {
                console.log(err);
                return res.status(500).send({"error":"There was an unexpected error"});
            } else {
                return res.status(200).send(result);
            }
        })
    }

    //get losse schappen
    static async losseSchappen(req, res){
        let winkelId = req.params.winkelId;

        conn.query(sql.getLosseSchappen(winkelId), function (err, result) {
            if(err) {
                return res.status(500).send({"error":"There was an unexpected error"});
            } else {
                return res.status(200).send(result);
            }
        })
    }

    //product koppelen schap 7, product 6
    static async koppelProduct(req, res) {
        let winkelId = req.params.winkelId;

        let schapId = req.body.schapId;
        let productId = req.body.productId;

        conn.query(sql.koppelProduct(winkelId, schapId, productId), function (err, result) {
            if(err) {
                console.log(err);
                return res.status(500).send({"error":"Something went wrong"});
            } else {
                return res.status(200).send(result);
            }
        })
    }

    static async apigetAllProducts(req, res) {
        conn.query("SELECT * FROM voorraad", function (err, result) {
            if(err) {
                return res.status(500).send({"error":"There was an unexpected error"});
            } else {
                return res.status(200).json(result);
            }
        });
    }

    static async apigetProductById(req, res) {
        let id = req.params.id;

        conn.query("SELECT * FROM voorraad WHERE productId = ?", id, function (err, result) {
            if(err) {
                console.log({"error":err});
                return res.status(404).json(err);
            } else {
                return res.status(200).json(result);
            }
        });
    }

    static async apiupdateProductAantal(req, res) {
        let id = req.params.id;
        let aantal = req.body.aantal;

        if(aantal == null) {
            return err = ({"Error":"Please fill in all nesecery fields"});
        } if(isNaN(aantal)) {
            return err = ({"Error ":"Invalid amount filed in"});
        }

        conn.query("UPDATE voorraad SET productAantal = ? WHERE productId = ?", [aantal, id], function(err, result) {
            if(err) {
                res.status(404).json(err);
            } else {
                return res.status(200).json({"Succes": `amount has been changed to ${aantal}`});
            }
        });
    }

    static async apiAssignProductToShelf(req, res) {
        //Een nieuw product aan een schap toewijzen
    }

}