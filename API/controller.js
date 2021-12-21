const { json } = require('body-parser');
const e = require('express');
var conn = require('./db.config');
var sql = require('./sql-strings');

module.exports = class superroute_controller {

    static async welcome(req, res) {
        return res.status(200).json({"Message": "Welcome to Superroute API. Find your best way thrue your local supermarket"});
    }

//#region Version 1
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

        conn.query(sql.getLooseProducts(winkelId), function (err, result) {
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

        conn.query(sql.getLooseShelfs(winkelId), function (err, result) {
            if(err) {
                return res.status(500).send({"error":"There was an unexpected error"});
            } else {
                return res.status(200).json(result);
            }
        })
    }

    //product koppelen schap 7, product 6
    static async koppelProduct(req, res) {
        let winkelId = req.params.winkelId;

        let schapId = req.body.schapId;
        let productId = req.body.productId;

        conn.query(sql.linkProduct(winkelId, schapId, productId), function (err, result) {
            if(err) {
                console.log(err);
                return res.status(500).send({"error":"Something went wrong"});
            } else {
                return res.status(200).send({"succes":"product succesfully koppeld"});
            }
        });
    }

    //product ontkoppelen
    static async ontkoppelProduct(req, res) {
        let winkelId = req.params.winkelId;
        let schapId = req.params.schapId;

        conn.query(sql.unlinkProduct(winkelId, schapId), function (err, result) {
            if(err) {
                console.log(err);
                return res.status(500).send({"error":"Something went wrong, please check your paramters"});
            } else {
                return res.status(200).send({"succes":"product succesfully ontkoppeld"});
            }
        });
    }

    //product details
    static async getProductById(req, res) {
        let winkelId = req.params.winkelId;
        let productId = req.params.productId;

        conn.query(sql.productDetails(winkelId, productId), function (err, result) {
            if(err) {
                console.log(err);
                return res.status(500).json(err);
            } else {
                return res.status(200).json(result);
            }
        });
    }

    static async updateProductAantal(req, res) {
        let winkelId = req.params.winkelId;
        let productId = req.params.productId;
        let aantal = req.body.aantal;

        conn.query(sql.updateStock(winkelId, productId, aantal), function(err, result) {
            if(err) {
                console.log(err);
                res.status(500).send({"error":"Something went wrong"});
            } else {
                return res.status(200).json({"Succes": `amount has been changed to ${aantal}`});
            }
        });
    }

    static async getCategories(req, res) {
        conn.query(sql.getCategories, function (err, result) {
            if (err) {
                res.status(500).send({"error":"there was an unexpected error"});
            } else {
                res.status(200).json(result);
            }
        })
    }

//#endregion
//#region Version 2
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
static async getProductRange(req, res) {
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
    let storeId = req.params.storeId;
    let productId = req.params.productId;

    let productName = req.body.productName || undefined;
    let productPrice = req.body.productPrice || undefined;

    conn.query(sql.updateProductDetails(storeId, productId, productName, productPrice), function (err, result) {
        if(err) {
            console.log(err);
            return res.status(304).send({"error":"There was an unexpected error"});
        } else {
            return res.status(200).send({"succes":"the requested columns are changed"});
        }
    });
}

//Add new product
static async addNewProduct(req, res) {
    let storeId = req.params.storeId;

    let productName = req.body.productName;
    let productPrice = req.body.productPrice;
    let productPicture = req.body.productPicture;

    if(productName == undefined || productPrice == undefined || productPicture == undefined) {
        return res.status(409).send({"error":"Please fill in all necesery fields! for these fields, look at the documentation"});
    } else {
        conn.query(sql.addNewProduct(productName, productPrice, productPicture), function (err, result) {
            if(err) {
                return res.status(500).send({"error":"There was an unexpected error"});
            } else {
                return res.status(201).send({"succes":"New product has been added"});
            }
        });
    }
}

//get losse prodcuten
static async looseProducts(req, res) {
    let storeId = req.params.storeId;

    conn.query(sql.getLooseProducts(storeId), function (err, result) {
        if(err) {
            console.log(err);
            return res.status(500).send({"error":"There was an unexpected error"});
        } else {
            return res.status(200).send(result);
        }
    })
}

//get losse schappen
static async looseShelfs(req, res){
    let storeId = req.params.storeId;

    conn.query(sql.getLooseShelfs(storeId), function (err, result) {
        if(err) {
            return res.status(500).send({"error":"There was an unexpected error"});
        } else {
            return res.status(200).json(result);
        }
    })
}

//product koppelen schap 7, product 6
static async linkProduct(req, res) {
    let storeId = req.params.storeId;

    let shelfId = req.body.shelfId;
    let productId = req.body.productId;

    conn.query(sql.linkProduct(storeId, shelfId, productId), function (err, result) {
        if(err) {
            console.log(err);
            return res.status(500).send({"error":"Something went wrong"});
        } else {
            return res.status(200).send({"succes":"product succesfully linked"});
        }
    });
}

//product ontkoppelen
static async unlinkProduct(req, res) {
    let storeId = req.params.storeId;
    let shelfId = req.params.shelfId;

    conn.query(sql.unlinkProduct(storeId, shelfId), function (err, result) {
        if(err) {
            console.log(err);
            return res.status(500).send({"error":"Something went wrong, please check your paramters"});
        } else {
            return res.status(200).send({"succes":"product succesfully unlinked"});
        }
    });
}

//product details
static async getProductById(req, res) {
    let storeId = req.params.storeId;
    let productId = req.params.productId;

    conn.query(sql.productDetails(storeId, productId), function (err, result) {
        if(err) {
            console.log(err);
            return res.status(500).json(err);
        } else {
            return res.status(200).json(result);
        }
    });
}

static async updateProductAmount(req, res) {
    let storeId = req.params.storeId;
    let productId = req.params.productId;
    let amount = req.body.amount;

    conn.query(sql.updateStock(storeId, productId, amount), function(err, result) {
        if(err) {
            console.log(err);
            res.status(500).send({"error":"Something went wrong"});
        } else {
            return res.status(200).json({"Succes": `amount has been changed to ${amount}`});
        }
    });
}

static async getCategories(req, res) {
    conn.query(sql.getCategories, function (err, result) {
        if (err) {
            res.status(500).send({"error":"there was an unexpected error"});
        } else {
            res.status(200).json(result);
        }
    })
}

static async recalibration(req, res) {
    let storeId = req.params.storeId;
    let shelfId = req.params.shelfId;

    conn.query(sql.recalibration(storeId, shelfId), function (err, result) {
        if (err) {
            res.status(500).send({"error":"there was an unexpected error"});
        } else {
            res.status(200).json(result);
        }
    })
}

static async getRecalibration(req, res) {
    let storeId = req.params.storeId;

    conn.query(sql.getRecalibration(storeId), function (err, result) {
        if (err) {
            res.status(500).send({"error":"there was an unexpected error"});
        } else {
            res.status(200).json(result);
        }
    })
}

static async getProductDetail(req, res) {
    let storeId = req.params.storeId;
    let productId = req.params.productId;

    conn.query(sql.productDetail(storeId, productId), function (err, result) {
        if(err) {
            res.status(500).send({"error":"there was an unexpected error"});
        } else {
            res.status(200).json(result);
        }
    })
}

//#endregion

}