//
//  HistoryDataListTBVCell.m
//  My_BaseProj
//
//  Created by Administrator on 05/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import "HistoryDataListTBVCell.h"

@interface HistoryDataListTBVCell (){
    
    
}

@property(nonatomic,strong)UIButton *deleteBtn;
@property(nonatomic,strong)UILabel *infoLab;
@property(nonatomic,copy)ActionBlock block;
@property(nonatomic,strong)id sth;


@end

@implementation HistoryDataListTBVCell

+(instancetype)cellWith:(UITableView *)tableView{
    
    HistoryDataListTBVCell *cell = (HistoryDataListTBVCell *)[tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    
    if (!cell) {
        
        cell = [[HistoryDataListTBVCell alloc] initWithStyle:UITableViewCellStyleDefault
                                             reuseIdentifier:ReuseIdentifier];
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        
    }
    
    return self;
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    
    return SCALING_RATIO(30);
}

-(void)deleteData:(ActionBlock)block{
    
    self.block = block;
}

- (void)richElementsInCellWithModel:(id _Nullable)model{
    
    self.sth = model;
    
    self.backgroundColor = RandomColor;
    
    [self.contentView addSubview:self.deleteBtn];
    
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        
        make.right.equalTo(self.contentView).offset(-SCALING_RATIO(5));
        
        make.size.mas_equalTo(CGSizeMake(SCALING_RATIO(20), SCALING_RATIO(20)));
    }];
    
    [UIView cornerCutToCircleWithView:self.deleteBtn
                      AndCornerRadius:SCALING_RATIO(20)/2];
    
    [UIView colourToLayerOfView:self.deleteBtn
                     WithColour:kBlackColor
                 AndBorderWidth:0.5f];
    
    [self.contentView addSubview:self.infoLab];
    
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(self.contentView).offset(SCALING_RATIO(5));
        
        make.bottom.equalTo(self.contentView).offset(-SCALING_RATIO(5));
        
        make.right.equalTo(self.deleteBtn.mas_left).offset(-SCALING_RATIO(5));
    }];
    
    if ([model isKindOfClass:[NSString class]]) {
        
        self.infoLab.text = (NSString *)model;
    }
}

-(void)deleteBtnClickEvent:(UIButton *)sender{
    
    if (self.block) {
    
        self.block(self.sth);
    }
}

#pragma mark —— lazyLoad
-(UIButton *)deleteBtn{
    
    if (!_deleteBtn) {
        
        _deleteBtn = UIButton.new;
        
        [_deleteBtn addTarget:self
                       action:@selector(deleteBtnClickEvent:)
             forControlEvents:UIControlEventTouchUpInside];
        
        _deleteBtn.backgroundColor = kCyanColor;
    }
    
    return _deleteBtn;
}

-(UILabel *)infoLab{
    
    if (!_infoLab) {
        
        _infoLab = UILabel.new;
        
        _infoLab.backgroundColor = kRedColor;
    }
    
    return _infoLab;
}

@end
