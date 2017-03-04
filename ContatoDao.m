#import "ContatoDao.h"
#import "DBManager.h"


@interface ContatoDao()

@property NSMutableArray *contatos;
@property DBManager *dbManager;

@end


@implementation ContatoDao

static ContatoDao *instancia = nil;

+(ContatoDao*) contatoDaoInstance {
    if (!instancia) {
        instancia = [ContatoDao new];
    }
    
    return instancia;
}

-(id) init {
    self = [super init];
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename: @"contatosadams.sql"];
    [self carregaContatos];
    
    return self;
}

-(void) carregaContatos {
    NSString *query = @"SELECT * FROM contatos";
    NSArray *rows = [self.dbManager loadDataFromDB: query];

    self.contatos = [NSMutableArray new];
    
    for (NSArray *row in rows) {
        Contato *contato = [Contato new];
        
        contato.id = [ row[0] integerValue ];
        contato.nome = row[1];
        contato.endereco = row[2];
        contato.email = row[3];
        contato.telefone = row[4];
        
        [self.contatos addObject: contato];
    }
    
}

-(void) adicionarContato:(Contato*)contato {
    [self.contatos addObject: contato];
}

-(NSInteger) tamanho {
    return self.contatos.count;
}

-(Contato*) contatoNoIndex: (NSInteger) index {
    return self.contatos[index];
}

-(void) removerContato:(Contato*)contato {
    [self.contatos removeObject:contato];
}



@end
