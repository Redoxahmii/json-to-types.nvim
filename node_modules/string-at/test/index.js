'use strict';

var at = require('../');
var test = require('tape');
var runTests = require('./tests');

test('as a function', function (t) {
	t.test('bad object/this value', function (st) {
		st['throws'](function () { return at(undefined); }, TypeError, 'undefined is not an object');
		st['throws'](function () { return at(null); }, TypeError, 'null is not an object');
		st.end();
	});

	runTests(at, t);

	t.end();
});
