var AWS, fs, lodash, s3bucket, uuid;

lodash = require('lodash');

uuid = require('node-uuid');

fs = require('fs');

AWS = require('aws-sdk');

AWS.config.region = 'us-west-2';

s3bucket = new AWS.S3({
  params: {
    Bucket: 'setterapp'
  }
});

process.env.AWS_ACCESS_KEY_ID = "AKIAIAW2DXZYXGKLOVTQ";

process.env.AWS_SECRET_ACCESS_KEY = "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";

module.exports = (function() {
  return {
    create: function(req, res) {
      var params;
      console.log(req.file);
      params = {
        Key: uuid.v4(),
        Body: fs.createReadStream(req.file.path)
      };
      return s3bucket.upload(params, function(err, data) {
        if (err) {
          res.status(400);
          return res.send(err);
        } else {
          res.status(200);
          return res.send(data.Location);
        }
      });
    }
  };
})();
