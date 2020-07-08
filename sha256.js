const CryptoJS = require("crypto-js");


let hash = CryptoJS.SHA256("Let's test the SHA256!");
let hashHex = hash.toString(CryptoJS.enc.Hex)
console.log(hashHex)