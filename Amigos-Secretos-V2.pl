modelo([
        (Camisa_1, Nome_1, Presente_1, Amigo_1, Hobby_1, Esporte_1),
        (Camisa_2, Nome_2, Presente_2, Amigo_2, Hobby_2, Esporte_2),
        (Camisa_3, Nome_3, Presente_3, Amigo_3, Hobby_3, Esporte_3),
        (Camisa_4, Nome_4, Presente_4, Amigo_4, Hobby_4, Esporte_4),
        (Camisa_5, Nome_5, Presente_5, Amigo_5, Hobby_5, Esporte_5)
       ]) :-

%%%%%%%%%%% MOCHILA
%

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
    write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
    nl,
    write('........ UFA apos o fail .......').
