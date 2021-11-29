const winkels = [
    {
        "id":1,
        "winkel_naam": "jumbo hoofdstraat",
        "winkel_logo": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facebook.com%2Fjumbosupermarkten%2F&psig=AOvVaw2yN1LQA1cOJyWHRkf1Mlyl&ust=1638226094956000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPiR5PWRvPQCFQAAAAAdAAAAABAD"
    },
    {
        "id":2,
        "winkel_naam": "plus eindhoven",
        "winkel_logo": "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.distrifood.nl%2Fformules%2Fnieuws%2F2016%2F08%2Fzorg-plus-om-logomisbruik-ondernemers-10199883&psig=AOvVaw14tZ60_hDCY02ISbs4bXK3&ust=1638226212166000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMD54q2SvPQCFQAAAAAdAAAAABAD"
    }
]

const schappen = [
    {
        "winkelId":1,
        "id":1,
        "categorie":"AGF",
        "productNaam":"Bloemkool",
        "productAantal":8,
        "productPrijs":2.50,
        "schaplocatie":"1.3.3.5"
    },
    {
        "winkelId":1,
        "id":2,
        "categorie":"VVP",
        "productNaam":"achterham",
        "productAantal":14,
        "productPrijs":2.75,
        "schaplocatie":"2.6.2.8"
    },
    {
        "winkelId":1,
        "id":3,
        "categorie":"Brood",
        "productNaam":"stokbrood-gesneden",
        "productAantal":4,
        "productPrijs":1.00,
        "schaplocatie":"3.1.1.4"
    },
    {
        "winkelId":2,
        "id":1,
        "categorie":"DKW",
        "productNaam":"cola-blik-150ml",
        "productAantal":24,
        "productPrijs":1.20,
        "schaplocatie":"2.4.6.4"
    },
    {
        "winkelId":2,
        "id":2,
        "categorie":"Vriezer",
        "productNaam":"gakpo-garnalen-1kg",
        "productAantal":13,
        "productPrijs":5.80,
        "schaplocatie":"1.4.7.5"
    },
    {
        "winkelId":2,
        "id":3,
        "categorie":"AGF",
        "productNaam":"watermeloen",
        "productAantal":7,
        "productPrijs":3.20,
        "schaplocatie":"3.1.1.4"
    },
    {
        "winkelId":2,
        "id":4,
        "categorie":"404",
        "productNaam":"404",
        "productAantal":404,
        "productPrijs":404,
        "schaplocatie":"3.1.1.4"
    },
]

const { json } = require('body-parser');
const e = require('express');
var conn = require('./db.config');

module.exports = class superroute_controller {

    static async welcome(req, res) {
        return res.status(200).json({"Message": "Welcome to Superroute API. Find your best way thrue your local supermarket"});
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

    static async apigetAllStores(req, res) {
        let id = req.params.id;

        if(id == undefined) {
            return res.status(200).send(winkels);
        } else {
            return res.status(200).json(winkels[id-1]);
        }
    }

    static async apigetStoreAssortiment(req, res) {
        let id = req.params.id;

        let result = schappen.filter(a => a.winkelId == id);

        res.status(200).json(result);
    }

    static async apiupdateproductNaam(req, res) {
        let winkelId = req.params.winkelId;
        let productId = req.params.productId;

        //kijken naar hoe er optionele parameters verzonden kunnen worden. en wanneer ze niet gestuurd worden gebeurt er niks
        let productNaam = req.body.productNaam || "";
        // let productPrijs = req.body.productPrijs || "";

        for (var i = 0; i < schappen.length; i++) {
            if (schappen[i].winkelId == winkelId && schappen[i].id == productId) {
              schappen[i].productNaam = productNaam;
              return res.status(200).send(true);
            } else {
                return res.status(404).send(false);
            }
        }
    }

    static async apiupdateproductPrijs(req, res) {
        let winkelId = req.params.winkelId;
        let productId = req.params.productId;

        //kijken naar hoe er optionele parameters verzonden kunnen worden. en wanneer ze niet gestuurd worden gebeurt er niks
        let productPrijs = req.body.productPrijs || "";

        for (var i = 0; i < schappen.length; i++) {
            if (schappen[i].winkelId == winkelId && schappen[i].id == productId) {
              schappen[i].productPrijs = productPrijs;
              return res.status(200).send(true);
            } else {
                return res.status(404).send(false);
            }
        }
    }

    static async apiAssignProductToShelf(req, res) {
        //Een nieuw product aan een schap toewijzen
    }

}