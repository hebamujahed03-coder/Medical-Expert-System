% simple medical expert system

:- dynamic yes/1,no/1.

start :-
   write('--- Medical Expert System ---'), nl,
   diagnose(Disease),
   write('I think you have: '), write(Disease), nl,
   undo.

disease(flu) :-
   symptom(fever),
   symptom(cough),
   symptom(headache).

disease(cold) :-
   symptom(cough),
   symptom(sore_throat),
   symptom(runny_nose).

disease(covid) :-
   symptom(fever),
   symptom(cough),
   symptom(loss_of_taste).

disease(migraine) :-
symptom(headache),
   symptom(nausea),
   symptom(sensitivity_to_light).

diagnose(Disease) :-
   disease(Disease), !.

diagnose(unknown).

symptom(X) :-
   yes(X), !.

symptom(X) :-
   no(X), !, fail.

symptom(X) :-
   ask(X).

ask(X) :-
   write('Do you have '), write(X), write('? (yes/no): '),
   read(Answer),
   (
       Answer == yes ->
       assert(yes(X));
       assert(no(X)), fail
   ).

undo :-
   retract(yes(_)), fail.
undo :-
   retract(no(_)), fail.
undo.
