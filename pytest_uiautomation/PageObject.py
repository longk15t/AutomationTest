import uiautomation as automation

class Notepad:
    @staticmethod
    def dlgRun():
        return automation.WindowControl(Name="Run")
    
    @staticmethod
    def wndNotepad():
        return automation.WindowControl(SubName="Notepad")

    @staticmethod
    def docEdit():
        return automation.DocumentControl(SubName="Text Editor")

    @staticmethod
    def mnuitemFile():
        return automation.MenuItemControl(Name="File")

    @staticmethod
    def mnuFile():
        return automation.MenuControl(Name="File")
    
    @staticmethod
    def mnuitemSave():
        return automation.MenuItemControl(SubName="Save")

    @staticmethod
    def dlgSave():
        return automation.WindowControl(SubName="Save")

    @staticmethod
    def editFileName():
        return automation.EditControl(SubName="File name")

    @staticmethod
    def btnSave():
        return automation.ButtonControl(Name="Save", searchFromControl=Notepad.dlgSave())

    @staticmethod
    def btnClose():
        return automation.ButtonControl(Name="Close", searchFromControl=Notepad.wndNotepad())

class Calculator:
    @staticmethod
    def wndCalculator():
        return automation.WindowControl(Name="Calculator") # Windows 10
    
    @staticmethod
    def txtResults():
        return automation.TextControl(AutomationId="CalculatorResults") # Windows 10

    @staticmethod
    def btnOne():
        return automation.ButtonControl(AutomationId="num1Button") # Windows 10

    @staticmethod
    def btnTwo():
        return automation.ButtonControl(AutomationId="num2Button") # Windows 10

    @staticmethod
    def btnThree():
        return automation.ButtonControl(AutomationId="num3Button") # Windows 10

    @staticmethod
    def btnFour():
        return automation.ButtonControl(AutomationId="num4Button") # Windows 10

    @staticmethod
    def btnFive():
        return automation.ButtonControl(AutomationId="num5Button") # Windows 10

    @staticmethod
    def btnEight():
        return automation.ButtonControl(AutomationId="num8Button") # Windows 10

    @staticmethod
    def btnNine():
        return automation.ButtonControl(AutomationId="num9Button") # Windows 10

    @staticmethod
    def btnPlus():
        return automation.ButtonControl(AutomationId="plusButton") # Windows 10

    @staticmethod
    def btnMinus():
        return automation.ButtonControl(AutomationId="minusButton") # Windows 10

    @staticmethod
    def btnEqual():
        return automation.ButtonControl(AutomationId="equalButton") # Windows 10

    @staticmethod
    def btnCloseCalc():
        return automation.ButtonControl(SubName="Close")