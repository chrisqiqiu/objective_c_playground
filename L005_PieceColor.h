
#import <Foundation/Foundation.h>

// enumeration of pices coloes. blank will be used for noPiece
typedef NS_ENUM(NSInteger, PieceColor) {
    blank, white, black
};

@interface PieceColorTool : NSObject

+(PieceColor) oppositeColor: (PieceColor) otherColor;

@end


