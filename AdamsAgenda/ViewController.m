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
    if (self.dao.contatoSelecionado != nil) {
        [self editarContato];
        
        // ALTERA O TEXTO DO BOTAO
        [self.botaoAdicionar setTitle:@"Salvar" forState: UIControlStateNormal];
    }
}

-(void) editarContato {
    self.nome.text = self.dao.contatoSelecionado.nome;
    self.telefone.text = self.dao.contatoSelecionado.telefone;
    self.email.text = self.dao.contatoSelecionado.email;
    self.endereco.text = self.dao.contatoSelecionado.endereco;
}

-(IBAction) adicoinar {
    
    if (self.dao.contatoSelecionado) {
        self.dao.contatoSelecionado.nome =self.nome.text;
        self.dao.contatoSelecionado.telefone = self.telefone.text;
        self.dao.contatoSelecionado.email = self.email.text;
        self.dao.contatoSelecionado.endereco = self.endereco.text;
        
        NSLog(@"%@", self.dao.contatoSelecionado);

        self.dao.contatoSelecionado = nil;
        
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
