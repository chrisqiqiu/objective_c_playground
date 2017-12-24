
#import <Foundation/Foundation.h>

BOOL fileExists(NSString *filepath);
BOOL appendDataToFile(NSString *filePath, NSData *filedata);
BOOL writeDataToFile(NSString *filePath, NSData *filedata);

BOOL printFileLineByLine(NSString *filePath);

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *filepath = @"/Users/chrisqiu/Desktop/testfile.txt";
        
        // create first 3 lines to write to file
        NSString *output = [NSString stringWithFormat:@"Header\n"];
        output = [output stringByAppendingString:@"Approximating pi"];
        output = [NSString stringWithFormat:@"%@\n%f", output, 355.0 / 113.0];
                
        NSLog(@"\nWRITING DATA AND PRINTING");
        if (writeDataToFile(filepath, [output dataUsingEncoding:NSUTF8StringEncoding]) == NO)
        {
            NSLog(@"Unable to write to %@", filepath);
        }
        
        if (printFileLineByLine(filepath)  == NO)
        {
            NSLog(@"Unable to read from %@", filepath);
        }
        
        // append another line to the file
        output = @"\nFooter";
        
        NSLog(@"\nAPPENDING DATA AND PRINTING");
        if (appendDataToFile(filepath, [output dataUsingEncoding:NSUTF8StringEncoding]) == NO)
        {
            NSLog(@"Unable to append to %@", filepath);
        }
        printFileLineByLine(filepath);
    }
    return 0;
}


BOOL appendDataToFile(NSString *filePath, NSData *filedata)
{
    if (fileExists(filePath) == NO)
    {
        // we must first create the file before we can write to it
        return [[NSFileManager defaultManager] createFileAtPath:filePath contents:filedata attributes:nil];
    }
    else
    {
        // get file handle
        NSFileHandle *fh = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
        
        // check to make sure we have a file handle
        if (fh == nil) return NO;
        
        // read to end of file so we can append at end of file
        [fh seekToEndOfFile];
    
        // write data at end of file
        [fh writeData:filedata];
    
        // close file handle
        [fh closeFile];
        
        return YES;
    }
}

BOOL writeDataToFile(NSString *filePath, NSData *filedata)
{
    if (fileExists(filePath) == NO)
    {
        // we must first create the file before we can write to it
        return [[NSFileManager defaultManager] createFileAtPath:filePath contents:filedata attributes:nil];
    }
    else
    {
        NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:filePath];
        
        // check to make sure we have a file handle
        if (fh == nil) return NO;
        
        // since file handle writeData method overwrites whatever is in the file we must clear the file
        [fh truncateFileAtOffset:0];
    
        // write the data at the cleared beginning of the file
        [fh writeData:filedata];
    
        // close file handle
        [fh closeFile];
        
        return YES;
    }
}

BOOL printFileLineByLine(NSString *filePath)
{
    // load contents of file into NSData object
    NSString *contents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    if (contents == nil) return NO;
    
    // we could just print the contents as follows
    //NSLog(@"%@", contents);
    
    // often though, we want to get at each line of text in the file.
    // the simplist way to do it is as follows
    
    NSArray *lines = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
     
    for (NSString *line in lines)
    {
        NSLog(@"%@", line);
    }
    
    return YES;
}

BOOL fileExists(NSString *filepath)
{
    NSFileManager *fm = [NSFileManager defaultManager];
    
    return [fm fileExistsAtPath:filepath];
}
