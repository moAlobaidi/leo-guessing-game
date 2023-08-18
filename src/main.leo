program guessing_game.aleo {

//owner is game host
    record Guess {
        owner: address,
        player: address,
        guess: i64,
        is_winner: bool,
    }

    transition make_guess(player: address, guess: i64) -> Guess {
        assert_eq(self.caller, player);
        return Guess {
            owner: aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh,
            player: player,
            guess: guess,
            is_winner: false,
        };
    }

    transition resolve(first: Guess, second: Guess) -> Guess {
        assert_eq(self.caller, aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh);
        //hard code winning number
        let number: i64 = 7i64;
        let first_dist: i64 = first.guess - number;
        let second_dist: i64 = second.guess - number;
        let first_abs: i64 = first_dist.abs();
        let second_abs: i64 = second_dist.abs();

        if (first_abs <= second_abs) {
            return first;
        } else {
            return second;
        }
    }

    transition finish(guess: Guess) -> Guess {
        assert_eq(self.caller, aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh);
        return Guess {
            owner: guess.player,
            player: guess.player,
            guess: guess.guess,
            is_winner: true,
        };
    }
}