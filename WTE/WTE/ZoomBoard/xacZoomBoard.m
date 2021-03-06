//
//  xacZoomBoard.m
//  ZoomBoard
//
//  Created by Xiang 'Anthony' Chen on 6/19/13.
//  Copyright (c) 2013 hotnAny. All rights reserved.
//

#import "xacZoomBoard.h"

@implementation xacZoomBoard

UIButton *btnQ; UIButton *btnW; UIButton *btnE; UIButton *btnR; UIButton *btnT;
UIButton *btnY; UIButton *btnU; UIButton *btnI; UIButton *btnO; UIButton *btnP;
UIButton *btnA; UIButton *btnS; UIButton *btnD; UIButton *btnF; UIButton *btnG;
UIButton *btnH; UIButton *btnJ; UIButton *btnK; UIButton *btnL; UIButton *btnZ;
UIButton *btnX; UIButton *btnC; UIButton *btnV; UIButton *btnB; UIButton *btnM;
UIButton *btnN;; UIButton *btnComma; UIButton *btnPeriod;

NSArray *lineOne;
NSArray *lineTwo;
NSArray *lineThree;

NSArray *keysOne;
NSArray *keysTwo;
NSArray *keysThree;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        centerX = self.center.x;
        centerY = self.center.y;
        
        [self initKeyBoard:frame];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

float zoomedFactor;
float zoomX;
float zoomY;
float centerX;
float centerY;

- (void) zoomIn:(float)x :(float)y :(float)zoomFactor{
    zoomedFactor = zoomFactor;
    [self zoom :x :y :zoomFactor];
}

- (void) zoomOut:(float)zoomFactor {
//    if(_isZoomed) {
        [self zoom:centerX :centerY : 1 / zoomFactor];
//        _isZoomed = false;
//    }
}

- (void) zoom :(float)x :(float)y :(float)factor {
    CGAffineTransform tr = CGAffineTransformScale(self.transform, factor, factor);
    [UIView animateWithDuration:ANIMATIONDURATION delay:0 options:0 animations:^{

        self.center = CGPointMake(x, y);
                self.transform = tr;
    } completion:^(BOOL finished) {}];
}

//- (void) touchType: (UIEvent*)event;

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    float x = point.x;
    float y = point.y;
    for(UIButton *btn1 in lineOne) {
        CGRect rectBtn = btn1.frame;
        if(x - rectBtn.origin.x < rectBtn.size.width && y - rectBtn.origin.y < rectBtn.size.height) {
            _typedChar = btn1.titleLabel.text;
//            NSLog(@"%@", btn1.titleLabel.text);
            return [super hitTest:point withEvent:event];
        }
    }
    
    for(UIButton *btn2 in lineTwo) {
        CGRect rectBtn = btn2.frame;
        if(x - rectBtn.origin.x < rectBtn.size.width && y - rectBtn.origin.y < rectBtn.size.height) {
             _typedChar = btn2.titleLabel.text;
//            NSLog(@"%@", btn2.titleLabel.text);
            return [super hitTest:point withEvent:event];
        }
    }
    
    for(UIButton *btn3 in lineThree) {
        CGRect rectBtn = btn3.frame;
        if(x - rectBtn.origin.x < rectBtn.size.width && y - rectBtn.origin.y < rectBtn.size.height) {
             _typedChar = btn3.titleLabel.text;
//            NSLog(@"%@", btn3.titleLabel.text);
            return [super hitTest:point withEvent:event];
        }
//    }
    }
    return [super hitTest:point withEvent:event];
}

- (void) hideKeyboard :(BOOL)toHide {
    if(toHide) {
        for(UIButton* btn in lineOne) {
            [btn setAlpha:0];
        }
        for(UIButton* btn in lineTwo) {
            [btn setAlpha:0];
        }
        for(UIButton* btn in lineThree) {
            [btn setAlpha:0];
        }
    } else {
        for(UIButton* btn in lineOne) {
            [btn setAlpha:1];
        }
        for(UIButton* btn in lineTwo) {
            [btn setAlpha:1];
        }
        for(UIButton* btn in lineThree) {
            [btn setAlpha:1];
        }
    }
}

- (void) initKeyBoard :(CGRect)frame {
    btnQ = [[UIButton alloc] init];
    btnW = [[UIButton alloc] init];
    btnE = [[UIButton alloc] init];
    btnR = [[UIButton alloc] init];
    btnT = [[UIButton alloc] init];
    btnY = [[UIButton alloc] init];
    btnU = [[UIButton alloc] init];
    btnI = [[UIButton alloc] init];
    btnO = [[UIButton alloc] init];
    btnP = [[UIButton alloc] init];
    
    btnA = [[UIButton alloc] init];
    btnS = [[UIButton alloc] init];
    btnD = [[UIButton alloc] init];
    btnF = [[UIButton alloc] init];
    btnG = [[UIButton alloc] init];
    btnH = [[UIButton alloc] init];
    btnJ = [[UIButton alloc] init];
    btnK = [[UIButton alloc] init];
    btnL = [[UIButton alloc] init];
    
    btnZ = [[UIButton alloc] init];
    btnX = [[UIButton alloc] init];
    btnC = [[UIButton alloc] init];
    btnV = [[UIButton alloc] init];
    btnB = [[UIButton alloc] init];
    btnN = [[UIButton alloc] init];
    btnM = [[UIButton alloc] init];
    btnComma = [[UIButton alloc] init];
    btnPeriod = [[UIButton alloc] init];
    
    lineOne = [[NSArray alloc] initWithObjects:btnQ, btnW, btnE, btnR, btnT, btnY, btnU, btnI, btnO, btnP, nil];
    lineTwo = [[NSArray alloc] initWithObjects:btnA, btnS, btnD, btnF, btnG, btnH, btnJ, btnK, btnL, nil];
    lineThree = [[NSArray alloc] initWithObjects:btnZ, btnX, btnC, btnV, btnB, btnN, btnM, btnComma, btnPeriod, nil];
    
    keysOne = [[NSArray alloc] initWithObjects:@"Q", @"W", @"E", @"R", @"T", @"Y", @"U", @"I", @"O", @"P", nil];
    keysTwo = [[NSArray alloc] initWithObjects:@"A", @"S", @"D", @"F", @"G", @"H", @"J", @"K", @"L", nil];
    keysThree = [[NSArray alloc] initWithObjects:@"Z", @"X", @"C", @"V", @"B", @"N", @"M", @",", @".", nil];
    
    float marginHori = 0.075f;
    float marginVert = 0.025f;
    
    float wKey = frame.size.width * (1 - marginHori * 2) / lineOne.count * (1 - marginHori) / 2;// * INITIALZOOMLEVEL * ZOOMFACTOR;
    float wMargin = frame.size.width * (1 - marginHori * 2) / lineOne.count * marginHori / 2;
    float hKey = wKey;// frame.size.height * (1 - marginVert * 4) / 3 / 2;// * INITIALZOOMLEVEL * ZOOMFACTOR;
    
    for (int i=0; i<lineOne.count; i++) {
        UIButton *btn = lineOne[i];
        float left = frame.size.width / 4.5f + frame.size.width * marginHori + wMargin + (wKey+wMargin) * i;
        float top = frame.size.height * marginVert * 0 - frame.size.height / 5;
        [btn setTitle:keysOne[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:ZOOMBOARDFONTSIZE];
        [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn setFrame: CGRectMake(left, top, wKey, hKey)];
        //            [btn setUserInteractionEnabled:NO];
//        [btn addTarget:self action:@selector(onKeyTyped:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:btn];
    }
    
    for (int i=0; i<lineTwo.count; i++) {
        UIButton *btn = lineTwo[i];
        float left = frame.size.width / 4.5f + frame.size.width * marginHori + wMargin + (wKey+wMargin) * (i + 0.5f);
        float top = frame.size.height * marginVert * 1 + hKey * 1 - frame.size.height / 5;
        [btn setTitle:keysTwo[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:ZOOMBOARDFONTSIZE];
        [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn setFrame: CGRectMake(left, top, wKey, hKey)];
        //            [btn setUserInteractionEnabled:NO];
//        [btn addTarget:self action:@selector(onKeyTyped:) forControlEvents:UIControlEventTouchUpInside];
//        [btn addGestureRecognizer:swipeUpRecognizer];
        [self addSubview:btn];
    }
    
    for (int i=0; i<lineThree.count; i++) {
        UIButton *btn = lineThree[i];
        float left = frame.size.width / 4.5f + frame.size.width * marginHori + wMargin + (wKey+wMargin) * (i + 0.5f);
        float top = frame.size.height * marginVert * 2 + hKey * 2 - frame.size.height / 5;
        [btn setTitle:keysThree[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:ZOOMBOARDFONTSIZE];
        [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn setFrame: CGRectMake(left, top, wKey, hKey)];
        //            [btn setUserInteractionEnabled:NO];
//        [btn addTarget:self action:@selector(onKeyTyped:) forControlEvents:UIControlEventTouchUpInside];
//        [btn addGestureRecognizer:swipeUpRecognizer];
        [self addSubview:btn];
    }
    
//    float oldCenterX = centerX;
//    float oldCenterY = centerY;
//    centerX /= 2;
//    centerY /= 2;
//    centerY *= 1.5;
//    [self zoomOut:INITIALZOOMLEVEL * ZOOMFACTOR];
//    centerX = oldCenterX;
//    centerY = oldCenterY;
    
    [self hideKeyboard:true];
}

@end
