//Use of the typedef keyword to simplify the process of writing types
//Generics can be incoporated in the process of writing these typedefs
//Example
Map<String, List<String>> m1 = {};
//The map above can be represented using typedefs & generics by including parameters as below
typedef ListMapper<X> = Map<X, List<X>>;
//Provide the parameter
ListMapper<String> m2 = {};

//It is a good practice not to use typedefs for functions, It is better to directly see what the function does or return
