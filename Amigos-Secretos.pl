%Definindo fatos

%Camisas
camisa('amarela').
camisa('azul').
camisa('branca').
camisa('verde').
camisa('vermelho').

%Nomes
nome('Arthur').
nome('Caio').
nome('Júlio').
nome('Rogério').
nome('Mateus').

%Presentes
presente('caneca').
presente('DVD').
presente('gravata').
presente('jaqueta').
presente('livro').

%Amigos
amigo('Alessandro').
amigo('Denis').
amigo('Celso').
amigo('Fabiano').
amigo('Wagner').

%Hobby
hobby('cantar').
hobby('dançar').
hobby('desenhar').
hobby('pintar').
hobby('ler').

%Esportes
esporte('futebol').
esporte('squash').
esporte('surf').
esporte('natação').
esporte('vôlei').

%forçando apenas um único resultado
alldifferent([]).
alldifferent([H|T]):- not(member(H,T)),alldifferent(T).

%Qual o modelo que a gente quer chegar?
modelo([
        (Camisa_1, Nome_1, Presente_1, Amigo_1, Hobby_1, Esporte_1),
        (Camisa_2, Nome_2, Presente_2, Amigo_2, Hobby_2, Esporte_2),
        (Camisa_3, Nome_3, Presente_3, Amigo_3, Hobby_3, Esporte_3),
        (Camisa_4, Nome_4, Presente_4, Amigo_4, Hobby_4, Esporte_4),
        (Camisa_5, Nome_5, Presente_5, Amigo_5, Hobby_5, Esporte_5)
       ]) :-

%Analisando as camisas:
camisa(Camisa_1),
camisa(Camisa_2),
camisa(Camisa_3),
camisa(Camisa_4),
camisa(Camisa_5),

%Analisando os nomes
nome(Nome_1),
nome(Nome_2),
nome(Nome_3),
nome(Nome_4),
nome(Nome_5),

%Analisando os presentes:
presente(Presente_1),
presente(Presente_2),
presente(Presente_3),
presente(Presente_4),
presente(Presente_5),

%Analisando os hobbys:
hobby(Hobby_1),
hobby(Hobby_2),
hobby(Hobby_3),
hobby(Hobby_4),
hobby(Hobby_5),

%Analisando os amigos:
amigo(Amigo_1),
amigo(Amigo_2),
amigo(Amigo_3),
amigo(Amigo_4),
amigo(Amigo_5),

%Analisando os esportes:
esporte(Esporte_1),
esporte(Esporte_2),
esporte(Esporte_3),
esporte(Esporte_4),
esporte(Esporte_5),

%Em uma das pontas está quem pratica natação.
(Esporte_1 == 'natação'; Esporte_5 == 'natação'),

%O rapaz de Azul e o que gosta de surfar estão lado a lado.
(
(Camisa_1 == 'azul', Esporte_2 == 'surf');
(Camisa_2 == 'azul', (Esporte_1 == 'surf'; Esporte_3 == 'surf'));
(Camisa_3 == 'azul', (Esporte_2 == 'surf'; Esporte_4 == 'surf'));
(Camisa_4 == 'azul', (Esporte_3 == 'surf'; Esporte_5 == 'surf'));
(Camisa_5 == 'azul', Esporte_4 == 'surf')
),

%O rapaz de Amarelo está ao lado de quem pratica Surf.
(
(Camisa_1 == 'amarelo', Esporte_2 == 'surf');
(Camisa_2 == 'amarelo', (Esporte_1 == 'surf'; Esporte_3 == 'surf'));
(Camisa_3 == 'amarelo', (Esporte_2 == 'surf'; Esporte_4 == 'surf'));
(Camisa_4 == 'amarelo', (Esporte_3 == 'surf'; Esporte_5 == 'surf'));
(Camisa_5 == 'amarelo', Esporte_4 == 'surf')
),

%O rapaz de Vermelho está em algum lugar à  esquerda do Arthur.
(
(Camisa_1 == 'vermelho', (Nome_2 == 'Arthur'; Nome_3 == 'Arthur'; Nome_4 == 'Arthur' ; Nome_5 == 'Arthur'));
(Camisa_2 == 'vermelho', (Nome_3 == 'Arthur'; Nome_4 == 'Arthur'; Nome_5 == 'Arthur'));
(Camisa_3 == 'vermelho', (Nome_4 == 'Arthur');(Nome_5 == 'Arthur'));
(Camisa_4 == 'vermelho', Nome_5 == 'Arthur')
),

% O homem de Azul está em algum lugar à  esquerda de quem tirou o
% Wagner.
(
(Camisa_1 == 'azul', (Nome_2 == 'Wagner'; Nome_3 == 'Wagner'; Nome_4 == 'Wagner' ; Nome_5 == 'Wagner'));
(Camisa_2 == 'azul', (Nome_3 == 'Wagner'; Nome_4 == 'Wagner'; Nome_5 == 'Wagner'));
(Camisa_3 == 'azul', (Nome_4 == 'Wagner');(Nome_5 == 'Wagner'));
(Camisa_4 == 'azul', Nome_5 == 'Wagner')
),

%O homem de Branco dará uma Gravata de presente.
(
(Camisa_1 == 'branco', Presente_1 == 'gravata');
(Camisa_2 == 'branco', Presente_2 == 'gravata');
(Camisa_3 == 'branco', Presente_3 == 'gravata');
(Camisa_4 == 'branco', Presente_4 == 'gravata');
(Camisa_5 == 'branco', Presente_5 == 'gravata')
),

% Quem vai dar um DVD de presente está exatamente à  direita de quem
% está de Branco.
(
(Presente_2 == 'DVD', Camisa_1 == 'branco');
(Presente_3 == 'DVD', Camisa_2 == 'branco');
(Presente_4 == 'DVD', Camisa_3 == 'branco');
(Presente_5 == 'DVD', Camisa_4 == 'branco')
),

%Quem gosta de Pintar também gosta de Futebol.
(
(Hobby_1 == 'pintar', Esporte_1 == 'futebol');
(Hobby_2 == 'pintar', Esporte_2 == 'futebol');
(Hobby_3 == 'pintar', Esporte_3 == 'futebol');
(Hobby_4 == 'pintar', Esporte_4 == 'futebol');
(Hobby_5 == 'pintar', Esporte_5 == 'futebol')
),

%Quem tirou o Alessandro está ao lado de quem pratica Surf.
(
(Amigo_1 == 'Alessandro', Esporte_2 == 'surf');
(Amigo_2 == 'Alessandro', (Esporte_1 == 'surf'; Esporte_3 == 'surf'));
(Amigo_3 == 'Alessandro', (Esporte_2 == 'surf'; Esporte_4 == 'surf'));
(Amigo_4 == 'Alessandro', (Esporte_3 == 'surf'; Esporte_5 == 'surf'));
(Amigo_5 == 'Alessandro', Esporte_4 == 'surf')
),

%Quem tirou o Denis joga Squash.
(
(Amigo_1 == 'Denis', Esporte_1 == 'squash');
(Amigo_2 == 'Denis', Esporte_2 == 'squash');
(Amigo_3 == 'Denis', Esporte_3 == 'squash');
(Amigo_4 == 'Denis', Esporte_4 == 'squash');
(Amigo_5 == 'Denis', Esporte_5 == 'squash')
),

%Na quinta posição está que gosta de Cantar.
(Hobby_5 == 'cantar'),

%O rapaz que gosta de Surf também gosta de Desenhar.
(
(Esporte_1 == 'surf', Hobby_1 == 'desenhar');
(Esporte_2 == 'surf', Hobby_2 == 'desenhar');
(Esporte_3 == 'surf', Hobby_3 == 'desenhar');
(Esporte_4 == 'surf', Hobby_4 == 'desenhar');
(Esporte_5 == 'surf', Hobby_5 == 'desenhar')
),

%Quem gosta de Futebol está ao lado de quem gosta de Cantar.
(
(Esporte_1 == 'futebol', Hobby_2 == 'cantar');
(Esporte_2 == 'futebol', (Hobby_1 == 'cantar'; Hobby_3 == 'cantar'));
(Esporte_3 == 'futebol', (Hobby_2 == 'cantar'; Hobby_4 == 'cantar'));
(Esporte_4 == 'futebol', (Hobby_3 == 'cantar'; Hobby_5 == 'cantar'));
(Esporte_5 == 'futebol', Hobby_4 == 'cantar')
),

%Mateus está exatamente à  direita de quem gosta de Ler.
(
(Nome_2 == 'Mateus', Hobby_1 == 'ler');
(Nome_3 == 'Mateus', Hobby_2 == 'ler');
(Nome_4 == 'Mateus', Hobby_3 == 'ler');
(Nome_5 == 'Mateus', Hobby_4 == 'ler')
),

%Quem tirou o Fabiano está em uma das pontas.
(Amigo_1 == 'Fabiano'; Amigo_5 == 'Fabiano'),

%Quem tirou o Celso está ao lado de quem gosta de Desenhar.
(
(Amigo_1 == 'Celso', Hobby_2 == 'desenhar');
(Amigo_2 == 'Celso', (Hobby_1 == 'desenhar'; Hobby_3 == 'desenhar'));
(Amigo_3 == 'Celso', (Hobby_2 == 'desenhar'; Hobby_4 == 'desenhar'));
(Amigo_4 == 'Celso', (Hobby_3 == 'desenhar'; Hobby_5 == 'desenhar'));
(Amigo_5 == 'Celso', Hobby_4 == 'desenhar')
),

% Quem tirou o Wagner está exatamente à esquerda de quem tirou o
% Alessandro.
(
(Amigo_1 == 'Wagner', Amigo_2 == 'Alessandro');
(Amigo_2 == 'Wagner', Amigo_3 == 'Alessandro');
(Amigo_3 == 'Wagner', Amigo_4 == 'Alessandro');
(Amigo_4 == 'Wagner', Amigo_5 == 'Alessandro')
),

%Mateus está ao lado de quem pratica Squash.
(
(Nome_1 == 'Mateus', Esporte_2 == 'squash');
(Nome_2 == 'Mateus', (Esporte_1 == 'squash'; Esporte_3 == 'squash'));
(Nome_3 == 'Mateus', (Esporte_2 == 'squash'; Esporte_4 == 'squash'));
(Nome_4 == 'Mateus', (Esporte_3 == 'squash'; Esporte_5 == 'squash'));
(Nome_5 == 'Mateus', Esporte_4 == 'squash')
),

%Na quinta posição está quem vai dar um Livro de presente.
(Presente_5 == 'livro'),

%Caio está ao lado de quem vai dar um Jaqueta de presente.
(
(Nome_1 == 'Caio', Presente_2 == 'jaqueta');
(Nome_2 == 'Caio', (Presente_1 == 'jaqueta'; Presente_3 == 'jaqueta'));
(Nome_3 == 'Caio', (Presente_2 == 'jaqueta'; Presente_4 == 'jaqueta'));
(Nome_4 == 'Caio', (Presente_3 == 'jaqueta'; Presente_5 == 'jaqueta'));
(Nome_5 == 'Caio', Presente_4 == 'jaqueta')
),

%Arthur está em uma das pontas.
(Nome_1 == 'Arthur'; Nome_5 == 'Arthur'),

%Rogério está na terceira posiÃ§Ã£o.
(Nome_3 == 'Rogério'),

%Júlio está exatamente à  direita de Rogério.
(
(Nome_2 == 'Júlio', Nome_1 == 'Rogério');
(Nome_3 == 'Júlio', Nome_2 == 'Rogério');
(Nome_4 == 'Júlio', Nome_3 == 'Rogério');
(Nome_5 == 'Júlio', Nome_4 == 'Rogério')
),

alldifferent([Camisa_1, Camisa_2, Camisa_3, Camisa_4, Camisa_5]),
alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),
alldifferent([Amigo_1, Amigo_2, Amigo_3, Amigo_4, Amigo_5]),
alldifferent([Presente_1, Presente_2, Presente_3, Presente_4, Presente_5]),
alldifferent([Hobby_1, Hobby_2, Hobby_3, Hobby_4, Hobby_5]),
alldifferent([Esporte_1, Esporte_2, Esporte_3, Esporte_4, Esporte_5]),

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

    %define o formato do tempo na saÃ­da
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA),
    fail.

main :-
    nl,
    write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
    nl,
    write('........ UFA apos o fail .......').
