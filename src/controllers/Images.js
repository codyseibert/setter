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

var db = require('../db');
var auth = require('../auth');
var validator = require('validator');
var filter = require('../key_filter');
var easyimage = require('easyimage');
var imagesDao = require('../dao/images');

var ImageRouteLogic = function () {
    'use strict';

    this.postImage = function (req, res) {
        var body;

        body = req.body;
        req.headers.authorization = body.authorization;

        auth.getAccountId(req, res, function (account_id) {
            var image,
            MAX_WIDTH,
            width,
            height,
            new_width,
            new_height,
            ratio,
            base;

            if (!req.files ||
                !req.files.file ||
                !req.files.file.name) {
                    res.send("error");
                    return;
                }

                image = req.files.file;

                MAX_WIDTH = 400;
                base = process.env.PWD;
                easyimage.info(image.path).then(function (file) {

                    width = file.width;
                    height = file.height;
                    ratio = width / height;

                    if (width > MAX_WIDTH) {
                        new_width = MAX_WIDTH;
                        new_height = MAX_WIDTH / ratio;
                        easyimage.resize({
                            width: new_width,
                            height: new_height,
                            src: image.path,
                            dst: base + '/public/images/uploads/' + image.name.replace('.jpg', '_scaled.jpg')
                        }).then(function () {
                            imagesDao.insertImage('images/uploads/' + image.name, function (err, results) {
                                var ret = {
                                    id: results.insertId,
                                    url: 'images/uploads/' + image.name.replace('.jpg', '_scaled.jpg')
                                };
                                res.send(ret);
                            });
                        });
                    }
                });

            });
        };
    };

    module.exports = new ImageRouteLogic();
