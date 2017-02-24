#import "ViewController.h"

#import "Contato.h"

@implementation ViewController

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.dao = [ContatoDao contatoDaoInstance];
    }
    
    return self;
}

-(void) viewDidLoad {
    [self editarContato];
}

-(void) editarContato {
    self.nome.text = self.contatoEditar.nome;
    self.telefone.text = self.contatoEditar.telefone;
    self.email.text = self.contatoEditar.email;
    self.endereco.text = self.contatoEditar.endereco;
}

-(IBAction) adicoinar {
    
    if (self.contatoEditar) {
        NSLog(@"%@", self.contatoEditar);

        self.contatoEditar = nil;
        
    } else {
        Contato *contato = [Contato new];
        
        contato.nome = self.nome.text;
        contato.endereco = self.endereco.text;
        [contato setTelefone : self.telefone.text];
        [contato setEmail : self.email.text];
        
        NSLog(@"%@", contato);
        
        [self.dao adicionarContato: contato];
    }
    
    

    [self.navigationController popViewControllerAnimated: YES];
    
}

@end
