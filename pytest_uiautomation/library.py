import uiautomation as automation
from uiautomation import Win32API
from uiautomation import WaitForExist, WaitForDisappear
from PageObject import Notepad, Calculator
import os
from os.path import join, isfile
import re

current_dir = os.getcwd()

def openProgramViaRunDialog(program):
    Win32API.SendKeys("{LWIN}{R}")
    WaitForExist(Notepad.dlgRun(), 5)
    Win32API.SendKeys(program)
    Win32API.SendKeys("{ENTER}")

def openNotepad():
    openProgramViaRunDialog("notepad")
    WaitForExist(Notepad.wndNotepad(), 5)

def closeNotepad():
    Notepad.btnClose().Click()
    WaitForDisappear(Notepad.wndNotepad(), 5)

def typeInNotepad(strText):
    Notepad.wndNotepad().Click()
    Win32API.SendKeys(strText)

def saveFile(fileName):
    Notepad.mnuitemFile().Click()
    WaitForExist(Notepad.mnuFile(), 5)
    Notepad.mnuitemSave().Click()
    WaitForExist(Notepad.dlgSave(), 5)
    Notepad.editFileName().SetValue(join(current_dir, fileName))
    Notepad.btnSave().Click()

def checkFileIsSaved(fileName):
    return isfile(join(current_dir, fileName))

def deleteFileNotepad():
    files = os.listdir(current_dir)
    for file in files:
        if file.endswith(".txt"):
            os.remove(join(current_dir, file))

def openCalculator():
    openProgramViaRunDialog("calc")
    WaitForExist(Calculator.wndCalculator(), 5)

def closeCalculator():
    Calculator.btnCloseCalc().Click()
    WaitForDisappear(Calculator.wndCalculator(), 5)

def operate_2Plus4():
    Calculator.btnTwo().Click()
    Calculator.btnPlus().Click()
    Calculator.btnFour().Click()
    Calculator.btnEqual().Click()

def operate_15Plus30():
    Calculator.btnOne().Click()
    Calculator.btnFive().Click()
    Calculator.btnPlus().Click()
    Calculator.btnThree().Click()
    Calculator.btnZero().Click()
    Calculator.btnEqual().Click()

def operate_99Minus83():
    Calculator.btnNine().Click()
    Calculator.btnNine().Click()
    Calculator.btnMinus().Click()
    Calculator.btnEight().Click()
    Calculator.btnThree().Click()
    Calculator.btnEqual().Click()

def getActualResult():
    actual_result = int(re.findall(r'\d+', Calculator.txtResults().AccessibleCurrentName())[0])
    return actual_result