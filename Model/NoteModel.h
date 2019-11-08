#import <Foundation/Foundation.h>
@interface NoteModel : NSObject
@property (nonatomic, assign) int ids;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * time;
@property (nonatomic, copy) NSString * weather;
@property (nonatomic, copy) NSString * mood;
@property (nonatomic, copy) NSString * coverImageData;
-(NSMutableArray *)queryWithNote;
-(void)deleteNote:(int)ids;
-(void)insertNote:(NoteModel *)diaryNote;
-(NoteModel *)queryOneNote:(int)ids;
-(void)updataNote:(NoteModel *)updataNote;
@end
