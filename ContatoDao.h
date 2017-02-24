
#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDao : NSObject

+(ContatoDao*) contatoDaoInstance;

-(void) adicionarContato:(Contato*)contato;

-(NSInteger) tamanho;

-(Contato*) contatoNoIndex: (NSInteger) index;

-(void) removerContato:(Contato*)contato;

@end
