"use strict";
exports.__esModule = true;
exports.orderlyQueue = void 0;
function orderlyQueue(s, k) {
    var _a;
    var res = "";
    if (k === 1) {
        res = s;
        var sArr = s.split("");
        for (var i = 0; i < s.length; i++) {
            sArr.push((_a = sArr === null || sArr === void 0 ? void 0 : sArr.shift()) !== null && _a !== void 0 ? _a : "");
            if (compare(res, sArr.join(""))) {
                res = sArr.join("");
            }
        }
    }
    else {
        res = s
            .split("")
            .sort(function (a, b) { return (a > b ? 1 : -1); })
            .join("");
    }
    return res;
}
exports.orderlyQueue = orderlyQueue;
function compare(s1, s2) {
    if (s1.length !== s2.length) {
        return false;
    }
    var length = s1.length;
    for (var i = 0; i < length; i++) {
        if (s1[i] > s2[i]) {
            return true;
        }
        else if (s1[i] < s2[i]) {
            return false;
        }
    }
    return false;
}
var tests = [
    ["cba", 1],
    ["baaca", 3],
];
for (var _i = 0, tests_1 = tests; _i < tests_1.length; _i++) {
    var test = tests_1[_i];
    console.log(orderlyQueue(test[0], test[1]));
}
