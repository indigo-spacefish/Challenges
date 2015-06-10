"""
RJ Zaworski (https://github.com/rjz) was gracious enough to donate his time to offer some
white-boarding interview practice to my PDX Code Guild Class.

He asked us to write a script that would take a standard deck of playing cards and return
a randomly shuffled order of cards.  Then write some tests to see if it is working.

Here is what became of my scribbled notepad.
"""

from random import randint


SUIT_INDEX = 0
RANK_INDEX = 1
SUITS = ['Spades', 'Hearts', 'Diamonds', 'Clubs']
RANKS = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']


def make_deck(suits, ranks):
    result = []
    for suit in suits:
        for rank in ranks:
            result.append([suit, rank])
    return result

DECK = make_deck(SUITS, RANKS)


def shuffle(input_list):
    deck = input_list
    cards_left = len(deck)
    cards_left_index = (cards_left - 1)
    random_int = randint(0, cards_left_index)
    result = []

    while cards_left:

        if deck[random_int] not in result:
            result.append(deck[random_int])
            deck = [x for x in deck if x not in result]
            cards_left = len(deck)
            cards_left_index = (cards_left-1)

            if cards_left:
                random_int = randint(0, cards_left_index)

    return result


def test_shuffle(test_deck):
    assert len(test_deck) == 52

    def hashable_list(deck):
        result = []
        for card in deck:
            result.append(card[SUIT_INDEX] + card[RANK_INDEX])
        return result

    hashable_test = hashable_list(test_deck)
    hashable_deck = hashable_list(DECK)
    assert len(set(hashable_test)) == 52
    assert len(set(hashable_deck)) == 52

    def changed_position(test_deck):
        changed_position_count = 0
        for x in range(0, 52):
            if test_deck[x] != DECK[x]:
                changed_position_count += 1
        return changed_position_count

    def loop_test():
        loops = 0
        cards_moved_count = []
        for x in range(0, 100):
            new_deck = shuffle(DECK)
            loops += 1
            cards_moved_count.append(changed_position(new_deck))
        print ("Loops performed: " + str(loops))
        print ("Average cards moved per shuffle: " + str(sum(cards_moved_count) / 100.0))

    loop_test()
    print str(changed_position(test_deck)) + " cards changed position this shuffle."


def decorate_cards(deck):
    result = []
    for card in deck:
        rank = numeral_to_string(card[RANK_INDEX])
        suit = card[SUIT_INDEX]
        decorated_card = rank + " of " + suit
        result.append(decorated_card)
    return result


"""
A classmate and I vehemently disagreed about whether numerals or words for the 2-10 card ranks
look better in the output (e.g. [Three of Spades] vs. [3 of Spades]).

So here is a modular way of changing the card decoration.  To leave the numerals simply remove
the numeral_to_string() function wrapping card[RANK_INDEX] on line 89.
"""
def numeral_to_string(card_rank):
    numeral_ranks = {
        '2': 'Two',
        '3': 'Three',
        '4': 'Four',
        '5': 'Five',
        '6': 'Six',
        '7': 'Seven',
        '8': 'Eight',
        '9': 'Nine',
        '10': 'Ten', }

    if card_rank in numeral_ranks.keys():
        return numeral_ranks[card_rank]
    else:
        return card_rank


shuffled_deck = shuffle(DECK)

test_shuffle(shuffled_deck)

print ("Shuffled Deck:")
print (decorate_cards(shuffled_deck))
