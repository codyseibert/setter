var password = process.argv[2];
console.log (password);

var theCrypt = require('../src/Crypt');

theCrypt.crypt(password, function (err, hash) {
    console.log(hash);
});
