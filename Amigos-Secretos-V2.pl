%Definindo fatos

%Camisas
camisa(amarela).
camisa(azul).
camisa(branca).
camisa(verde).
camisa(vermelha).

%Nomes
nome(arthur).
nome(caio).
nome(julio).
nome(rogerio).
nome(mateus).

%Presentes
presente(caneca).
presente(dvd).
presente(gravata).
presente(jaqueta).
presente(livro).

%Amigos
amigo(alessandro).
amigo(denis).
amigo(celso).
amigo(fabiano).
amigo(wagner).

%Hobby
hobby(cantar).
hobby(dancar).
hobby(desenhar).
hobby(pintar).
hobby(ler).

%Esportes
esporte(futebol).
esporte(squash).
esporte(surf).
esporte(natacao).
esporte(volei).

% Forçando apenas um único resultado
alldifferent([]).
alldifferent([H|T]):- not(member(H,T)),alldifferent(T).

% Qual o modelo que a gente quer chegar?
modelo([
        (Camisa_1, Nome_1, Presente_1, Amigo_1, Hobby_1, Esporte_1),
        (Camisa_2, Nome_2, Presente_2, Amigo_2, Hobby_2, Esporte_2),
        (Camisa_3, Nome_3, Presente_3, Amigo_3, Hobby_3, Esporte_3),
        (Camisa_4, Nome_4, Presente_4, Amigo_4, Hobby_4, Esporte_4),
        (Camisa_5, Nome_5, Presente_5, Amigo_5, Hobby_5, Esporte_5)
       ]) :-

%%%% Analisando as camisas
camisa(Camisa_1),
camisa(Camisa_2),
camisa(Camisa_3),
camisa(Camisa_4),
camisa(Camisa_5),

alldifferent([Camisa_1, Camisa_2, Camisa_3, Camisa_4, Camisa_5]),

% Até aqui, apenas regras com camisas e nada mais

%%%% Analisando os nomes
nome(Nome_1),
nome(Nome_2),
nome(Nome_3),
nome(Nome_4),
nome(Nome_5),

% Arthur está em uma das pontas.
(Nome_1 == arthur; Nome_5 == arthur),

%Rogério está na terceira posição.
(Nome_3 == rogerio),

% Júlio está exatamente a direita de Rogério.
(
(Nome_2 == julio, Nome_1 == rogerio);
(Nome_3 == julio, Nome_2 == rogerio);
(Nome_4 == julio, Nome_3 == rogerio);
(Nome_5 == julio, Nome_4 == rogerio)
),


% O rapaz de Vermelho está em algum lugar á esquerda do Arthur.
(
(Nome_5 == arthur, (Camisa_1 == vermelha; Camisa_2 == vermelha; Camisa_3 == vermelha; Camisa_4 == vermelha));
(Nome_4 == arthur, (Camisa_1 == vermelha; Camisa_2 == vermelha; Camisa_3 == vermelha));
(Nome_3 == arthur, (Camisa_1 == vermelha; Camisa_2 == vermelha));
(Nome_2 == arthur, Camisa_1 == vermelha)
),

alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),
% Até aqui, apenas regras com (camisas + nomes) e nada mais

%%%% Analisando os presentes:
presente(Presente_1),
presente(Presente_2),
presente(Presente_3),
presente(Presente_4),
presente(Presente_5),

% Na quinta posição está quem vai dar um Livro de presente.
(Presente_5 == livro),

% Quem vai dar um DVD de presente está exatamente á direita de quem está de Branco.
(
(Presente_2 == dvd, Camisa_1 == branca);
(Presente_3 == dvd, Camisa_2 == branca);
(Presente_4 == dvd, Camisa_3 == branca);
(Presente_5 == dvd, Camisa_4 == branca)
),

% O homem de Branco vai dar uma Gravata de presente.
(
(Camisa_1 == branca, Presente_1 == gravata);
(Camisa_2 == branca, Presente_2 == gravata);
(Camisa_3 == branca, Presente_3 == gravata);
(Camisa_4 == branca, Presente_4 == gravata);
(Camisa_5 == branca, Presente_5 == gravata)
),

% Caio está ao lado de quem vai dar um Jaqueta de presente.
(
(Nome_1 == caio, Presente_2 == jaqueta);
(Nome_2 == caio, (Presente_1 == jaqueta; Presente_3 == jaqueta));
(Nome_3 == caio, (Presente_2 == jaqueta; Presente_4 == jaqueta));
(Nome_4 == caio, (Presente_3 == jaqueta; Presente_5 == jaqueta));
(Nome_5 == caio, Presente_4 == jaqueta)
),

alldifferent([Presente_1, Presente_2, Presente_3, Presente_4, Presente_5]),
% Até aqui, apenas regras com (camisas + nomes + presentes) e nada mais

%%%% Analisando os amigos:
amigo(Amigo_1),
amigo(Amigo_2),
amigo(Amigo_3),
amigo(Amigo_4),
amigo(Amigo_5),

% Quem tirou o fabiano está em uma das pontas.
(Amigo_1 == fabiano; Amigo_5 == fabiano),

% Quem tirou o wagner está exatamente à esquerda de quem tirou o alessandro
(
(Amigo_1 == wagner, Amigo_2 == alessandro);
(Amigo_2 == wagner, Amigo_3 == alessandro);
(Amigo_3 == wagner, Amigo_4 == alessandro);
(Amigo_4 == wagner, Amigo_5 == alessandro)
),


% O homem de Azul está em algum lugar á esquerda de quem tirou o wagner
(
(Amigo_5 == wagner, (Camisa_1 == azul; Camisa_2 == azul; Camisa_3 == azul; Camisa_4 == azul));
(Amigo_4 == wagner, (Camisa_1 == azul; Camisa_2 == azul; Camisa_3 == azul));
(Amigo_3 == wagner, (Camisa_1 == azul; Camisa_2 == azul));
(Amigo_2 == wagner, Camisa_1 == azul)
),

alldifferent([Amigo_1, Amigo_2, Amigo_3, Amigo_4, Amigo_5]),
% Até aqui, apenas regras com (camisas + nomes + presentes + amigos) e nada mais

%%%% Analisando os hobbies:
hobby(Hobby_1),
hobby(Hobby_2),
hobby(Hobby_3),
hobby(Hobby_4),
hobby(Hobby_5),

% Na quinta posição está que gosta de Cantar
(Hobby_5 == cantar),

% Mateus está exatamente a direita de quem gosta de Ler
(
(Nome_2 == mateus, Hobby_1 == ler);
(Nome_3 == mateus, Hobby_2 == ler);
(Nome_4 == mateus, Hobby_3 == ler);
(Nome_5 == mateus, Hobby_4 == ler)
),

% Quem tirou o celso está ao lado de quem gosta de Desenhar
(
(Amigo_1 == celso, Hobby_2 == desenhar);
(Amigo_2 == celso, (Hobby_1 == desenhar; Hobby_3 == desenhar));
(Amigo_3 == celso, (Hobby_2 == desenhar; Hobby_4 == desenhar));
(Amigo_4 == celso, (Hobby_3 == desenhar; Hobby_5 == desenhar));
(Amigo_5 == celso, Hobby_4 == desenhar)
),

alldifferent([Hobby_1, Hobby_2, Hobby_3, Hobby_4, Hobby_5]),
% Até aqui, apenas regras com (camisas + nomes + presentes + amigos + hobbies) e nada mais

%%%% Analisando os esportes:
esporte(Esporte_1),
esporte(Esporte_2),
esporte(Esporte_3),
esporte(Esporte_4),
esporte(Esporte_5),

% Em uma das pontas está quem pratica natacao
(Esporte_1 == natacao; Esporte_5 == natacao),

% Quem tirou o alessandro está ao lado de quem pratica Surf.
(
(Amigo_1 == alessandro, Esporte_2 == surf);
(Amigo_2 == alessandro, (Esporte_1 == surf; Esporte_3 == surf));
(Amigo_3 == alessandro, (Esporte_2 == surf; Esporte_4 == surf));
(Amigo_4 == alessandro, (Esporte_3 == surf; Esporte_5 == surf));
(Amigo_5 == alessandro, Esporte_4 == surf)
),

% O rapaz de Amarelo está ao lado de quem pratica Surf.
(
(Camisa_1 == amarela, Esporte_2 == surf);
(Camisa_2 == amarela, (Esporte_1 == surf; Esporte_3 == surf));
(Camisa_3 == amarela, (Esporte_2 == surf; Esporte_4 == surf));
(Camisa_4 == amarela, (Esporte_3 == surf; Esporte_5 == surf));
(Camisa_5 == amarela, Esporte_4 == surf)
),

% O rapaz de Azul e o que gosta de surfar estão lado a lado.
(
(Camisa_1 == azul, Esporte_2 == surf);
(Camisa_2 == azul, (Esporte_1 == surf; Esporte_3 == surf));
(Camisa_3 == azul, (Esporte_2 == surf; Esporte_4 == surf));
(Camisa_4 == azul, (Esporte_3 == surf; Esporte_5 == surf));
(Camisa_5 == azul, Esporte_4 == surf)
),

% O rapaz que gosta de Surf também gosta de Desenhar
(
(Esporte_1 == surf, Hobby_1 == desenhar);
(Esporte_2 == surf, Hobby_2 == desenhar);
(Esporte_3 == surf, Hobby_3 == desenhar);
(Esporte_4 == surf, Hobby_4 == desenhar);
(Esporte_5 == surf, Hobby_5 == desenhar)
),

% Quem tirou o denis joga Squash.
(
(Amigo_1 == denis, Esporte_1 == squash);
(Amigo_2 == denis, Esporte_2 == squash);
(Amigo_3 == denis, Esporte_3 == squash);
(Amigo_4 == denis, Esporte_4 == squash);
(Amigo_5 == denis, Esporte_5 == squash)
),

% Mateus está ao lado de quem pratica Squash.
(
(Nome_1 == mateus, Esporte_2 == squash);
(Nome_2 == mateus, (Esporte_1 == squash; Esporte_3 == squash));
(Nome_3 == mateus, (Esporte_2 == squash; Esporte_4 == squash));
(Nome_4 == mateus, (Esporte_3 == squash; Esporte_5 == squash));
(Nome_5 == mateus, Esporte_4 == squash)
),

% Quem gosta de Futebol está ao lado de quem gosta de Cantar
(
(Esporte_1 == futebol, Hobby_2 == cantar);
(Esporte_2 == futebol, (Hobby_1 == cantar; Hobby_3 == cantar));
(Esporte_3 == futebol, (Hobby_2 == cantar; Hobby_4 == cantar));
(Esporte_4 == futebol, (Hobby_3 == cantar; Hobby_5 == cantar));
(Esporte_5 == futebol, Hobby_4 == cantar)
),

% Quem gosta de Pintar também gosta de Futebol.
(
(Hobby_1 == pintar, Esporte_1 == futebol);
(Hobby_2 == pintar, Esporte_2 == futebol);
(Hobby_3 == pintar, Esporte_3 == futebol);
(Hobby_4 == pintar, Esporte_4 == futebol);
(Hobby_5 == pintar, Esporte_5 == futebol)
),

alldifferent([Esporte_1, Esporte_2, Esporte_3, Esporte_4, Esporte_5]),
% Até aqui, apenas regras com (camisas + nomes + presentes + amigos + hobbies + esportes)

nl,
write('CHEGAMOS AO FIM DO MODELO')
.% fechando o modelo

%%%%%%%%%%%%%%%%%%%%%%%% Imprimindo a lista
imprime_lista([]):- write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]):-
	write('\n......................................\n'),
	write(H), write(' : '),
              imprime_lista(T).

/**********************************************************/
%% main fornece ponto de entrada para scripts
main :-
    %tempo inicial
    statistics(cputime,T1),

    %chama modelo
    modelo(  [A1, A2, A3, A4,A5]  ),

    %chama imprime_lista
    imprime_lista(  [A1, A2, A3, A4,A5]  ),

    %tempo final
    statistics(cputime ,T2),
    Tempo_BUSCA is T2 - T1,

    %define o formato do tempo na saída
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA),
    fail.

main :-
    nl,
    write('\n..... AQUI SOH PODE VIR UMA RESPOSTA ....\n'),
    nl,
    write('...UFA!! J� tava quase desistindo KKKKKKKKKK ..........\n'),
    write('\n'),
    write('...Aluno: Erick Rocha Salignac Araujo .................\n'),
    write('...Turma: Ci�ncia de Dados e Machine Learning..........\n').
