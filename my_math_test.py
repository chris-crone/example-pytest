import my_math

def test_is_even():
    assert my_math.is_even(0) == True
    assert my_math.is_even(1) == False
    assert my_math.is_even(2) == True

def test_is_odd():
    assert my_math.is_odd(0) == False
    assert my_math.is_odd(1) == True
    assert my_math.is_odd(2) == False
