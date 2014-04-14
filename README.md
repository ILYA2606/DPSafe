DPSafe
======

Safe using NSArray/NSMutableArray and NSDictionary/NSMutableDictionary!

	
Handling Sample:


id object = array[@"something key"]; //Handling 'key for array'

id object = array[999]; //Handling wrong index

id object = array[1]; //array.count = 1. Handling 'out of bounds'

array[0] = nil; //attempt insert nil-value

id object = dictionary[999]; //Handling 'index for dictionary'

id object = dictionary[nil]; //Handling wrong key

dictionary[@"something key"] = nil; //attempt insert nil-value
