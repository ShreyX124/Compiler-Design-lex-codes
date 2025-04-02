import nltk

from nltk import CFG

from nltk.parse import ShiftReduceParser, ChartParser
 
# Define the grammar

grammar = CFG.fromstring("""

    S -> NP VP

    NP -> Det N | N

    VP -> V NP | V

    Det -> 'the' | 'a'

    N -> 'dog' | 'cat' | 'man'

    V -> 'chased' | 'saw'

""")
 
# Test with ShiftReduceParser

def test_shift_reduce(sentence):

    tokens = sentence.split()

    sr_parser = ShiftReduceParser(grammar, trace=1)  # Basic tracing

    print(f"Input sentence: {sentence}")

    print(f"Tokens: {tokens}")

    print("\nShift-Reduce Parsing:")

    try:

        for parse in sr_parser.parse(tokens):

            print("\nValid parse found:")

            print(parse)

            parse.pretty_print()

    except ValueError as e:

        print(f"Error: {e}")
 
# Test with ChartParser for comparison

def test_chart_parser(sentence):

    tokens = sentence.split()

    chart_parser = ChartParser(grammar)

    print("\nChart Parsing:")

    try:

        for parse in chart_parser.parse(tokens):

            print("\nValid parse found:")

            print(parse)

            parse.pretty_print()

    except ValueError as e:

        print(f"Error: {e}")
 
# Test cases

test_sentences = [

    "the dog chased the cat",

    "a man saw the dog",

    "cat chased dog"

]
 
for sentence in test_sentences:

    print("=" * 50)

    test_shift_reduce(sentence)

    test_chart_parser(sentence)

    print("=" * 50)
 