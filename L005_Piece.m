
#import "Piece.h"

@implementation Piece

@synthesize pieceType;
@synthesize pieceColor;

- (id) init
{
    if ([self class] == [Piece class])
    {
        // this makes piece a sort of abstract class
        // by making it impossible to create one directly
        @throw ([NSException exceptionWithName:@"init" reason:@"abstract class created" userInfo:nil]);
        
    }
    
    self = [super init];
    pieceType = noPiece;
    pieceColor = blank;
    
    return self;
}

-(BOOL) legalMove: (Move *) theMove
{
    return false;
}

-(int) getPieceValue;
{
    return 0;
}

-(char*) getPieceChar
{
    return "   ";
}

-(BOOL) isKnight
{
    return pieceType == knight;
}

-(BOOL) isBishop
{
    return pieceType == bishop;
}

-(BOOL) isRook
{
    return pieceType == rook;
}

-(BOOL) isDuke
{
    return pieceType == duke;
}

-(BOOL) isPrince
{
    return pieceType == prince;
}

-(BOOL) isNoPiece
{
    return pieceType = noPiece;
}

@end
