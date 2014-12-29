/*jslint nomen: true */
/*jslint unparam: true*/
/*jslint unparam: true, nomen: true*/

/*
*   Copyright (c) Cody Seibert and Guillermo Martinez
*
*   Do not copy, redistribute, sell, modify, etc, without
*   written legally bound permission from both Cody Seibert and
*   Guillermo Martinez.
*/

var theAccountsDao = require('../dao/AccountsDao');
var theImagesDao = require('../dao/ImagesDao');
var easyimage = require('easyimage');

/**
    Used for posting new images to the file system.
*/
var ImagesController = function () {
    'use strict';

    this.uploadAccountImage = function (req, res) {
        var MAX_WIDTH = 400,
            accountId,
            image,
            width,
            height,
            new_width,
            new_height,
            ratio,
            base;

        accountId = req.user.accountId;

        if (!req.files ||
                !req.files.file ||
                !req.files.file.name) {
            res.send("error");
            return;
        }

        image = req.files.file;
        base = process.env.PWD;

        // Read in the image
        easyimage.info(image.path)
            .then(function (file) {
                // Get image properties
                width = file.width;
                height = file.height;
                ratio = width / height;

                // Scale image down if too large
                if (width > MAX_WIDTH) {
                    new_width = MAX_WIDTH;
                    new_height = MAX_WIDTH / ratio;
                    easyimage.resize({
                        width: new_width,
                        height: new_height,
                        src: image.path,
                        dst: base + '/public/images/uploads/' + image.name.replace('.jpg', '_scaled.jpg')
                    }).then(function () {
                        theImagesDao.insertImage('images/uploads/' + image.name, function (pResults) {
                            var ret = {
                                id: pResults.id,
                                url: 'images/uploads/' + image.name.replace('.jpg', '_scaled.jpg')
                            };

                            theAccountsDao.updateImage(ret.id, accountId, function (pResults) {
                                res.send(ret);
                            });
                        });
                    });
                }
            });
    };
};

module.exports = new ImagesController();
