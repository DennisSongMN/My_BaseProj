//
//  DHAreasModel.m
//  Project_Model
//
//  Created by Harriet on 2018/7/9.
//  Copyright © 2018年 Harriet. All rights reserved.
//

#import "DHAreasModel.h"

@implementation DHAreasCountryModel

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{
             @"countryId" : @"id",
             };
}

@end

@implementation DHAreasCityModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{
             @"cityId" : @"id",
             };
}

+ (NSDictionary *)mj_objectClassInArray{
    
    return @{
             @"childList":NSStringFromClass([DHAreasCountryModel class]),
             };
}

@end

@implementation DHAreasProvinceModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{
             @"privinceId" : @"id",
             };
}

+(NSDictionary *)mj_objectClassInArray{
    
    return @{
             @"childList":NSStringFromClass([DHAreasCityModel class]),
             };
}

@end

@implementation DHAreasModel

+ (NSDictionary *)mj_objectClassInArray{
    
    return @{
             @"content":NSStringFromClass([DHAreasProvinceModel class]),
             };
}


@end
