#import <UIKit/UIKit.h>
#import "ContatoDao.h"

@interface ListaContatosViewController : UITableViewController

//@property NSMutableArray *contatos;

@property ContatoDao *dao;
@property Contato *contatoSelecionado;

@end
