import pytest
import library as lib

class TestNotepad:
    @pytest.fixture
    def notepad_app(self):
        # setup
        lib.openNotepad()
        yield
        # teardown
        lib.closeNotepad()
        lib.deleteFileNotepad()

    def test_SaveFile(self, notepad_app):
        lib.typeInNotepad("Hello world")
        lib.saveFile("demo_text.txt")
        assert lib.checkFileIsSaved("demo_text.txt")