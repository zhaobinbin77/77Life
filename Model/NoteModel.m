#import "NoteModel.h"
#import "NoteModelTool.h"
@implementation NoteModel
-(NSMutableArray *)queryWithNote{
    return [NoteModelTool queryWithNote];
}
-(void)deleteNote:(int)ids{
    [NoteModelTool deleteNote:ids];
}
-(void)insertNote:(NoteModel *)diaryNote{
    [NoteModelTool insertNote:diaryNote];
}
-(NoteModel *)queryOneNote:(int)ids{
    return [NoteModelTool queryOneNote:ids];
}
-(void)updataNote:(NoteModel *)updataNote{
    [NoteModelTool updataNote:updataNote];
}
@end
