/*
A challenge from Codewars to write a modified version of JavaScript's parseInt function.

Rules:
-It should make the conversion if the given string only contains a single integer value (and eventually spaces - including tabs, line feeds... - at both ends)
-For all other strings (including the ones representing float values), it should return NaN
-It should assume that all numbers are not signed and written in base 10
*/


function myParseInt(str) {

	var trimmed = str.trim();
  
  for (var i = trimmed.length; i > 0; i--) {
  	if (isNaN(trimmed[i - 1]) || trimmed[i - 1] == ' ') {
   		return 'NaN';
    };
  };
  
	return parseInt(str);
}
