
#import <UIKit/UIKit.h>
#import "ContatoDao.h"

@interface ViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *email;

@property IBOutlet UIButton *botaoAdicionar;

@property ContatoDao *dao;

@end


