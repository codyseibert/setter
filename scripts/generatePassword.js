var password = "helloonthedge";

var theCrypt = require('../src/Crypt');

theCrypt.crypt(password, function (err, hash) {
    console.log(hash);
});
