program guessing_game.aleo;

record Guess:
    owner as address.private;
    player as address.private;
    guess as i64.private;
    is_winner as boolean.private;


function make_guess:
    input r0 as address.private;
    input r1 as i64.private;
    assert.eq self.caller r0;
    cast aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh r0 r1 false into r2 as Guess.record;
    output r2 as Guess.record;


function resolve:
    input r0 as Guess.record;
    input r1 as Guess.record;
    assert.eq self.caller aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh;
    sub r0.guess 7i64 into r2;
    sub r1.guess 7i64 into r3;
    abs r2 into r4;
    abs r3 into r5;
    lte r4 r5 into r6;
    ternary r6 r0.owner r1.owner into r7;
    ternary r6 r0.player r1.player into r8;
    ternary r6 r0.guess r1.guess into r9;
    ternary r6 r0.is_winner r1.is_winner into r10;
    cast r7 r8 r9 r10 into r11 as Guess.record;
    output r11 as Guess.record;


function finish:
    input r0 as Guess.record;
    assert.eq self.caller aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh;
    cast r0.player r0.player r0.guess true into r1 as Guess.record;
    output r1 as Guess.record;
