'use strict';

var define = require('define-properties');
var ToInteger = require('es-abstract/2019/ToInteger');
var ToObject = require('es-abstract/2019/ToObject');
var ToString = require('es-abstract/2019/ToString');
var callBind = require('es-abstract/helpers/callBind');

var atShim = function at(pos) {
	var O = ToObject(this);
	var S = ToString(O);
	var position = ToInteger(pos);
	var size = S.length;
	if (position < 0 || position >= size) {
		return '';
	}
	// Get the first code unit and code unit value
	var cuFirst = S.charCodeAt(position);
	var cuSecond;
	var nextIndex = position + 1;
	var len = 1;
	// Check if it’s the start of a surrogate pair.
	var isHighSurrogate = cuFirst >= 0xD800 && cuFirst <= 0xDBFF;
	if (isHighSurrogate && size > nextIndex /* there is a next code unit */) {
		cuSecond = S.charCodeAt(nextIndex);
		if (cuSecond >= 0xDC00 && cuSecond <= 0xDFFF) { // low surrogate
			len = 2;
		}
	}
	return S.slice(position, position + len);
};

var boundAt = callBind(atShim);
define(boundAt, {
	method: atShim,
	shim: function shimStringPrototypeAt() {
		define(String.prototype, { at: atShim });
		return String.prototype.at;
	}
});

module.exports = boundAt;
