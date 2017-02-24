
#import <UIKit/UIKit.h>
#import "ContatoDao.h"

@interface ViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *email;

@property ContatoDao *dao;
@property Contato *contatoEditar;

@end


