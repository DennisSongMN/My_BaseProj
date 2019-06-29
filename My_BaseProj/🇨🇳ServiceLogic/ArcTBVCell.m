//
//  ArcTBVCell.m
//  My_BaseProj
//
//  Created by Administrator on 10/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import "ArcTBVCell.h"

@interface ArcTBVCell (){
    
    
}

@end

@implementation ArcTBVCell

+(instancetype)cellWith:(UITableView *)tableView{
    
    ArcTBVCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    
    if (!cell) {
        
        cell = [[ArcTBVCell alloc]initWithStyle:UITableViewCellStyleDefault
                                reuseIdentifier:ReuseIdentifier];
    }
    
    return cell;
}

+(CGFloat)cellHeight:(id)model{

    return 30;
}

-(void)richElementsInCellWithModel:(id)model{
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        
//        self.backgroundColor = RandomColor;
        
    }
    
    return self;
}

@end
