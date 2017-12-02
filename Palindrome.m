//
//  main.m
//  Tutorial 2
//
//  Created by Chris Qiu on 26/11/17.
//  Copyright © 2017 Chris Qiu. All rights reserved.
//

#import <Foundation/Foundation.h>

// declare function prototypes
int getNumber();
int isPalindrome(int number);
int isPalindrome2(int number);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int number = getNumber();
        if (number >= 0)
        {
            if (isPalindrome(number))
            {
                NSLog(@"\n%d is palindromic\n", number);
            }
            else
            {
                NSLog(@"\n%d is not palindromic\n", number);
            }
            
//            NSLog(@"here");
        }
        else
        {
            NSLog (@"Invalid number entered");
        }
    }
    return 0;
}

int getNumber()
{
    int value = 0;
    
    NSLog(@"Please enter a number:");
    
    int result = scanf("%d",&value);
    
    if (result== 0)
    {
        return -1;
    }
    else
        return value;
    
}

int isPalindrome(int number)
{
    char numberString[11];
    sprintf(numberString,"%d", number);
    
    int length = 0;
    
    while(numberString[length]!= '\0')
    {
        length++;
    }
    
    char reversedString[11];
    
    for(int i =0;i <length;i++)
    {
        reversedString[i] = numberString[length-i-1];
    }
    
    int reversedNumber = atoi(reversedString);
    
    if(number == reversedNumber)
    {
        return 1;
    }
    else
        return 0;
    
}

int isPalindrome2(int number)
{
    // code to test is number is a palindrome.
    // Return true or false (1 or 0)
    NSString *numberString = [NSString stringWithFormat:@"%d", number];
    
    NSLog(@"numberString is %@",numberString);
    
    NSString *reverseString = @"";
    
    for(int i =0; i< numberString.length; i++)
    {
        reverseString = [NSString stringWithFormat:@"%c%@", [numberString characterAtIndex: i ] , reverseString  ];
        
    }
    
    NSLog(@"reversed string is %@",reverseString);
    
    int reversedNumber  = [reverseString intValue];
    
    if(number == reversedNumber)
    {
        return 1;
    }
    else
        return 0;
}


//using raw c method
//char string[] = “127”;
//int number = atoi(string);
//int i;
//char s[11];
//sprintf(s,"%ld", i);


//Convert NSString to int
//NSString *aNumberString = @"123";
//int i = [aNumberString intValue];

//Convert int to NSString
//int aNumber = 123;
//NSString *aString = [NSString stringWithFormat:@"%d", aNumber];

