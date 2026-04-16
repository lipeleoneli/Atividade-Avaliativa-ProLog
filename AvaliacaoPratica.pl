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
    item(5,1,2022,6.0,0.70), % reprovado por freq
    item(5,2,2023,7.5,0.90), % aprovado
    item(6,1,2023,5.0,0.90)
]).
historico(12090, [
    item(7,1,2022,6.0,0.80),
    item(8,2,2023,8.0,0.90)
]).

% Questão 1:
concluiu(RA, CC) :-
    cursa(RA, CC),
    curriculo(CC, ListaMaterias),
    historico(RA, Historico),
    todas_concluidas(ListaMaterias, Historico).

todas_concluidas([], _).
todas_concluidas([CM|Resto], Historico) :-
    aprovado(CM, Historico),
    todas_concluidas(Resto, Historico).

aprovado(CM, [item(CM, _, _, Nota, Freq)|_]) :-
    Nota >= 5.0,
    Freq >= 0.75.

aprovado(CM, [_|Resto]) :-
    aprovado(CM, Resto).    