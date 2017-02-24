//
//  ContatoDao.m
//  AdamsAgenda
//
//  Created by dainf on 17/02/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import "ContatoDao.h"

@implementation ContatoDao

NSMutableArray *contatos;
static ContatoDao *instancia = nil;

+(ContatoDao*) contatoDaoInstance {
    if (!instancia) {
        instancia = [ContatoDao new];
    }
    
    return instancia;
}

-(id) init {
    self = [super init];
    
    contatos = [NSMutableArray new];
    
    return self;
}

-(void) adicionarContato:(Contato*)contato {
    [contatos addObject: contato];
}

-(NSInteger) tamanho {
    return contatos.count;
}

-(Contato*) contatoNoIndex: (NSInteger) index {
    return contatos[index];
}

-(void) removerContato:(Contato*)contato {
    [contatos removeObject:contato];
}



@end
