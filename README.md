#Terrific HTTP header subscripting for NSURLRequests!

##The Old Way:

This returns a request with header `Accept: application/json, text/plain`:

	NSMutableURLRequest * mutableRequest = [[NSMutableURLRequest alloc] init];
	[mutableRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	[mutableRequest addValue:@"text/plain" forHTTPHeaderField:@"Accept"];

This returns the default value based on device locale, probably `en;q=1` if you're reading this:

	NSURLRequest * request = [[NSURLRequest alloc] init];
	[request valueForHTTPHeaderField:@"Accept-Language"];
	
	
##The New Way:

Just want it with one value? Assign a string.

	NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
	mutableRequest[@"Accept"] = @"application/json";
	
Want two? Pass in a collection.

	mutableRequest[@"Accept"] = @[@"application/json", @"text/plain"];
	
And want to get the value out?

	NSURLRequest * request = [[NSURLRequest alloc] init];
	request[@"Accept-Language"];
	
##A note on assigning a collection
The collection object must conform to the `NSFastEnumeration` protocol. Freely use dictionaries, arrays or sets as the rvalue. It is left to the programmer to ensure that it only contains objects of type `NSString *`.

`JLPRequestSubscripting` will nil out any value for the current header and use fast enumeration to add values. `NSMutableURLRequest` will take care of the proper delimiting.