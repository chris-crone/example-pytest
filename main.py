import my_math

if __name__ == "__main__":
    for i in range(0, 10):
        print("%d is even? %s" % (i, "YES" if my_math.is_even(i) else "NO"))
        print("%d is even? %s" % (i, "YES" if my_math.is_odd(i) else "NO"))
