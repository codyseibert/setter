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
var theWallsDao = require('../dao/WallsDao');
var theImagesDao = require('../dao/ImagesDao');
var easyimage = require('easyimage');
var path = require('path');

/**
    Used for posting new images to the file system.
*/
var ImagesController = function () {
    'use strict';

    var handleImage = function (req, res, scaled, pCallback) {
        var MAX_WIDTH = 400,
            image,
            width,
            height,
            new_width,
            new_height,
            ratio,
            extension,
            scaledString,
            base;


        if (!req.files ||
                !req.files.file ||
                !req.files.file.name) {
            res.send("error");
            return;
        }

        scaledString = '';

        image = req.files.file;
        base = process.env.PWD;

        // Read in the image
        easyimage.info(image.path)
            .then(function (file) {
                // Get image properties
                width = file.width;
                height = file.height;
                ratio = width / height;

                extension = "." + image.extension;
                new_width = MAX_WIDTH;
                new_height = MAX_WIDTH / ratio;

                if (scaled === true) {
                  scaledString = '_scaled';
                } else {
                  new_width = file.width;
                  new_height = file.height;
                }

                easyimage.resize({
                    width: new_width,
                    height: new_height,
                    src: image.path,
                    dst: base + '/public/images/uploads/' + image.name.replace(extension, scaledString + extension)
                }).then(function () {
                    theImagesDao.insertImage('images/uploads/' + image.name.replace(extension, scaledString + extension), function (pResults) {
                        var ret = {
                            id: pResults.id,
                            url: 'images/uploads/' + image.name.replace(extension, scaledString + extension)
                        };
                        pCallback(ret);
                    });
                });
            });
    };

    this.uploadAccountImage = function (pReq, pRes) {
        var accountId = pReq.user.accountId;

        handleImage(pReq, pRes, true, function (pRet) {
            theAccountsDao.updateImage(pRet.id, accountId, function (pResults) {
                pRes.send(pRet);
            });
        });
    };

    this.uploadWallImage = function (pReq, pRes) {
        var wallId = pReq.params.wallId;

        handleImage(pReq, pRes, false, function (pRet) {
            theWallsDao.updateImage(pRet.id, wallId, function (pResults) {
                pRes.send(pRet);
            });
        });
    };
};

module.exports = new ImagesController();
