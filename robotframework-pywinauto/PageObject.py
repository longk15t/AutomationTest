from robot.api.deco import keyword
import time
import uiautomation as auto
from pywinauto.application import Application
from os.path import expanduser
from os.path import join, isfile
import os
from robot.api import logger


pdf_filename = "a_demo_notepad.pdf"
pdf_path = join(expanduser("~"), "Documents", pdf_filename)

class Notepad:
    def __init__(self):
        self.app = Application(backend="uia")

    def open_app(self):
        self.app.start('notepad.exe')

    def close_app(self):
        self.app.connect(path="notepad.exe")
        self.app.kill()

    def type_in_notepad(self, text_string):
        # self.app.connect(path="notepad.exe")
        notepad_window = self.app.window(title='Untitled - Notepad')
        notepad_window.Edit.set_text(text_string)

    def print_current_document(self):
        # self.app.connect(path="notepad.exe")
        notepad_window = self.app.UntitledNotepad
        notepad_window.menu_select("File -> Print")
        pdfButton = self.app.Dialog.Print.FolderView.child_window(title_re='.*PDF', control_type="ListItem")
        if not pdfButton.is_selected():
            pdfButton.click_input()
        self.app.Dialog.Print.Print.click()
        save_window = notepad_window.child_window(title="Save Print Output As", control_type='Window')
        name_field = save_window.child_window(title="File name:", auto_id="1001", control_type='Edit')
        name_field.set_text(pdf_filename)
        save_window.Save.click()
        notepad_window.print_control_identifiers()
        try:
            saveas_window = notepad_window.child_window(title="Confirm Save As", control_type='Window')
            if saveas_window.is_active():
                saveas_window.Yes.click()
        except:
            print "No overwrite"
        finally:
            pass

    @keyword('Check document is printed to pdf file')
    def is_printed_as_pdf(self):
        isfile(pdf_path)
        if not pdf_path.lower().endswith(".pdf"):
            raise AssertionError ("ERROR: Printed file extension is not PDF")

    def open_about_dialog(self):
        notepad_window = self.app.UntitledNotepad
        notepad_window.menu_select("Help -> About Notepad")
        notepad_window.AboutNotepad.is_active()

    @keyword('Check Notepad version is')
    def check_version(self, expected_ver):
        current_ver = self.app.UntitledNotepad.AboutNotepad.child_window(title_re="Version*", control_type="Text").texts()[0]
        try:
            assert expected_ver in current_ver
        except:
            raise AssertionError ("ERROR: Current version is not {}, it's {}".format(expected_ver, current_ver))
        finally:
            self.app.UntitledNotepad.AboutNotepad.OK.click()

    @keyword('Delete file')
    def delete_file(self):
        try:
            os.remove(pdf_path)
        except OSError:
            pass
