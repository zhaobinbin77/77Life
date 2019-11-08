#import <Foundation/Foundation.h>
@class NoteModel;
@interface NoteModelTool : NSObject
+(NSMutableArray *)queryWithNote;
+(void)deleteNote:(int)ids;
+(void)insertNote:(NoteModel *)diaryNote;
+(NoteModel *)queryOneNote:(int)ids;
+(void)updataNote:(NoteModel *)updataNote;
@end
