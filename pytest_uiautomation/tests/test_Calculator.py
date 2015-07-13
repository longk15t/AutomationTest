import pytest
import library as lib

class TestCalculator:
    @pytest.fixture
    def calculator_window(self):
        # setup
        lib.openCalculator()
        yield
        # teardown
        lib.closeCalculator()

    @pytest.mark.plus
    def test_2Plus2(self, calculator_window):
        lib.operate_2Plus4()
        assert lib.getActualResult() == 6

    @pytest.mark.plus
    def test_15Plus30(self, calculator_window):
        lib.operate_15Plus30()
        assert lib.getActualResult() == 45

    @pytest.mark.minus
    def test_99Minus83(self, calculator_window):
        lib.operate_99Minus83()
        assert lib.getActualResult() == 16