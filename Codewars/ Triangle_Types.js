/* 
A challenge from Codewars to calculate type of triangle with three given sides 'a', 'b', and 'c'.

Should return ᐃ type:
  0 : if ᐃ cannot be made with given sides
  1 : acute ᐃ
  2 : right ᐃ
  3 : obtuse ᐃ
*/

function triangleType(a, b, c){
  
  input_triangle = [a, b, c];
  sorted_triangle = input_triangle.sort(function(a,b) { return a - b;});
  longest_side = Math.max(a, b, c);
  shortest_side = Math.min(a, b, c);
  other_side = sorted_triangle[1];
  longest_squared = Math.pow(longest_side, 2);
  shortest_squared = Math.pow(shortest_side, 2);
  other_squared = Math.pow(other_side, 2);
  
  if (longest_side >= (shortest_side + other_side)) {
    return 0;
    }
    else if (longest_squared < (shortest_squared + other_squared)) {
    return 1;
    }
    else if (longest_squared == (shortest_squared + other_squared)) {
    return 2;
    }
    else if (longest_squared > (shortest_squared + other_squared)) {
    return 3;
    }
    else {
    return "Error, my code is wrong. :(";
}}

/*
Credit where credit is due, I used these two websites to learn the needed triangle math:

http://jwilson.coe.uga.edu/emt668/emat6680.folders/brooks/6690stuff/righttriangle/pythagconv.html
http://www.virtualnerd.com/geometry/triangle-relationships/inequalities-one-triangle/side-lengths-valid-example
*/
