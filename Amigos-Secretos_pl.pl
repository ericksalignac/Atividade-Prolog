%Definindo fatos

%Camisas
camisa('amarela').
camisa('azul').
camisa('branca').
camisa('verde').
camisa('verde').

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
    
%O rapaz de Vermelho está em algum lugar à esquerda do Arthur.
(
(Camisa_1 == 'vermelho', (Nome_2 == 'Arthur'; Nome_3 == 'Arthur'; Nome_4 == 'Arthur' ; Nome_5 == 'Arthur'));
(Camisa_2 == 'vermelho', (Nome_3 == 'Arthur'; Nome_4 == 'Arthur'; Nome_5 == 'Arthur'));
(Camisa_3 == 'vermelho', (Nome_4 == 'Arthur');(Nome_5 == 'Arthur'));
(Camisa_4 == 'vermelho', Nome_5 == 'Arthur')
),

%O homem de Azul está em algum lugar à esquerda de quem tirou o Wagner.
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
