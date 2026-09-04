class Logic2:
    @classmethod
    def vals(cls):
        return [cls(1), cls(0)]
    
    def __init__(self, val):
        self.val = val

    def __invert__(self):
        return Logic2(1 - self.val)

    def __and__(self, autre):
        return Logic2(self.val * autre.val)

    def __or__(self, autre):
        return Logic2(max(self.val, autre.val))

    def __rshift__(self, autre):
        return ~self | autre
    
    def __str__(self):
        return {1: "V", 0: "F"}[self.val]
    
class Logic3:
    @classmethod
    def vals(cls):
        return [cls(1), cls(0), cls(0.5)]
    
    def __init__(self, val):
        self.val = val

    def __invert__(self):
        return Logic3(1 - self.val)

    def __and__(self, autre):
        val = self.val * autre.val
        if val > 0 and val < 1:
            val = 0.5
        return Logic3(val)

    def __or__(self, autre):
        return Logic3(max(self.val, autre.val))

    def __rshift__(self, autre):
        val = 0
        if (self.val == autre.val or autre.val == 1) or (self.val == 0 and autre.val == 0.5):
            val = 1
        elif (self.val == 1 and autre.val == 0.5) or (self.val == 0.5 and autre.val == 0):
            val = 0.5
        return Logic3(val)
    
    def __str__(self):
        return {1: "V", 0.5: "I", 0: "F"}[self.val]