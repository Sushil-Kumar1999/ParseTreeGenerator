% Num - number agreement (singular or plural)
% Gp - grammatical person (1, 2 ,or 3)
% Gr - grammatical role (subject or object)
% Gvc - grammatical verb category (tv or iv)
% Ay - animacy of subject (animate or inanimate)

s(s(NP, VP)) --> np(NP, Num, subject, Gp, Ay), vp(VP, Num, Gp, Ay).

np(np(PRO), Num, Gr, Gp, _) --> pro(PRO, Num, Gr, Gp).
np(np(DET, NBAR), Num, _, _, Ay) --> det(DET, Num), nbar(NBAR, Num, Ay).
np(np(DET, NBAR, PP), Num, _, _, Ay) --> det(DET, Num), nbar(NBAR, Num, Ay), pp(PP, _).

vp(vp(V, NP), Num, Gp, Ay) --> v(V, Num, Gp, tv, Ay), np(NP, _, object, Gp, _).
vp(vp(V), Num, Gp, Ay) --> v(V, Num, Gp, iv, Ay).

nbar(nbar(N), Num, Ay) --> n(N, Num, Ay).
nbar(nbar(JP), Num, Ay) --> jp(JP, Num, Ay).

jp(jp(ADJ, N), Num, Ay) --> adj(ADJ), n(N, Num, Ay).
jp(jp(ADJ, JP), Num, Ay) --> adj(ADJ), jp(JP, Num, Ay).

pp(pp(PREP, NP), Num) --> prep(PREP), np(NP, Num, _, _, _).

pro(pro(Word), Num, Gr, Gp) --> [Word], {lex(Word, pro, Num, Gp, Gr)}.
v(v(Word), Num, Gp, Gvc, Ay) --> [Word], {lex(Word, Gvc, Num, Gp, Ay)}.
n(n(Word), Num, Ay) --> [Word], {lex(Word, n, Num, Ay)}.
det(det(Word), Num) --> [Word], {lex(Word, det, Num)}.
prep(prep(Word)) --> [Word], {lex(Word, prep)}.
adj(adj(Word)) --> [Word], {lex(Word, adj)}.

% word, grammatical category (pronoun), number (singular/plural), grammatical person (1st, 2nd, or 3rd), and grammatical role (subject or object)
lex(i, pro, singular, 1, subject).
lex(you, pro, singular, 2, subject).
lex(he, pro, singular, 3, subject).
lex(she, pro, singular, 3, subject).
lex(it, pro, singular, 3, subject).
lex(we, pro, plural, 1, subject).
lex(you, pro, plural, 2, subject).
lex(they, pro, plural, 3, subject).

lex(me, pro, singular, 1, object).
lex(you, pro, singular, 2, object).
lex(him, pro, singular, 3, object).
lex(her, pro, singular, 3, object).
lex(it, pro, singular, 3, object).
lex(us, pro, plural, 1, object).
lex(you, pro, plural, 2, object).
lex(them, pro, plural, 3, object).

% word, grammatical category (verb), number (singular/plural),
% grammatical person (1st, 2nd, 3rd), animacy of subject (animate/inanimate)
lex(know, tv, singular, 1, animate).
lex(know, tv, singular, 2, animate).
lex(knows, tv, singular, 3, animate).
lex(know, tv, plural, _, animate).
lex(see, tv, singular, 1, animate).
lex(see, tv, singular, 2, animate).
lex(sees, tv, singular, 3, animate).
lex(see, tv, plural, _, animate).
lex(hire, tv, singular, 1, _).
lex(hire, tv, singular, 2, _).
lex(hires, tv, singular, 3, _).
lex(hire, tv, plural, _, _).
lex(fall, iv, singular, 1, _).
lex(fall, iv, singular, 2, _).
lex(falls, iv, singular, 3, _).
lex(fall, iv, plural, _, _).
lex(sleep, iv, singular, 1, animate).
lex(sleep, iv, singular, 2, animate).
lex(sleeps, iv, singular, 3, animate).
lex(sleep, iv, plural, _, animate).

% word, grammatical category (determiner), number
lex(a, det, singular).
lex(the, det, _).
lex(two, det, plural).

% word, grammatical category (noun), number
lex(man, n, singular, animate).
lex(woman, n, singular, animate).
lex(apple, n, singular, inanimate).
lex(chair, n, singular, inanimate).
lex(room, n, singular, inanimate).
lex(men, n, plural, animate).
lex(women, n, plural, animate).
lex(apples, n, plural, inanimate).
lex(chairs, n, plural, inanimate).
lex(rooms, n, plural, inanimate).

% word, grammatical category (preposition)
lex(on, prep).
lex(in, prep).
lex(under, prep).

% word, grammatical category (adjective)
lex(old, adj).
lex(young, adj).
lex(red, adj).
lex(short, adj).
lex(tall, adj).

% Test sentences

% 1. ?- s(Tree,[the, woman, sees, the, apples],[]).
% Tree = s(np(det(the), nbar(n(woman))), vp(v(sees), np(det(the), nbar(n(apples))))) 

% 2. ?- s(Tree,[a, woman, knows, him],[]).
% Tree = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him)))) 

% 3. ?- s(Tree,[two, woman, hires,a,man],[]).
% false.

% 4. ?- s(Tree,[two, women, hire,a,man],[]).
% Tree = s(np(det(two), nbar(n(women))), vp(v(hire), np(det(a), nbar(n(man))))) .

% 5. ?- s(Tree,[she, knows, her],[]).
% Tree = s(np(pro(she)), vp(v(knows), np(pro(her)))) 

% 6. ?- s(Tree,[she, know, the, man ],[]).
% false.

% 7. ?- s(Tree,[us, see, the, apple],[]).
% false.

% 8. ?- s(Tree,[we, see,the, apple],[]).
% Tree = s(np(pro(we)), vp(v(see), np(det(the), nbar(n(apple)))))

% 9. ?- s(Tree,[i, know, a, short, man],[]).
% Tree = s(np(pro(i)), vp(v(know), np(det(a), nbar(jp(adj(short), n(man))))))

% 10. ?- s(Tree,[he, hires, they],[]).
% false.

% 11. ?- s(Tree, [two, apples, fall], []).
% Tree = s(np(det(two), nbar(n(apples))), vp(v(fall)))

% 12. ?- s(Tree, [the, apple, falls], []).
% Tree = s(np(det(the), nbar(n(apple))), vp(v(falls)))

% 13. ?- s(Tree, [the, apples, fall], []).
% Tree = s(np(det(the), nbar(n(apples))), vp(v(fall)))

% 14. ?- s(Tree, [i, sleep], []).
% Tree = s(np(pro(i)), vp(v(sleep)))

% 15. ?- s(Tree, [you, sleep], []).
% Tree = s(np(pro(you)), vp(v(sleep)))

% 16. ?- s(Tree, [she, sleeps], []).
% Tree = s(np(pro(she)), vp(v(sleeps)))

% 17. ?- s(Tree,[he, sleep],[]).
% false.

% 18. ?- s(Tree,[them, sleep],[]).
% false.

% 19. ?- s(Tree,[a, men, sleep],[]).
% false.

% 20. ?- s(Tree,[the, tall, woman, sees, the, red],[]).
% false.

% 21. ?- s(Tree,[the, young, tall, man, knows, the, old, short, woman],[]).
% Tree = s(np(det(the), nbar(jp(adj(young), jp(adj(tall), n(man))))), vp(v(knows), np(det(the), nbar(jp(adj(old), jp(adj(short), n(woman))))))) 

% 22. ?- s(Tree,[a, man, tall, knows, the, short, woman],[]).
% false.

% 23. ?- s(Tree,[a, man, on, a, chair, sees, a, woman, in, a, room],[]).
% Tree = s(np(det(a), nbar(n(man)), pp(prep(on), np(det(a), nbar(n(chair))))), vp(v(sees), np(det(a), nbar(n(woman)), pp(prep(in), np(det(a), nbar(n(room)))))))

% 24. ?- s(Tree,[a, man, on, a, chair, sees, a, woman, a, room, in],[]).
% false.

% 25. ?- s(Tree,[the, tall, young, woman, in, a, room, on, the, chair, in, a, room, in, the, room, sees, the, red, apples, under, the ,chair],[]).
% Tree = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))), pp(prep(in), np(det(a), nbar(n(room)),
%  pp(prep(on), np(det(the), nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(...)), pp(prep(...), np(..., ...))))))))),
%  vp(v(sees), np(det(the), nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the), nbar(n(chair))))))) 

% Extra Credit - Test sentences on animacy

% 1. ?- s(Tree,[the, woman, sees, the, apples],[]).
% Tree = s(np(det(the), nbar(n(woman))), vp(v(sees), np(det(the), nbar(n(apples))))) .

% 2. ?- s(Tree,[a, woman, knows, him],[]).
% Tree = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him)))) .

% 3. ?- s(Tree,[the, man, sleeps],[]).
% Tree = s(np(det(the), nbar(n(man))), vp(v(sleeps))) .

% 4. ?- s(Tree,[the, room, sleeps],[]).
% false.

% 5. ?- s(Tree,[the, apple, sees, the, chair],[]).
% false.

% 6. ?- s(Tree,[the, rooms, know, the, man],[]).
% false.

% 7. ?- s(Tree,[the, apple, falls],[]).
% Tree = s(np(det(the), nbar(n(apple))), vp(v(falls))) .

% 8. ?- s(Tree,[the, man, falls],[]).
% Tree = s(np(det(the), nbar(n(man))), vp(v(falls))) .