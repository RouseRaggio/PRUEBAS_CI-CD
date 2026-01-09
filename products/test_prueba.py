from .ejemplo import suma
import pytest


class Testuma:
    def setup_method(self):
        self.sum = suma()

    @pytest.mark.parametrize(
        "sum1, sum2, result_esperado",
        [(5, 4, 9), (-6, -8, -14), (-8, 4, -4), (0, 0, 0), (2, 0, 2)],
    )
    def test_suma(self, sum1, sum2, result_esperado):
        assert self.sum.sumar(sum1, sum2) == result_esperado
