#import "Contato.h"

@implementation Contato

//similar ao metodo toString do java
-(NSString*) description {
    NSString *dados = [NSString stringWithFormat:@"Contato: [%@ |%@ |%@ |%@]", self.nome, self.endereco, self.telefone, self.email];
    
    return dados;
}

@end
