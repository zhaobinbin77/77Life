#import "EventModelTool.h"
#import "EventModel.h"
#import "FMDB.h"
@implementation EventModelTool
static FMDatabaseQueue *_queue;
+ (void)initialize{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentFolderPath = [searchPaths objectAtIndex:0];
    NSString *path  = [documentFolderPath stringByAppendingPathComponent:@"LifeCollection.sqlite"];
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isExist = [fm fileExistsAtPath:path];
    if (!isExist){
        NSString *backupDbPath = [[NSBundle mainBundle]pathForResource:@"LifeCollection.sqlite" ofType:nil];
        [fm copyItemAtPath:backupDbPath toPath:path error:nil];
    }
    _queue = [FMDatabaseQueue databaseQueueWithPath:path];
}
+(NSMutableArray *)queryWithTime{
    __block EventModel * dataTime;
    __block NSMutableArray *diaryArray = nil;
    [_queue inDatabase:^(FMDatabase *db){
        diaryArray = [NSMutableArray array];
        FMResultSet *rs = nil;
        rs = [db executeQuery:@"select * from LifeCollection_Tab"];
        while (rs.next){
            dataTime = [[EventModel alloc]init];
            dataTime.ids = [rs intForColumn:@"ids"];
            dataTime.title = [rs stringForColumn:@"title"];
            dataTime.content = [rs stringForColumn:@"content"];
            dataTime.time = [rs stringForColumn:@"time"];
            dataTime.classType = [rs stringForColumn:@"classType"];
            dataTime.remindType = [rs stringForColumn:@"remindType"];
            dataTime.colorType = [rs stringForColumn:@"colorType"];
            [diaryArray addObject:dataTime];
        }
    }];
    return diaryArray;
}
+(void)deleteTime:(int)ids{
    [_queue inDatabase:^(FMDatabase *db){
        [db executeUpdate:@"delete from LifeCollection_Tab where ids = ?", [NSNumber numberWithInt:ids]];
    }];
}
+(void)insertTime:(EventModel *)diaryTime{
    [_queue inDatabase:^(FMDatabase *db){
        [db executeUpdate:@"insert into LifeCollection_Tab(title, content, time, classType, remindType, colorType) values (?, ?, ?, ?, ?, ?)",diaryTime.title, diaryTime.content, diaryTime.time, diaryTime.classType, diaryTime.remindType, diaryTime.colorType];
    }];
}
+(EventModel *)queryOneTime:(int)ids{
    __block EventModel * dataTime;
    [_queue inDatabase:^(FMDatabase *db){
        FMResultSet *rs = nil;
        rs = [db executeQuery:@"select * from LifeCollection_Tab where ids = ?",[NSNumber numberWithInt:ids]];
        while (rs.next){
            dataTime = [[EventModel alloc]init];
            dataTime.ids = [rs intForColumn:@"ids"];
            dataTime.title = [rs stringForColumn:@"title"];
            dataTime.content = [rs stringForColumn:@"content"];
            dataTime.time = [rs stringForColumn:@"time"];
            dataTime.classType = [rs stringForColumn:@"classType"];
            dataTime.remindType = [rs stringForColumn:@"remindType"];
            dataTime.colorType = [rs stringForColumn:@"colorType"];
        }
    }];
    return dataTime;
}
+(void)updataTime:(EventModel *)updataTime{
    [_queue inDatabase:^(FMDatabase *db){
        [db executeUpdate:@"update LifeCollection_Tab set title = ? , content = ?, time = ?, classType = ? , remindType = ? , colorType = ? where ids = ? ;",updataTime.title, updataTime.content, updataTime.time, updataTime.classType, updataTime.remindType, updataTime.colorType, [NSNumber numberWithInt:updataTime.ids]];
    }];
}
@end
