
#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDao : NSObject

@property Contato *contatoSelecionado;

+(ContatoDao*) contatoDaoInstance;

-(void) adicionarContato:(Contato*)contato;

-(NSInteger) tamanho;

-(Contato*) contatoNoIndex: (NSInteger) index;

-(void) editarContato:(Contato*)contatoAlterado;

-(void) removerContato:(Contato*)contato;

@end
