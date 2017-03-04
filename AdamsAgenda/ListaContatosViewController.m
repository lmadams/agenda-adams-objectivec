//
//  ListaContatosViewController.m
//  AdamsAgenda
//
//  Created by dainf on 10/02/17.
//  Copyright © 2017 br.utfpr. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "ViewController.h"
#import "Contato.h"

@interface ListaContatosViewController ()

@end

@implementation ListaContatosViewController

//Metodo construtor da View
- (ListaContatosViewController*) init {
    
    self = [super init];
    self.dao = [ContatoDao contatoDaoInstance];
    self.dao.contatoSelecionado = nil;
    
//    Botao de cadastrar um novo (lado direito)
    UIBarButtonItem *btnAdd = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
                               target: self
                               action: @selector(mostrarFormulario)];
    self.navigationItem.rightBarButtonItem = btnAdd;
    
//    Botao de editar (lado esquerdo)
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.editButtonItem.title = @"Excluir";
    
    return self;
}

// Metodo onClick do adicionar um novo contato
- (void) mostrarFormulario {
    
    UIStoryboard *storeBoard = [UIStoryboard storyboardWithName: @"Main"
                                                         bundle: nil];
    ViewController *formulario = [storeBoard instantiateViewControllerWithIdentifier: @"FormularioContatos"];
    
    [self.navigationController pushViewController: formulario
                                         animated: YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dao tamanho];
}

- (UITableViewCell*) tableView:(UITableView *)
    tableView cellForRowAtIndexPath:(NSIndexPath *)
    indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle: UITableViewCellStyleSubtitle
                             reuseIdentifier: nil];
    
    // Contato da lista... indexPath.row
    Contato *contato = [self.dao contatoNoIndex: indexPath.row];

    // Titulo - Cor
    cell.textLabel.text = contato.nome;
    cell.textLabel.textColor = [UIColor blueColor];
    
    // label - Cor
    cell.detailTextLabel.text = [NSString stringWithFormat:@"E-mail: %@ - Telefone: %@", contato.email, contato.telefone];
    cell.detailTextLabel.textColor = [UIColor redColor];
    
    // Background - Cor
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
}

-(void) viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}


-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Contato *contato = [self.dao contatoNoIndex: indexPath.row];
        
        [self.dao removerContato: contato];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.dao.contatoSelecionado = [self.dao contatoNoIndex: indexPath.row];
    
    [self mostrarFormulario];
}

@end
