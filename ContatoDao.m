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
    NSString *query = [NSString stringWithFormat:@"INSERT INTO contatos values (null, '%@', '%@', '%@', '%@')",
                       contato.nome, contato.endereco, contato.email, contato.telefone];
    [self.dbManager executeQuery: query];
    
    if (self.dbManager.lastInsertedRowID > 0) {
        contato.id = (NSInteger) self.dbManager.lastInsertedRowID;
        [self.contatos addObject: contato];
    }
}

-(NSInteger) tamanho {
    return self.contatos.count;
}

-(Contato*) contatoNoIndex: (NSInteger) index {
    return self.contatos[index];
}

-(void) editarContato:(Contato*)contatoAlterado {
    NSString *query = [NSString stringWithFormat:
                       @"UPDATE contatos SET nome = '%@', endereco = '%@', email = '%@', telefone = '%@' WHERE id = '%d'",
                       contatoAlterado.nome, contatoAlterado.endereco, contatoAlterado.email, contatoAlterado.telefone, contatoAlterado.id];
    [self.dbManager executeQuery: query];
    
    if (self.dbManager.affectedRows == 1) {
        self.contatoSelecionado.nome = contatoAlterado.nome;
        self.contatoSelecionado.telefone = contatoAlterado.telefone;
        self.contatoSelecionado.email = contatoAlterado.email;
        self.contatoSelecionado.endereco = contatoAlterado.endereco;
        
        // Limpar selecionado
        self.contatoSelecionado = nil;
    }
}

-(void) removerContato:(Contato*)contato {
    NSString *query = [NSString stringWithFormat:@"DELETE FROM contatos WHERE id = '%d' ", contato.id];
    [self.dbManager executeQuery: query];
    
    if (self.dbManager.affectedRows == 1) {
        [self.contatos removeObject:contato];
    }
}



@end
