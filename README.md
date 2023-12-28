# obj-generator
A university project written in Common Lisp.

The script is going to output Wavefront .obj compatible 3D model description.
Default matrix describes a simple cube. The script makes it possible to modify model's scale and change position of model's vertices.

Sample output (a scaled-up cube moved away from the origin):
v 1 2 13 
v 1 12 13 
v 1 2 3 
v 1 12 3 
v 11 2 13 
v 11 12 13 
v 11 2 3 
v 11 12 3 
f 1//1 5//1 7//1 3//1
f 4//2 3//2 7//2 8//2
f 8//3 7//3 5//3 6//3
f 6//4 2//4 4//4 8//4
f 2//5 1//5 3//5 4//5
f 6//6 5//6 1//6 2//6
