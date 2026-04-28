% CURSOS
curso(1, informatica).
curso(2, eletro_eletronica).

% MATERIAS
materia(1, tecnicas_programacao, 8).
materia(2, poo, 5).
materia(3, estruturas_dados, 4).
materia(4, topicos_programacao, 3).
materia(5, circuitos_eletricos, 4).
materia(6, eletronica_digital, 5).
materia(7, arquitetura_computadores, 6).
materia(8, microcontroladores, 4).

% CURRICULO
curriculo(1, [1,2,3,4]).
curriculo(2, [5,6,7,8]).

% ALUNOS
aluno(12909, joao).
aluno(12080, marcos).
aluno(12090, ana).

% CURSA
cursa(12909, 1).
cursa(12080, 2).
cursa(12090, 2).

% HISTORICO
historico(12909, [
    item(1,1,2022,7.0,0.80),
    item(2,2,2022,8.5,0.90),
    item(3,1,2023,6.0,0.80)
]).
historico(12080, [
    item(5,1,2022,6.0,0.70),
    item(5,2,2023,7.5,0.90),
    item(6,1,2023,5.0,0.90)
]).
historico(12090, [
    item(7,1,2022,6.0,0.80),
    item(8,2,2023,8.0,0.90)
]).

% AUXILIARES
membro(X, [X|_]).
membro(X, [_|T]) :- membro(X, T).

tamanho([], 0).
tamanho([_|T], N) :-
    tamanho(T, N1),
    N is N1 + 1.

% APROVADO
aprovado(CM, [item(CM,_,_,Nota,Freq)|_]) :-
    Nota >= 5.0,
    Freq >= 0.75.
aprovado(CM, [_|Resto]) :-
    aprovado(CM, Resto).

% QUESTÃO 1: concluiu(RA, CC)
concluiu(RA, CC) :-
    cursa(RA, CC),
    curriculo(CC, ListaMaterias),
    historico(RA, Historico),
    todas_concluidas(ListaMaterias, Historico).

todas_concluidas([], _).
todas_concluidas([CM|Resto], Historico) :-
    aprovado(CM, Historico),
    todas_concluidas(Resto, Historico).

% QUESTÃO 2: falta(RA, CC, OQUE)
falta(RA, CC, OQUE) :-
    curriculo(CC, ListaMaterias),
    historico(RA, Historico),
    faltantes(ListaMaterias, Historico, OQUE).

faltantes([], _, []).
faltantes([CM|Resto], Historico, ListaFinal) :-
    aprovado(CM, Historico),
    faltantes(Resto, Historico, ListaFinal).
faltantes([CM|Resto], Historico, [Nome|ListaFinal]) :-  
    \+ aprovado(CM, Historico),
    materia(CM, Nome, _),
    faltantes(Resto, Historico, ListaFinal).

% QUESTÃO 3: extra(RA, CC, QUAIS)
extra(RA, CC, QUAIS) :-
    historico(RA, Historico),
    curriculo(CC, CurriculoCC),
    extras_da_lista(Historico, CurriculoCC, QUAIS).

extras_da_lista([], _, []).
extras_da_lista([item(CM,_,_,_,_)|Resto], Curriculo, [Nome|ListaFinal]) :-
    \+ membro(CM, Curriculo),
    materia(CM, Nome, _),
    extras_da_lista(Resto, Curriculo, ListaFinal).
extras_da_lista([item(CM,_,_,_,_)|Resto], Curriculo, ListaFinal) :-
    membro(CM, Curriculo),
    extras_da_lista(Resto, Curriculo, ListaFinal).

% QUESTÃO 4: jafoi(CC, RA, QUANTO)  
jafoi(CC, RA, QUANTO) :-
    curriculo(CC, ListaMaterias),
    historico(RA, Historico),
    conta_aprovadas(ListaMaterias, Historico, Aprovadas),
    tamanho(ListaMaterias, Total),
    QUANTO is (Aprovadas / Total) * 100.

conta_aprovadas([], _, 0).
conta_aprovadas([CM|Resto], H, N) :-        
    conta_aprovadas(Resto, H, N1),
    (aprovado(CM, H) -> N is N1 + 1 ; N is N1).


