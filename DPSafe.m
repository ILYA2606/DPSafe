//
//  DPSafe.m
//  AlfaMobile
//
//  Created by ILYA2606 on 14.04.14.
//
//

#import "DPSafe.h"

@implementation NSArray (DPSafe)

-(id)objectForKey:(NSString*)key
{
    NSLog(@"DPSafe: attempt get object for key '%@' to ARRAY '%@'", key, self);
    return nil;
}

-(void)setObject:(id)object forKey:(NSString*)key
{
    NSLog(@"DPSafe: attempt set object '%@' for key '%@' to ARRAY '%@'", object, key, self);
    return;
}

- (id)objectForKeyedSubscript:(id)key{
    NSLog(@"DPSafe: attempt get object for subscript key '%@' to ARRAY '%@'", key, self);
    return nil;
}

- (void)setObject:(id)object forKeyedSubscript:(id <NSCopying>)key{
    NSLog(@"DPSafe: attempt set object '%@' for subscript key '%@' to ARRAY '%@'", object, key, self);
}

- (id)objectAtIndexedSubscript:(NSUInteger)index
{
    if (index >= self.count)
    {
        NSLog(@"DPSafe: attempt get object at WRONG subscript index '%li' to array '%@'", (long)index, self);
        return nil;
    }
    id object = [self objectAtIndex:index];
    if ([object isKindOfClass:[NSNull class]]){
        NSLog(@"DPSafe: attempt get WRONG object '%@' at subscript index '%li' to array '%@'", object, (long)index, self);
        return nil;
    }
    return object;
}

@end

@implementation NSMutableArray (DPSafe)

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index{
    if (index > self.count || (long)index < 0)
    {
        NSLog(@"DPSafe: attempt set object '%@' at WRONG subscript index '%li' to array '%@'", object, (long)index, self);
        return;
    }
    if(!object || [object isKindOfClass:[NSNull class]]){
        NSLog(@"DPSafe: attempt set WRONG object '%@' at subscript index '%li' to array '%@'", object, (long)index, self);
        return;
    }
    if(index == self.count){//add
        [self addObject:object];
    }
    else{//replace
        [self replaceObjectAtIndex:index withObject:object];
    }
}

@end

@implementation NSDictionary (DPSafe)

-(id)objectAtIndex:(NSUInteger)index
{
    NSLog(@"DPSafe: attempt get object at index '%li' to DICTIONARY '%@'", (long)index, self);
    return nil;
}

-(void)setObject:(id)object atIndex:(NSUInteger)index
{
    NSLog(@"DPSafe: attempt set object '%@' at index '%li' to DICTIONARY '%@'", object, (long)index, self);
    return;
}


- (id)objectAtIndexedSubscript:(NSUInteger)index
{
    NSLog(@"DPSafe: attempt get object at subscript index '%li' to DICTIONARY '%@'", (long)index, self);
    return nil;
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index{
    NSLog(@"DPSafe: attempt set object '%@' at subscript index '%li' to DICTIONARY '%@'", object, (long)index, self);
}

- (id)objectForKeyedSubscript:(id)key{
    if (!key || [key isKindOfClass:[NSNull class]]){
        NSLog(@"DPSafe: attempt get object for WRONG subscript key '%@' to dictionary '%@'", key, self);
        return nil;
    }
    id object = [self objectForKey:key];
    if (!object || [object isKindOfClass:[NSNull class]]){
        NSLog(@"DPSafe: attempt get WRONG object '%@' for subscript key '%@' to dictionary '%@'", object, key, self);
        return nil;
    }
    return object;
}

@end

@implementation NSMutableDictionary (DPSafe)

- (void)setObject:(id)object forKeyedSubscript:(id <NSCopying>)key{
    if(!key || key == [NSNull null]){
        NSLog(@"DPSafe: attempt set object '%@' for WRONG subscript key '%@' to dictionary '%@'", object, key, self);
        return;
    }
    if(!object || [object isKindOfClass:[NSNull class]]){
        NSLog(@"DPSafe: attempt set WRONG object '%@' for subscript key '%@' to dictionary '%@'", object, key, self);
        return;
    }
    [self setObject:object forKey:key];
}

@end