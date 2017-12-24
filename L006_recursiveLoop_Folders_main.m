

#import <Foundation/Foundation.h>

void enumerateDirectory(NSString *rootDir);
void directoryList(NSString *rootDir, int depth);
BOOL isDirectory(NSFileManager *fm, NSString *dirPath);

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        
        enumerateDirectory(@"/Users/chrisqiu/Desktop");
        directoryList(@"/Users/chrisqiu/Desktop", 0);
    }
    return 0;
}

void enumerateDirectory(NSString *rootDir)
{
    // create a file manager
    NSFileManager *fm = [NSFileManager defaultManager];
    
    // check root directory exists before listing contents
    if (!isDirectory(fm, rootDir))
    {
        NSLog(@"%@ does not exist or is not a directory", rootDir);
        return;
    }
    
    NSDirectoryEnumerator *dirEnum = [fm enumeratorAtPath:rootDir];
    NSString *path;
    
    while ((path = [dirEnum nextObject]) != nil)
    {
        NSLog(@"%@", path);
    }
}

void directoryList(NSString *rootDir, int depth)
{
    // create a file manager
    NSFileManager *fm = [NSFileManager defaultManager];
    
    // check root directory exists before listing contents
    if (!isDirectory(fm, rootDir))
    {
        NSLog(@"%@ does not exist or is not a directory", rootDir);
        return;
    }
    
    // get contents of directory
    NSArray *contents = [fm contentsOfDirectoryAtPath:rootDir error:nil];
    
    NSString *indent = @"";
    for (int i=0; i<depth; i++) indent = [indent stringByAppendingString:@" "];
    
    // list subdirectories
    for (NSString *subDir in contents)
    {
        // full path of sub-directory = rootDir/subDir
        NSString *subDirPath = [NSString stringWithFormat:@"%@/%@", rootDir, subDir];
        
        if (isDirectory(fm, subDirPath))
        {
            NSLog(@"%@%@", indent, [subDir uppercaseString]);
            
            // recurse into sub-directory to list contents
            directoryList(subDirPath, depth + 1);
        }
    }
    
    // list files
    for (NSString *subDir in contents)
    {
        NSString *subDirPath = [NSString stringWithFormat:@"%@/%@", rootDir, subDir];
        
        if (!isDirectory(fm, subDirPath))
        {
            NSLog(@"%@%@", indent, subDir);
        }
    }
}

BOOL isDirectory(NSFileManager *fm, NSString *dirPath)
{
    BOOL isDir;
    
    // check dirPath exists
    if ([fm fileExistsAtPath:dirPath isDirectory:&isDir] == NO) return false;
    
    // return if dirPath is a directory or not
    return isDir;
}

