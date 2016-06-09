//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Eldon Chan on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"


@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents;
{
    NSUInteger total = 0;
    
    if ([self.items count] == 0){
        return 0;
    }
    
    else {
        
        for (FISItem *item in self.items){
         
            total += item.priceInCents;
        }
    }
    
    return total;
}
-(void)addItem:(FISItem *)item{
    
    [self.items addObject:item];
}

-(void)removeItem:(FISItem *)item{
    
    NSUInteger itemToRemove = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:itemToRemove];
}

-(void)removeAllItemsLikeItem:(FISItem *)item{
    
    [self.items removeObject:item];
}

-(void)sortItemsByNameAsc{
    
    NSSortDescriptor *sortItemAsc = [NSSortDescriptor sortDescriptorWithKey: @"name" ascending:YES];
    
    [self.items sortUsingDescriptors:@[sortItemAsc]];
    
}

-(void)sortItemsByNameDesc{
    
    NSSortDescriptor *sortItemDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    
    [self.items sortUsingDescriptors:@[sortItemDesc]];
}

-(void)sortItemsByPriceInCentsAsc{
    
    
    NSSortDescriptor *sortPriceAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    
    [self.items sortUsingDescriptors:@[sortPriceAsc]];
    
}

-(void)sortItemsByPriceInCentsDesc{
    
    NSSortDescriptor *sortPriceDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    
    [self.items sortUsingDescriptors:@[sortPriceDesc]];
}

-(NSArray *)allItemsWithName:(NSString *)name{
    
    NSMutableArray *matchName = [[NSMutableArray alloc]init];
    
    for (FISItem *item in self.items){
        if ([item.name isEqual:name]){
            [matchName addObject:item];
        }
    }
    
    return matchName;
}

-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price{
    
    NSMutableArray *matchMinPrice = [[NSMutableArray alloc]init];
    
    for (FISItem *item in self.items){
        if (item.priceInCents >= price){
            [matchMinPrice addObject:item];
        }
    }
    
    return matchMinPrice;
}

-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price{
    
    NSMutableArray *matchMaxPrice = [[NSMutableArray alloc]init];
    
    for (FISItem *item in self.items){
        if (item.priceInCents <= price){
            [matchMaxPrice addObject:item];
        }
    }
    
    return matchMaxPrice;
}

@end
