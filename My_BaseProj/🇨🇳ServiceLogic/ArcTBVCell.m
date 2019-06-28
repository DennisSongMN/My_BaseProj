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

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        
//        self.backgroundColor = RandomColor;
        
    }
    
    return self;
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
