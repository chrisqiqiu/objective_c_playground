//
//  main.m
//  
//
//  Created by Chris Qiu on 29/11/17.
//  Copyright © 2017 Chris Qiu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BOARDSIZE 8
#define BORDER 1
#define TOTALSIZE ((BORDER*2) + BOARDSIZE)

void printBoard(char board[][TOTALSIZE]);
void fillBoard(char board[][TOTALSIZE]);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        char board[TOTALSIZE][TOTALSIZE];
        fillBoard(board);
        printBoard(board);
    }
    return 0;
}


void printBoard(char board[][TOTALSIZE])
{
    NSString * result =@"";
    for(int i=0;i<TOTALSIZE-1; i++)
    {
        NSString * line = @"";
        for(int j =0; j < TOTALSIZE ; j++)
        {
            line = [NSString stringWithFormat:@"%@%c",line ,board[i][j]];
            
        }
        result = [NSString stringWithFormat:@"%@%@\n", result, line ];
    }
    NSLog(@"\n%@",result);
}


void fillBoard(char board[][TOTALSIZE])
{
    for(int i=0;i<TOTALSIZE-1; i++)
    {
        for(int j =0; j < TOTALSIZE ; j++)
        {
            //fill top and bottom
            if (i==0 || i == TOTALSIZE-2)
            {
                //fill columns
                if(j != 0 && j != TOTALSIZE-1 )
                {
                    board[i][j] = '-';
                }
                else
                    board[i][j] = ' ';
            }
            // fill odd row
            else if (i%2 !=0)
            {
                //fill first and last column
                if( j == 0 || j ==TOTALSIZE-1)
                {
                    board[i][j] = '|';
                }
                //fill odd columns
                else if (j % 2 !=0 )
                {
                    board[i][j] = '#';
                }
                //fill the rest
                else
                    board[i][j] = ' ';
            }
            // fill even row
            else
            {
                //fill first and last column
                if( j == 0 || j ==TOTALSIZE-1)
                {
                    board[i][j] = '|';
                }
                //fill even column
                else if (j % 2 ==0 )
                {
                    board[i][j] = '#';
                }
                //fill the rest
                else
                    board[i][j] = ' ';
            }
            
        }

    }
}
